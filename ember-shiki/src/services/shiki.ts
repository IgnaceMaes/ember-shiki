import { getOwner } from '@ember/application';
import Service from '@ember/service';
import type {
  BUNDLED_LANGUAGES,
  BUNDLED_THEMES,
  Highlighter,
  Lang,
  Theme,
} from 'shiki';

import { task } from 'ember-concurrency';
import ApplicationInstance from '@ember/application/instance';
import { tracked } from '@glimmer/tracking';
import { LineHighlight } from '../components/code-block';

export default class ShikiService extends Service {
  @tracked isInitialized = false;

  highlighter?: Highlighter;

  BUNDLED_LANGUAGES?: typeof BUNDLED_LANGUAGES;

  BUNDLED_THEMES?: typeof BUNDLED_THEMES;

  loadLanguageTask = task({ enqueue: true }, async (language: Lang) => {
    if (!this.highlighter || !this.BUNDLED_LANGUAGES) {
      return;
    }

    if (!this.highlighter.getLoadedLanguages().includes(language)) {
      // Check if the language is supported by Shiki
      const bundles = this.BUNDLED_LANGUAGES.filter((bundle) => {
        // Languages are specified by their id, they can also have aliases (i. e. "js" and "javascript")
        return bundle.id === language || bundle.aliases?.includes(language);
      });
      if (bundles.length > 0) {
        await this.highlighter.loadLanguage(language);
      } else {
        // Do some error handling or default to another language or...
      }
    }
  });

  loadThemeTask = task({ enqueue: true }, async (theme: Theme) => {
    if (!this.highlighter || !this.BUNDLED_THEMES) {
      return;
    }

    if (!this.highlighter.getLoadedThemes().includes(theme)) {
      // Check if the theme is supported by Shiki
      if (this.BUNDLED_THEMES.includes(theme)) {
        await this.highlighter.loadTheme(theme);
      } else {
        // Do some error handling or default to another theme or...
      }
    }
  });

  get cdnUrl() {
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const config: any = (
      getOwner(this) as ApplicationInstance
    )?.resolveRegistration('config:environment');
    const { cdnUrl } = config['ember-shiki'] ?? {};
    if (cdnUrl) {
      return cdnUrl;
    }
    const SHIKI_VERSION = '0.14.3';
    return `https://cdn.jsdelivr.net/npm/shiki@${SHIKI_VERSION}/`;
  }

  initialize = task({ enqueue: true }, async () => {
    if (this.isInitialized) {
      return;
    }

    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const config: any = (
      getOwner(this) as ApplicationInstance
    )?.resolveRegistration('config:environment');
    const { defaultLanguages, defaultThemes } = config['ember-shiki'] ?? {};

    const {
      BUNDLED_LANGUAGES,
      BUNDLED_THEMES,
      getHighlighter,
      setCDN,
      setWasm,
    } = await import('shiki');

    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const fastboot: any = (getOwner(this) as ApplicationInstance)?.lookup(
      'service:fastboot',
    );

    if (fastboot && fastboot.isFastBoot) {
      const wasmResponse = await fetch(`${this.cdnUrl}dist/onig.wasm`).then(
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        (res: { arrayBuffer: () => any }) => res.arrayBuffer(),
      );
      setWasm(wasmResponse);
    }

    setCDN(this.cdnUrl);
    this.BUNDLED_LANGUAGES = BUNDLED_LANGUAGES;
    this.BUNDLED_THEMES = BUNDLED_THEMES;
    this.highlighter = await getHighlighter({
      themes: defaultThemes,
      langs: defaultLanguages ?? [],
    });
    this.isInitialized = true;
  });

  render = task(
    {},
    async (
      code: string,
      language?: Lang | string,
      theme?: Theme | string,
      lineHighlights?: LineHighlight[],
    ) => {
      if (!this.isInitialized) {
        await this.initialize.perform();
      }

      if (language) {
        await this.loadLanguageTask.perform(language as Lang);
      }
      if (theme) {
        await this.loadThemeTask.perform(theme as Theme);
      }
      const shikiConfig = {
        lang: language,
        theme: theme,
        lineOptions: lineHighlights
          ? this.mapLineHighlightsToShikiOptions(lineHighlights)
          : undefined,
      };

      return this.highlighter?.codeToHtml(code, shikiConfig) ?? '';
    },
  );

  mapLineHighlightsToShikiOptions(lineHighlights: LineHighlight[]) {
    const options = [];
    const optionToCssClass = {
      neutral: 'line--highlight-neutral',
      add: 'line--highlight-add',
      remove: 'line--highlight-remove',
    };

    for (const lineOption of lineHighlights) {
      const end = lineOption.end ?? lineOption.start;
      for (let line = lineOption.start; line <= end; line += 1) {
        options.push({
          line,
          classes: [optionToCssClass[lineOption.type]],
        });
      }
    }

    return options;
  }
}

// Don't remove this declaration: this is what enables TypeScript to resolve
// this service using `Owner.lookup('service:shiki')`, as well
// as to check when you pass the service name as an argument to the decorator,
// like `@service('shiki') declare altName: ShikiService;`.
declare module '@ember/service' {
  interface Registry {
    shiki: ShikiService;
  }
}
