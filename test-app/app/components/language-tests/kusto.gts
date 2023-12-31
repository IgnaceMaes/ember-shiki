import { CodeBlock } from 'ember-shiki';

const codeExample = `
let dt = datetime(2017-01-29 09:00:05);
print
v1=format_datetime(dt,'yy-MM-dd [HH:mm:ss]'),
v2=format_datetime(dt, 'yyyy-M-dd [H:mm:ss]'),
v3=format_datetime(dt, 'yy-MM-dd [hh:mm:ss tt]')

// From https://learn.microsoft.com/en-us/azure/data-explorer/kusto/query/
`;

<template>
  <CodeBlock @code={{codeExample}} @language="kusto" />
</template>
