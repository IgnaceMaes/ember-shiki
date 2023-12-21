import { CodeBlock } from 'ember-shiki';

const codeExample = `
{
  "plugins": [
    "postcss-flexbugs-fixes",
    [
      "postcss-preset-env",
      {
        "autoprefixer": {
          "flexbox": "no-2009"
        },
        "stage": 3,
        "features": {
          "custom-properties": false
        }
      }
    ]
  ]
}

// From https://nextjs.org/docs/pages/building-your-application/configuring/post-css
`;

<template>
  <CodeBlock @code={{codeExample}} @language="postcss" />
</template>
