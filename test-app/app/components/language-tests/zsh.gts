import { CodeBlock } from 'ember-shiki';

const codeExample = `
#!/bin/zsh

# Add commonly used folders to $PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Specify default editor. Possible values: vim, nano, ed etc.
export EDITOR=vim

# File search functions
function f() { find . -iname "*$1*" \${@:2} }
function r() { grep "$1" \${@:2} -R . }

# Create a folder and move into it in one command
function mkcd() { mkdir -p "$@" && cd "$_"; }

# Example aliases
alias cppcompile='c++ -std=c++11 -stdlib=libc++'
alias g='git'

# From https://sourabhbajaj.com/mac-setup/iTerm/zsh.html
`;

<template>
  <CodeBlock @code={{codeExample}} @language="zsh" />
</template>
