import { CodeBlock } from 'ember-shiki';

const codeExample = `
/* This CSS will print because %message-shared is extended. */
%message-shared
  border: 1px solid #ccc
  padding: 10px
  color: #333

// This CSS won't print because %equal-heights is never extended.
%equal-heights
  display: flex
  flex-wrap: wrap

.message
  @extend %message-shared

.success
  @extend %message-shared
  border-color: green

.error
  @extend %message-shared
  border-color: red

.warning
  @extend %message-shared
  border-color: yellow

// From https://sass-lang.com/guide/
`;

<template>
  <CodeBlock @code={{codeExample}} @language="sass" />
</template>
