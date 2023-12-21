import { CodeBlock } from 'ember-shiki';

const codeExample = `
\documentclass{article}

\usepackage{expl3}

\ExplSyntaxOn
  \cs_new_eq:NN \calc \fp_eval:n
\ExplSyntaxOff

\def\valueA{7}
\def\valueB{19}
\def\valueC{41}
\def\valueD{31}
\def\valueE{25}
\def\valueF{17}
\def\valueG{7}
\def\valueH{3}

\begin{document}

\noindent I have the list
\[
\valueA,\valueB,\valueC,\valueD,\valueE,\valueF,\valueG,\valueH
\]
in which the largest element is $\calc{max(\valueA,\valueB,\valueC,\valueD,\valueE,\valueF,\valueG,\valueH)}$ (but that is of no importance to me).\\[\baselineskip]
How can I get \LaTeX{} to extract the position number of the largest element in a list? (In the example above, the answer is of course \`$3$'.)

\end{document}

% From https://tex.stackexchange.com/questions/231558/position-of-largest-element-in-a-list
`;

<template>
  <CodeBlock @code={{codeExample}} @language="tex" />
</template>
