import RouteTemplate from 'ember-route-template';
import Sidebar from 'docs-app/components/sidebar';
import SectionTitle from 'docs-app/components/section-title';
import SectionSubtitle from 'docs-app/components/section-subtitle';
import InlineCode from 'docs-app/components/inline-code';
import { CodeBlock, CodeGroup } from 'ember-shiki';
import { array } from '@ember/helper';
import { hash } from '@ember/helper';
import { on } from '@ember/modifier';
import pageTitle from 'ember-page-title/helpers/page-title';

import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { service } from '@ember/service';
import { ShikiService } from 'ember-shiki';

class Application extends Component<{ Args: { model: null } }> {
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

  <template>
    {{pageTitle
      "ember-shiki - Embed code snippets with pretty syntax highlighting in Ember.js, powered by Shiki"
    }}

    {{! template-lint-disable no-inline-styles }}
    <div class="fixed top-0 left-0 h-screen w-1/2 bg-black/20" />
    <main
      class="relative mx-auto flex max-w-full 2xl:block 2xl:max-w-4xl"
      style="--ember-shiki-background-color: #24292e;"
    >
      <Sidebar />
      <article
        class="max-w-full flex-1 bg-neutral-900 p-4 md:p-12 2xl:py-12 2xl:px-24"
      >
        <div class="mx-auto max-w-full md:max-w-lg lg:max-w-2xl 2xl:max-w-4xl">
          <h1
            id="ember-shiki"
            class="flex items-center text-5xl font-extrabold text-gray-100"
          >ember-shiki</h1>
          <p class="mt-2 text-lg font-normal italic text-gray-500">Embed code
            snippets with pretty syntax highlighting in Ember.js, powered by Shiki</p>
          <p>Ember-shiki is an addon which makes using
            <a
              href="https://github.com/shikijs/shiki"
              class="font-medium text-blue-600 underline hover:no-underline"
            >shiki</a>
            in Ember a breeze. It offers a drop-in component to get syntax
            highlighting for code. This is perfect for documentation sites (such as
            this page), blogs, or wherever you need pretty formatted code.</p>

          <ul class="list-inside list-disc space-y-1">
            <li>
              ✅ TypeScript and Glint ready
            </li>
            <li>
              🧵 V2 addon format
            </li>
            <li>
              🚀 FastBoot support
            </li>
            <li>
              📦 Lazy loaded packages &mdash; minimal impact on initial load
            </li>
            <li>
              #️⃣ Syntax highlighting for 170+ languages &mdash; including `.gjs` and
              `.gts`
            </li>
            <li>
              🎨 Theme support: 29 included themes &mdash; load any external
            </li>
            <li>
              🔢 Line number support
            </li>
            <li>
              🔤 Custom fonts &mdash; including font ligature support
            </li>
            <li>
              📋 Copy code to clipboard
            </li>
            <li>
              🏷️ Code block naming
            </li>
            <li>
              🗂️ Group code blocks with tabs
            </li>
            <li>
              ✨ Line highlighting
            </li>
            <li>
              🖌️ Stylable via CSS variables
            </li>
          </ul>

          <hr class="my-16 h-px border-0 bg-gray-700" />

          <SectionTitle @text="Getting started" />
          <SectionSubtitle @text="Installation" />

          <CodeGroup @names={{array "npm" "yarn" "pnpm"}} as |Tab|>
            <Tab @name="pnpm">
              <CodeBlock @code={{"pnpm install ember-shiki"}} @language="sh" />
            </Tab>
            <Tab @name="npm">
              <CodeBlock @code={{"npm install ember-shiki"}} @language="sh" />
            </Tab>
            <Tab @name="yarn">
              <CodeBlock @code={{"yarn add ember-shiki"}} @language="sh" />
            </Tab>
          </CodeGroup>
          <p>
            Make sure you meet the following requirements:
          </p>
          <ul class="list-inside list-disc space-y-1">
            <li>Embroider or ember-auto-import v2</li>
            <li>Ember.js v4.4 or above</li>
            <li>Node.js v16 or above</li>
          </ul>

          <SectionSubtitle @text="Usage" />

          <p>After installing the addon, the
            <InlineCode>CodeBlock</InlineCode>
            component can be used to syntax highlight a snippet. Simply pass the
            code as a string and set the language which should be used for parsing.</p>

          <div class="render-preview">
            <CodeBlock @code="console.log('hello world');" @language="js" />
          </div>
          <CodeGroup
            @names={{array "Template tag (.gjs/.gts)" "Loose mode (.hbs)"}}
            as |Tab|
          >
            <Tab @name="Template tag (.gjs/.gts)">
              <CodeBlock @code={{this.usageCode}} @language="gjs" />
            </Tab>
            <Tab @name="Loose mode (.hbs)">
              <CodeBlock @code={{this.usageCodeHbs}} @language="hbs" />
            </Tab>
          </CodeGroup>

          <SectionSubtitle @text="Glint types" />
          <p>This addon ships Glint types in a template registery. To use them in
            loose mode, register them in your global types declaration.</p>

          <CodeBlock
            @code={{this.glintTypes}}
            @language="ts"
            @name="types/global.d.ts"
            @lineHighlights={{array
              (hash start=2 type="add")
              (hash start=5 type="add")
            }}
          />

          <SectionSubtitle @text="Configure (optional)" />
          <p>By default all languages and themes are lazy loaded. Shiki loads the
            <InlineCode>nord</InlineCode>
            theme by default if no theme is specified. This docs website uses
            <InlineCode>github-dark</InlineCode>.</p>
          <p>The global defaults can be adjusted in the
            <InlineCode>environment.js</InlineCode>
            file by adding an entry for
            <InlineCode>ember-shiki</InlineCode>.</p>

          <CodeBlock
            @code={{this.setupConfigCode}}
            @language="js"
            @name="app/config/environment.js"
            @lineHighlights={{array (hash start=4 end=7 type="add")}}
          />
          <p>Shiki languages, themes, and WASM are loaded from a CDN by default. If
            you wish to change the CDN, or self-host these resources, you can set a
            custom
            <InlineCode>cdnUrl</InlineCode>
            in the environment config.</p>

          <hr class="my-16 h-px border-0 bg-gray-700" />

          <SectionTitle @text="Options" />
          <SectionSubtitle @text="Language" />
          <p>Shiki supports 170+ languages out of the box. Simply pass in the
            language identifier to the code block component to enable syntax
            highlighting for that grammar.</p>

          <div class="render-preview">
            <CodeBlock
              @code="export type foo = 'bar' | null; // For example, TypeScript!"
              @language="ts"
            />
          </div>
          <CodeBlock @code={{this.codeLanguage}} @language="hbs" />

          <SectionSubtitle @text="Theme" />

          <p>Shiki ships with 29 themes built in. These can be used out of the box.</p>

          <p>
            Select a theme to preview:
            {{#if this.shiki.isInitialized}}
              {{! template-lint-disable require-input-label }}
              <select
                {{on "change" this.changeTheme}}
                class="block w-full rounded-lg border border-gray-600 bg-gray-700 p-2.5 text-sm text-white placeholder-gray-400 focus:border-blue-500 focus:ring-blue-500"
              >
                <option disabled selected>Select a theme</option>
                {{#each this.themes as |theme|}}
                  <option value="{{theme}}">{{theme}}</option>
                {{/each}}
              </select>
            {{/if}}
          </p>

          <div class="render-preview">
            <CodeBlock
              @code="const foo = (bar) => { bar === 1 };"
              @theme={{this.theme}}
              @language="js"
            />
          </div>
          <CodeBlock @code={{this.codeForTheme}} @language="hbs" />

          <SectionSubtitle @text="Code block name" />
          <p>A code block can be given a name to clarify it's purpose or type.</p>

          <div class="render-preview">
            <CodeBlock
              @code="const foo = (bar) => { bar === 1 };"
              @language="js"
              @name="example-name.js"
            />
          </div>
          <CodeBlock @code={{this.codeName}} @language="hbs" />

          <SectionSubtitle @text="Copy to clipboard" />
          <p>A copy to clipboard button is shown on hover by default. If you want to
            change this behaviour you can set the
            <InlineCode>showCopyButton</InlineCode>
            argument flag.</p>
          <div class="render-preview">
            <CodeBlock
              @code="const foo = (bar) => { bar === 1 };"
              @language="js"
              @showCopyButton={{false}}
            />
          </div>
          <CodeBlock @code={{this.copyButton}} @language="hbs" />

          <p>This default can also be changed globally by setting the
            <InlineCode>showCopyButton</InlineCode>
            flag in the environment config.</p>

          <SectionSubtitle @text="Code groups" />
          <p>Code blocks can be grouped with tabs. Every tab has it's own isolated
            code block, meaning you can mix languages, themes, or basically any
            config option.</p>
          <div class="render-preview">
            <CodeGroup @names={{array "foo-bar.css" "foo-bar.hbs"}} as |Tab|>
              <Tab @name="foo-bar.css">
                <CodeBlock @code="body { color: red; }" @language="css" />
              </Tab>
              <Tab @name="foo-bar.hbs">
                <CodeBlock @code={{"<div>Hello {{name}}</div>"}} @language="hbs" />
              </Tab>
            </CodeGroup>
          </div>
          <CodeBlock @code={{this.codeGroups}} @language="hbs" />

          <SectionSubtitle @text="Line numbers" />
          <p>Code blocks have built in support for line numbering.</p>

          <div class="render-preview">
            <CodeBlock
              @code="// Line numbers!
    function foo(x, y) {
      return x + y;
    }"
              @language="js"
              @showLineNumbers={{true}}
            />
          </div>
          <CodeBlock @code={{this.lineNumbersCode}} @language="hbs" />

          <p>The start line number can also be adjusted in case your snippet doesn't
            start at line 1.</p>
          <div class="render-preview">
            <CodeBlock
              @code="// Line numbers - with custom offset!
    function foo(x, y) {
      return x + y;
    }"
              @language="gjs"
              @showLineNumbers={{true}}
              @lineNumberStart={{12}}
            />
          </div>
          <CodeBlock @code={{this.lineNumbersCodeCustomStart}} @language="hbs" />

          <p>Line numbers are disabled by default. If you wish to enable them for
            all code blocks at once, you can set the
            <InlineCode>showLineNumbers</InlineCode>
            flag in the environment config to
            <InlineCode>true</InlineCode>.</p>

          <SectionSubtitle @text="Line highlighting" />
          <p>Specific lines, or ranged of lines, can be highlighted. A highlight
            type can be
            <InlineCode>highlight</InlineCode>,
            <InlineCode>add</InlineCode>, or
            <InlineCode>remove</InlineCode>.</p>
          <p>Here's a demonstration on a code example of the Embroider readme
            explaining how to set it up.</p>

          <div class="render-preview">
            <CodeBlock
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
            />
          </div>
          <CodeBlock @code={{this.lineHighlightingAddRemove}} @language="hbs" />

          <SectionSubtitle @text="Loading state" />
          <p>Shiki highlights code asynchronously. The code block component offers a
            named block to render a custom loading state. By default, the code is
            rendered without syntax highlighting to prevent scroll jumps.</p>

          <p>Besides a loading named block, there's also a callback function which
            is invoked when the rendering is complete.</p>

          <CodeBlock @code={{this.loadingState}} @language="hbs" />

          <SectionSubtitle @text="Styling" />
          <p>The components in this addon can be styled by overriding CSS variables.
            For example, any external font can be loaded and used. Even fonts with
            ligature support work out of the box.</p>

          <div class="render-preview">
            <CodeBlock
              @code={{"const foo = (bar) => { bar === 1 };"}}
              @language="js"
              style="--ember-shiki-font: 'JetBrains Mono'"
            />
          </div>
          <CodeBlock @code={{this.fontLigaturesCode}} @language="hbs" />

          <p>Here is a list of CSS variables which are currently defined:</p>
          <CodeBlock @code={{this.cssVariables}} @language="css" />

          <hr class="my-16 h-px border-0 bg-gray-700" />

          <SectionTitle @text="Advanced" />
          <SectionSubtitle @text="Custom grammar" />

          <p>Shiki supports loading custom language grammar definitions in the
            TextMate format. This can be useful if a new language hasn't landed in
            the base package yet, or if you want to use a custom definition for an
            existing language.</p>

          <p>A great use case for this is Ember's template syntax. Ember uses
            Glimmer to render component with templates defined in a
            <InlineCode>.hbs</InlineCode>
            file. Glimmer grammar, however, is more extensive than handlebars. If
            you want to opt into Glimmer syntax parsing, you can load custom Glimmer
            grammar for the
            <InlineCode>handlebars</InlineCode>
            language definition. Here's an example of how you could do it:</p>

          <CodeBlock
            @name="app/routes/application.js"
            @code={{this.loadCustomGrammar}}
            @language="js"
          />
          <p>Note: this is just an example way of how it's made possible, but not
            the recommended approach per se. In the future a more ergonomic,
            officially recommended way might be added.</p>

          <SectionSubtitle @text="Custom theme" />
          <p>Shiki ships with 29 themes available by default, but any VS Code theme
            can be loaded dynamically. Simply register the theme config JSON and
            pass the theme name to the
            <InlineCode>CodeBlock</InlineCode>
            component.</p>

          <p>The following example shows a custom theme
            <InlineCode>Night Owl</InlineCode>:</p>

          <CodeBlock
            @name="app/routes/application.js"
            @code={{this.loadCustomTheme}}
            @language="js"
            @theme="Night Owl"
            style="--ember-shiki-background-color: #011627"
          />
          <p>Note: this is just an example way of how it's made possible, but not
            the recommended approach per se. In the future a more ergonomic,
            officially recommended way might be added.</p>

          <SectionSubtitle @text="Fastboot" />
          <p>The
            <InlineCode>CodeBlock</InlineCode>
            component automatically detects Fastboot if it's used in the app and
            makes sure the rendering awaits until the highlighting is completed.</p>

          <p>Shiki makes use of
            <InlineCode>fetch</InlineCode>
            which is not available in the runtime environment of Fastboot by
            default. To make it available, set the globals in your fastboot config.
            Note that fetch is only built into Node.js starting from v18. If you
            want to support older versions you can install and import
            <InlineCode>node-fetch</InlineCode>.</p>

          <CodeBlock
            @name="config/fastboot.js"
            @code={{this.fastbootConfig}}
            @language="js"
          />
          <p>Prember for pre-rendering the app to static html is also supported.
            Make sure to use at least version
            <InlineCode>^2.0.0</InlineCode>
            so the
            <InlineCode>fastboot.js</InlineCode>
            config is correctly applied.</p>

          {{outlet}}
        </div>
      </article>
    </main>
  </template>
}

export default RouteTemplate(Application);
