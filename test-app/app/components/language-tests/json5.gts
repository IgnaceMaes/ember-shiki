import { CodeBlock } from 'ember-shiki';

const codeExample = `
// This file is written in JSON5 syntax, naturally, but npm needs a regular
// JSON file, so compile via \`npm run build\`. Be sure to keep both in sync!

{
    name: 'json5',
    version: '0.5.0',
    description: 'JSON for the ES5 era.',
    keywords: ['json', 'es5'],
    author: 'Aseem Kishore <aseem.kishore@gmail.com>',
    contributors: [
        // TODO: Should we remove this section in favor of GitHub's list?
        // https://github.com/aseemk/json5/contributors
        'Max Nanasy <max.nanasy@gmail.com>',
        'Andrew Eisenberg <andrew@eisenberg.as>',
        'Jordan Tucker <jordanbtucker@gmail.com>',
    ],
    main: 'lib/json5.js',
    bin: 'lib/cli.js',
    files: ["lib/"],
    dependencies: {},
    devDependencies: {
        gulp: "^3.9.1",
        'gulp-jshint': "^2.0.0",
        jshint: "^2.9.1",
        'jshint-stylish': "^2.1.0",
        mocha: "^2.4.5"
    },
    scripts: {
        build: 'node ./lib/cli.js -c package.json5',
        test: 'mocha --ui exports --reporter spec',
            // TODO: Would it be better to define these in a mocha.opts file?
    },
    homepage: 'http://json5.org/',
    license: 'MIT',
    repository: {
        type: 'git',
        url: 'https://github.com/aseemk/json5.git',
    },
}

// From https://github.com/mrmlnc/vscode-json5/blob/master/syntaxes/json5.json
`;

<template>
  <CodeBlock @code={{codeExample}} @language="json5" />
</template>
