import Controller from '@ember/controller';
import { tracked } from '@glimmer/tracking';
import { service } from '@ember/service';
import { ShikiService } from 'ember-shiki';

export default class Application extends Controller {
  @service declare shiki: ShikiService;

  @tracked theme = 'github-dark';

  codeLanguage = `<CodeBlock
  @code="export type foo = 'bar' | null; // For example, TypeScript!"
  @language="ts"
/>`;

  codeName = `<CodeBlock
  @code="const foo = (bar) => { bar === 1 };"
  @language="js"
  @name="example-name.js"
/>`;

  glintTypes = `import '@glint/environment-ember-loose';
import type EmberShikiRegistery from 'ember-shiki/template-registry';

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry extends EmberShikiRegistery, /* ... */ {
    // local entries
  }
}`;

  usageCode = `import { CodeBlock } from 'ember-shiki';

<template>
  <CodeBlock
    @code="console.log('hello world');"
    @language="js"
  />
</template>`;

  usageCodeHbs = `<CodeBlock
  @code="console.log('hello world');"
  @language="js"
/>`;

  code = `import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import Icon from 'example-app/components/icon';
import { on } from '@ember/modifier';

export default class CopyToClipboard extends Component {
  @tracked isCopied = false;

  copyToClipboard = async () => {
    await navigator.clipboard.writeText(this.args.text);
    this.isCopied = true;
  }

  <template>
    <button {{on 'click' this.copyToClipboard}}>
      {{if this.isCopied 'Copied!' 'Click to copy'}}
      <Icon @name={{"clipboard"}} />
    </button>
  </template>
}`;

  setupConfigCode = `module.exports = function (environment) {
  const ENV = {
    // ...
    'ember-shiki': {
      defaultLanguages: ['gjs', 'gts', 'css'],
      defaultThemes: ['github-dark'],
    },
  };
  // ...
};`;

  lineNumbersCode = `<CodeBlock
  @code="// Line numbers!
function foo(x, y) {
  return x + y;
}"
  @language="js"
  @showLineNumbers={{true}}
/>`;

  lineNumbersCodeCustomStart = `<CodeBlock
  @code="// Line numbers - with custom offset!
function foo(x, y) {
  return x + y;
}"
  @language="js"
  @showLineNumbers={{true}}
  @lineNumberStart={{12}}
/>`;

  fontLigaturesCode = `<CodeBlock
  @code="const foo = (bar) => { bar === 1 };"
  @language="js"
  style="--ember-shiki-font: 'JetBrains Mono'"
/>`;

  get codeForTheme() {
    return `<CodeBlock
  @code="const foo = (bar) => { bar === 1 };"
  @language="js"
  @theme="${this.theme}"
/>`;
  }

  fontComicSans = `<CodeBlock
  @code="const foo = (bar) => { bar === 1 };"
  @language="js"
  style="--ember-shiki-font: 'Comic Sans MS', 'Comic Sans'"
/>`;

  loadingState = `<CodeBlock
  @code="const foo = (bar) => { bar === 1 };"
  @language="js"
  @onCodeHighlighted={{this.yourLoadedStateCallback}}
>
  <:loading>
    Custom loading state here ...
  </:loading>
</CodeBlock>`;

  lineHighlightingAddRemove = `<CodeBlock
  @code={{"module.exports = function (defaults) {
  const app = new EmberApp(defaults, {});
  return app.toTree();
  const { Webpack } = require('@embroider/webpack');
  return require('@embroider/compat').compatBuild(app, Webpack);
}"}}
  @language="js"
  @lineHighlights={{array
    (hash start=3 type="remove")
    (hash start=4 end=5 type="add")
  }}
/>`;

  copyButton = `<CodeBlock
  @code="const foo = (bar) => { bar === 1 };"
  @language="js"
  @showCopyButton={{false}}
/>`;

  codeGroups = `<CodeGroup @names={{array "foo-bar.css" "foo-bar.hbs"}} as |Tab|>
  <Tab @name="foo-bar.css">
    <CodeBlock
      @code="body { color: red; }"
      @language="css"
    />
  </Tab>
  <Tab @name="foo-bar.hbs">
    <CodeBlock
      @code={{"<div>Hello {{name}}</div>"}}
      @language="hbs"
    />
  </Tab>
</CodeGroup>`;

  loadCustomGrammar = `import Route from '@ember/routing/route';
import { service } from '@ember/service';

export default class ApplicationRoute extends Route {
  @service shiki;

  async beforeModel() {
    await this.loadCustomGrammar();
  }

  async loadCustomGrammar() {
    // Shiki has to be initialized before the highlighter is available
    await this.shiki.initialize.perform();
    // Get custom grammar
    const grammarTextmateDefinition = 'https://raw.githubusercontent.com/IgnaceMaes/glimmer-textmate-grammar/main/handlebars.tmLanguage.json';
    const glimmerHandlebarsGrammar = await fetch(grammarTextmateDefinition);
    const glimmerHandlebars = {
      id: 'handlebars',
      path: '',
      scopeName: 'text.html.handlebars',
      grammar: await glimmerHandlebarsGrammar.json(),
      aliases: ['hbs'],
    };
    // Load embedded languages first
    await this.shiki.loadLanguageAndEmbedded('js');
    await this.shiki.loadLanguageAndEmbedded('css');
    // Finally, register the custom language to the Shiki highlighter
    await this.shiki.highlighter?.loadLanguage(glimmerHandlebars);
  }
}`;

  loadCustomTheme = `import Route from '@ember/routing/route';
import { service } from '@ember/service';

export default class ApplicationRoute extends Route {
  @service shiki;

  async beforeModel() {
    await this.loadCustomTheme();
  }

  async loadCustomTheme() {
    // Shiki has to be initialized before the highlighter is available
    await this.shiki.initialize.perform();
    // Fetch custom theme
    const nightOwlTheme = await fetch(
      'https://raw.githubusercontent.com/sdras/night-owl-vscode-theme/main/themes/Night%20Owl-color-theme.json',
    );
    const nightOwlThemeJson = await nightOwlTheme.json();
    // Make sure the name is set, as this is the value to be passed to the CodeBlock theme argument
    nightOwlThemeJson.name = 'Night Owl';
    await this.shiki.highlighter?.loadTheme(nightOwlThemeJson);
  }
}`;

  fastbootConfig = `module.exports = function () {
  return {
    buildSandboxGlobals(defaultGlobals) {
      return Object.assign({}, defaultGlobals, {
        fetch: fetch,
        AbortController,
        ReadableStream:
          typeof ReadableStream !== 'undefined'
            ? ReadableStream
            : require('node:stream/web').ReadableStream,
        WritableStream:
          typeof WritableStream !== 'undefined'
            ? WritableStream
            : require('node:stream/web').WritableStream,
        TransformStream:
          typeof TransformStream !== 'undefined'
            ? TransformStream
            : require('node:stream/web').TransformStream,
        Headers: typeof Headers !== 'undefined' ? Headers : undefined,
      });
    },
  };
};`;

  changeTheme = (event: Event) => {
    this.theme = (event.target as HTMLSelectElement).value;
  };

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  get themes(): any {
    return this.shiki.BUNDLED_THEMES;
  }
}
