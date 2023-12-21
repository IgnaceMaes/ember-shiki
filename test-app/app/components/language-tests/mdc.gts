import { CodeBlock } from 'ember-shiki';

const codeExample = `
::card
---
icon: Icon
title: A complex card.
---

Default slot

#description
  ::alert
    Description slot
  ::
::
`;

<template>
  <CodeBlock @code={{codeExample}} @language="mdc" />
</template>
