import { CodeBlock } from 'ember-shiki';

const codeExample = `
print word "apple "sauce
; applesauce

print word "3 "4
; 34

print 12 + word "3 "4
; 46

to factorial :number
if :number = 1 [output 1]
output :number * factorial :number - 1
end

print factorial 3
; 6

print factorial 5
; 120

; From https://el.media.mit.edu/logo-foundation/what_is_logo/logo_programming.html
`;

<template>
  <CodeBlock @code={{codeExample}} @language="logo" />
</template>
