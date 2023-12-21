import { CodeBlock } from 'ember-shiki';

const codeExample = `
import { helper } from '@ember/component/helper';
import { modifier } from 'ember-modifier';

const plusOne = helper(([num]) => num + 1);

const setScrollPosition = modifier((element, [position]) => {
  element.scrollTop = position
});

<template>
  <div class="scroll-container" {{setScrollPosition @scrollPos}}>
    {{#each @items as |item index|}}
      Item #{{plusOne index}}: {{item}}
    {{/each}}
  </div>
</template>

# From https://github.com/ember-template-imports/ember-template-imports
`;

<template>
  <CodeBlock @code={{codeExample}} @language="glimmer-js" />
</template>
