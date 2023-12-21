import { CodeBlock } from 'ember-shiki';

const codeExample = `
import type { TemplateOnlyComponent } from '@glimmer/component';

const Greet: TemplateOnlyComponent<{ name: string }> = <template>
  <p>Hello, {{@name}}!</p>
</template>

# From https://rfcs.emberjs.com/id/0779-first-class-component-templates
`;

<template>
  <CodeBlock @code={{codeExample}} @language="glimmer-ts" />
</template>
