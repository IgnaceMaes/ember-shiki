import { CodeBlock } from 'ember-shiki';

const codeExample = `
name: Check dist/

on:
  push:
    branches:
      - main
    paths-ignore:
      - '**.md'
  pull_request:
    paths-ignore:
      - '**.md'

jobs:
  check-dist:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v3

      - name: Set Node.js 16.x
        uses: actions/setup-node@v3
        with:
          node-version: 16.x
          cache: npm

      - name: Install dependencies
        run: npm ci

      - name: Rebuild the dist/ directory
        run: |
          npm run build:compile
          npm run build:package

      - name: Compare the expected and actual dist/ directories
        run: |
          if [ "$(git diff --ignore-space-at-eol dist/ | wc -l)" -gt "0" ]; then
            echo "Detected uncommitted changes after build.  See status below:"
            git diff
            exit 1
          fi
        id: diff

      # If index.js was different than expected, upload the expected version as an artifact
      - uses: actions/upload-artifact@v3
        if: \${{ failure() && steps.diff.conclusion == 'failure' }}
        with:
          name: dist
          path: dist/

# From https://github.com/actions/add-to-project/blob/main/.github/workflows/check-dist.yml
`;

<template>
  <CodeBlock @code={{codeExample}} @language="yaml" />
</template>
