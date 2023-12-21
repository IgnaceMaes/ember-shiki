import { CodeBlock } from 'ember-shiki';

const codeExample = `

<div>
  <button @click="insert">insert at random index</button>
  <button @click="reset">reset</button>
  <button @click="shuffle">shuffle</button>

  <TransitionGroup tag="ul" name="fade" class="container">
    <div v-for="item in items" class="item" :key="item">
      {{ item }}
      <button @click="remove(item)">x</button>
    </div>
  </TransitionGroup>
</div>

// From https://vuejs.org/examples/#list-transition
`;

<template>
  <CodeBlock @code={{codeExample}} @language="vue-html" />
</template>
