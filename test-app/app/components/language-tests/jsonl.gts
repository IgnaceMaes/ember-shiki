import { CodeBlock } from 'ember-shiki';

const codeExample = `
{"name": "Gilbert", "wins": [["straight", "7♣"], ["one pair", "10♥"]]}
{"name": "Alexa", "wins": [["two pair", "4♠"], ["two pair", "9♠"]]}
{"name": "May", "wins": []}
{"name": "Deloise", "wins": [["three of a kind", "5♣"]]}
{
  "name": "Gilbert",
  "wins": [
    [
      "straight",
      "7♣"
    ],
    [
      "one pair",
      "10♥"
    ]
  ]
}
{
  "name": "Alexa",
  "wins": [
    [
      "two pair",
      "4♠"
    ],
    [
      "two pair",
      "9♠"
    ]
  ]
}
// From https://jsonlines.org/examples/
`;

<template>
  <CodeBlock @code={{codeExample}} @language="jsonl" />
</template>
