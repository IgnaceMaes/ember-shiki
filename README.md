[![Build Status][build-status-img]][build-status-link]
[![NPM][npm-badge-img]][npm-badge-link]
[![Ember Observer Score][ember-observer-badge]][ember-observer-url]
![Ember Version][ember-version]

# 🌈 ember-shiki

_Embed code snippets with pretty syntax highlighting in Ember.js, powered by Shiki_

[build-status-img]: https://github.com/IgnaceMaes/ember-shiki/workflows/CI/badge.svg
[build-status-link]: https://github.com/IgnaceMaes/ember-shiki
[npm-badge-img]: https://badge.fury.io/js/ember-shiki.svg
[npm-badge-link]: http://badge.fury.io/js/ember-shiki
[ember-observer-badge]: http://emberobserver.com/badges/ember-shiki.svg
[ember-observer-url]: http://emberobserver.com/addons/ember-shiki
[ember-version]: https://img.shields.io/badge/Ember-4.4+-brightgreen.svg

ember-shiki is an addon which makes using [Shiki](https://github.com/shikijs/shiki) in Ember a breeze. It offers a drop-in component to get syntax highlighting for code. This is perfect for documentation sites, blogs, or wherever you need pretty formatted code.

- ✅ TypeScript and Glint ready
- 🧵 V2 addon format
- 🚀 FastBoot support
- 📦 Lazy loaded packages &mdash; minimal impact on initial load
- #️⃣ Syntax highlighting for 170+ languages &mdash; including `.gjs` and `.gts`
- 🎨 Theme support: 29 included themes &mdash; load any external
- 🔢 Line number support
- 🔤 Custom fonts &mdash; including font ligature support
- 📋 Copy code to clipboard
- 🏷️ Code block naming
- 🗂️ Group code blocks with tabs
- ✨ Line highlighting
- 🖌️ Stylable via CSS variables

## Compatibility

- Embroider or ember-auto-import v2
- Ember.js v4.4 or above
- Node.js v16 or above

## Installation

```sh
npm install ember-shiki
# or
yarn add ember-shiki
# or
pnpm install ember-shiki
```

## Usage

Basic usage:

```js
import { CodeBlock } from 'ember-shiki';

<template>
  <CodeBlock
    @code="console.log('hello world');"
    @language="js"
  />
</template>
```

See the deployed [docs app](https://ember-shiki.pages.dev/) for an interactive demo and information on all options.

## Contributing

See the [Contributing](CONTRIBUTING.md) guide for details.

## Acknowledgements

Heavily inspired by [VitePress](https://github.com/vuejs/vitepress).

## License

This project is licensed under the [MIT License](LICENSE.md).
