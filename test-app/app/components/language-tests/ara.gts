import { CodeBlock } from 'ember-shiki';

const codeExample = `
namespace MyNamespace;

use MyOtherNamespace\MyOtherClass;

use function MyOtherNamespace\my_other_function;

use const MyOtherNamespace\MY_OTHER_CONST;

const MY_CONST = 1;

type MyType = int;

interface MyInterface {
    // ...
}

class MyClass {
    // ...
}

enum MyEnum {
    // ...
}

function my_function(): void {
    // ...
}

https://ara-lang.io/fundamentals/structure.html
`;

<template>
  <CodeBlock @code={{codeExample}} @language="ara" />
</template>
