import { CodeBlock } from 'ember-shiki';

const codeExample = `
Country,Region,Population,Area square miles,GDP per capita
Afghanistan,ASIA (EX. NEAR EAST),31056997,647500,700
Albania,EASTERN EUROPE,3581655,28748,4500
Algeria,NORTHERN AFRICA,32930091,2381740,6000
American Samoa,OCEANIA,57794,199,8000`;

<template>
  <CodeBlock @code={{codeExample}} @language="csv" />
</template>
