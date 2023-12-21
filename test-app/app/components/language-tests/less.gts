import { CodeBlock } from 'ember-shiki';

const codeExample = `
.button {
  &-ok {
    background-image: url("ok.png");
  }
  &-cancel {
    background-image: url("cancel.png");
  }

  &-custom {
    background-image: url("custom.png");
  }
}
.link {
  & + & {
    color: red;
  }

  & & {
    color: green;
  }

  && {
    color: blue;
  }

  &, &ish {
    color: cyan;
  }
}

// From https://lesscss.org/features/#parent-selectors-feature
`;

<template>
  <CodeBlock @code={{codeExample}} @language="less" />
</template>
