import { CodeBlock } from 'ember-shiki';

const codeExample = `
 @prefix foaf: <http://xmlns.com/foaf/0.1/> .
 @prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .

 <http://example.org/alice#me> a foaf:Person .
 <http://example.org/alice#me> foaf:name "Alice" .
 <http://example.org/alice#me> foaf:mbox <mailto:alice@example.org> .
 <http://example.org/alice#me> foaf:knows <http://example.org/bob#me> .
 <http://example.org/bob#me> foaf:knows <http://example.org/alice#me> .
 <http://example.org/bob#me> foaf:name "Bob" .
 <http://example.org/alice#me> foaf:knows <http://example.org/charlie#me> .
 <http://example.org/charlie#me> foaf:knows <http://example.org/alice#me> .
 <http://example.org/charlie#me> foaf:name "Charlie" .
 <http://example.org/alice#me> foaf:knows <http://example.org/snoopy> .
 <http://example.org/snoopy> foaf:name "Snoopy"@en .

# From https://www.w3.org/TR/sparql11-overview/#Example`;

<template>
  <CodeBlock @code={{codeExample}} @language="turtle" />
</template>
