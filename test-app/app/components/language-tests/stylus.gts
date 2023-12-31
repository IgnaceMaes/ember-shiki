import { CodeBlock } from 'ember-shiki';

const codeExample = `
vendor(prop, args)
  -webkit-{prop} args
  -moz-{prop} args
  {prop} args

border-radius()
  vendor('border-radius', arguments)

box-shadow()
  vendor('box-shadow', arguments)

button
  border-radius 1px 2px / 3px 4px

border-radius() {
  -webkit-border-radius: arguments;
  -moz-border-radius: arguments;
  border-radius: arguments;
}

body a {
  font: 12px/1.4 "Lucida Grande", Arial, sans-serif;
  background: black;
  color: #ccc;
}

form input {
  padding: 5px;
  border: 1px solid;
  border-radius: 5px;
}

// From https://stylus-lang.com/docs/css-style.html#example
`;

<template>
  <CodeBlock @code={{codeExample}} @language="stylus" />
</template>
