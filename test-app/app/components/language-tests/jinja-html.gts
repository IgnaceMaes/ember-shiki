import { CodeBlock } from 'ember-shiki';

const codeExample = `
{# templates/results.html #}

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Results</title>
</head>

<body>
  <h1>{{ test_name }} Results</h1>
  <ul>
  {% for student in students %}
    <li>
      <em>{{ student.name }}:</em> {{ student.score }}/{{ max_score }}
    </li>
  {% endfor %}
  </ul>
</body>
</html>

{# From https://realpython.com/primer-on-jinja-templating/#use-if-statements #}
`;

<template>
  <CodeBlock @code={{codeExample}} @language="jinja-html" />
</template>
