import { CodeBlock } from 'ember-shiki';

const codeExample = `
package main

import (
    "fmt"
    "log"
    "net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Hi there, I love %s!", r.URL.Path[1:])
}

func main() {
    http.HandleFunc("/", handler)
    log.Fatal(http.ListenAndServe(":8080", nil))
}

// From https://golang.org/doc/articles/wiki/#tmp_3`;

<template>
  <CodeBlock @code={{codeExample}} @language="go" />
</template>
