import { CodeBlock } from 'ember-shiki';

const codeExample = `
; last modified 1 April 2001 by John Doe
[owner]
name = John Doe
organization = Acme Widgets Inc.

[database]
; use IP address in case network name resolution is not working
server = 192.0.2.62\`
port = 143
file = "payroll.dat"

; From https://en.wikipedia.org/wiki/INI_file
`;

<template>
  <CodeBlock @code={{codeExample}} @language="ini" />
</template>