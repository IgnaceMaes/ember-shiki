import { CodeBlock } from 'ember-shiki';

const codeExample = `
@{
    string message = "foreignObject example with Scalable Vector Graphics (SVG)";
}

<svg width="200" height="200" xmlns="http://www.w3.org/2000/svg">
    <rect x="0" y="0" rx="10" ry="10" width="200" height="200" stroke="black"
        fill="none" />
    <foreignObject x="20" y="20" width="160" height="160">
        <p>@message</p>
    </foreignObject>
</svg>

<!-- @do while -->

@{ var i = 0; }
@do
{
    var person = people[i];
    <p>Name: @person.Name</p>
    <p>Age: @person.Age</p>

    i++;
} while (i < people.Length);

<!-- From https://learn.microsoft.com/en-us/aspnet/core/mvc/views/razor?view=aspnetcore-7.0 -->
`;

<template>
  <CodeBlock @code={{codeExample}} @language="razor" />
</template>
