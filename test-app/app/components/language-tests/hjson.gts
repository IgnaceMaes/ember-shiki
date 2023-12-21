import { CodeBlock } from 'ember-shiki';

const codeExample = `
{
  // use #, // or /**/ comments,
  // omit quotes for keys
  key: 1
  // omit quotes for strings
  contains: everything on this line
  // omit commas at the end of a line
  cool: {
    foo: 1
    bar: 2
  }
  // allow trailing commas
  list: [
    1,
    2,
  ]
  // and use multiline strings
  realist:
    '''
    My half empty glass,
    I will fill your empty half.
    Now you are half full.
    '''
  // From: https://hjson.github.io/
}
`;

<template>
  <CodeBlock @code={{codeExample}} @language="hjson" />
</template>
