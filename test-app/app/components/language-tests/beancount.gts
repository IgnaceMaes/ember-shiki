import { CodeBlock } from 'ember-shiki';

const codeExample = `
2012-11-03 * "Transfer to pay credit card"
  Assets:MyBank:Checking            -400.00 USD
  Liabilities:CreditCard             400.00 USD

2012-11-03 * "Transfer to account in Canada"
  Assets:MyBank:Checking            -400.00 USD @ 1.09 CAD
  Assets:FR:SocGen:Checking          436.01 CAD

; https://beancount.github.io/docs/beancount_language_syntax.html#costs-and-prices
`;

<template>
  <CodeBlock @code={{codeExample}} @language="beancount" />
</template>
