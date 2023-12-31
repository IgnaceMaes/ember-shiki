import { CodeBlock } from 'ember-shiki';

const codeExample = `
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
SELECT ?name (COUNT(?friend) AS ?count)
WHERE { 
    ?person foaf:name ?name . 
    ?person foaf:knows ?friend . 
} GROUP BY ?person ?name

# From https://www.w3.org/TR/sparql11-overview/#sparql11-query`;

<template>
  <CodeBlock @code={{codeExample}} @language="sparql" />
</template>
