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

  cssVariables = `:root {
  --ember-shiki-padding-x: 24px;
  --ember-shiki-padding-y: 20px;
  --ember-shiki-border-radius: 6px;
  --ember-shiki-background-color: #161b22;
  --ember-shiki-copy-background-color: #161b22;
  --ember-shiki-line-number-color: rgb(115 138 148 / 40%);
  --ember-shiki-font: ui-monospace, sfmono-regular, "SF Mono", menlo, monaco,
    consolas, "Liberation Mono", "Courier New", monospace;
  --ember-shiki-line-number-start: 1;
  --ember-shiki-line-height: 1.7;
  --ember-shiki-font-size: 0.875rem;
  --ember-shiki-icon-copy: url('data:image/svg+xml,<svg fill="none" stroke="rgba(128,128,128,1)" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M15.666 3.888A2.25 2.25 0 0013.5 2.25h-3c-1.03 0-1.9.693-2.166 1.638m7.332 0c.055.194.084.4.084.612v0a.75.75 0 01-.75.75H9a.75.75 0 01-.75-.75v0c0-.212.03-.418.084-.612m7.332 0c.646.049 1.288.11 1.927.184 1.1.128 1.907 1.077 1.907 2.185V19.5a2.25 2.25 0 01-2.25 2.25H6.75A2.25 2.25 0 014.5 19.5V6.257c0-1.108.806-2.057 1.907-2.185a48.208 48.208 0 011.927-.184"></path></svg>');
  --ember-shiki-icon-copied: url('data:image/svg+xml,<svg fill="none" stroke="rgba(128,128,128,1)" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M11.35 3.836c-.065.21-.1.433-.1.664 0 .414.336.75.75.75h4.5a.75.75 0 00.75-.75 2.25 2.25 0 00-.1-.664m-5.8 0A2.251 2.251 0 0113.5 2.25H15c1.012 0 1.867.668 2.15 1.586m-5.8 0c-.376.023-.75.05-1.124.08C9.095 4.01 8.25 4.973 8.25 6.108V8.25m8.9-4.414c.376.023.75.05 1.124.08 1.131.094 1.976 1.057 1.976 2.192V16.5A2.25 2.25 0 0118 18.75h-2.25m-7.5-10.5H4.875c-.621 0-1.125.504-1.125 1.125v11.25c0 .621.504 1.125 1.125 1.125h9.75c.621 0 1.125-.504 1.125-1.125V18.75m-7.5-10.5h6.375c.621 0 1.125.504 1.125 1.125v9.375m-8.25-3l1.5 1.5 3-3.75"></path></svg>');
}`;

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
