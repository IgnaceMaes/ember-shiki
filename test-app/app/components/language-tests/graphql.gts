import { CodeBlock } from 'ember-shiki';

const codeExample = `
query($number_of_repos:Int!) {
  viewer {
    name
     repositories(last: $number_of_repos) {
       nodes {
         name
       }
     }
   }
}
variables {
   "number_of_repos": 3
}

# From https://docs.github.com/en/graphql/guides/forming-calls-with-graphql
`;

<template>
  <CodeBlock @code={{codeExample}} @language="graphql" />
</template>
