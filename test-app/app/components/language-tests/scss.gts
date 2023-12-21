import { CodeBlock } from 'ember-shiki';

const codeExample = `
nav {
  ul {
    margin: 0;
    padding: 0;
    list-style: none;
  }

  li { display: inline-block; }

  a {
    display: block;
    padding: 6px 12px;
    text-decoration: none;
  }
}

// From https://sass-lang.com/guide/
`;

<template>
  <CodeBlock @code={{codeExample}} @language="scss" />
</template>
