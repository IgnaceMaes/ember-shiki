import { CodeBlock } from 'ember-shiki';

const codeExample = `
;;; testing.lisp
;;; by Philip Fong
;;;
;;; Introductory comments are preceded by ";;;"
;;; Function headers are preceded by ";;"
;;; Inline comments are introduced by ";"
;;;

;;
;; Triple the value of a number
;;

(defun triple (X)
  "Compute three times X."  ; Inline comments can
  (* 3 X))                  ; be placed here.

;;
;; Negate the sign of a number
;;

(defun negate (X)
  "Negate the value of X."  ; This is a documentation string.
  (- X))

;;; From https://www2.cs.sfu.ca/CourseCentral/310/pwfong/Lisp/1/tutorial1.html
`;

<template>
  <CodeBlock @code={{codeExample}} @language="lisp" />
</template>
