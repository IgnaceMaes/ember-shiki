import { CodeBlock } from 'ember-shiki';

const codeExample = `
// Basic authentication
GET http://example.com
Authorization: Basic username password

###

// Digest authentication
GET http://example.com
Authorization: Digest username password

// The request body is provided in place
POST https://example.com:8080/api/html/post HTTP/1.1
Content-Type: application/json
Cookie: key=first-value

{ "key" : "value", "list": [1, 2, 3] }

// From https://www.jetbrains.com/help/idea/exploring-http-syntax.html#use-multipart-form-data
`;

<template>
  <CodeBlock @code={{codeExample}} @language="http" />
</template>
