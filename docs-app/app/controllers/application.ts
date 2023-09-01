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

  loadCustomGrammar = ``;

  changeTheme = (event: Event) => {
    this.theme = (event.target as HTMLSelectElement).value;
  };

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  get themes(): any {
    return this.shiki.BUNDLED_THEMES;
  }
}
