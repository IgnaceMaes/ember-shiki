import { CodeBlock } from 'ember-shiki';

const codeExample = `
Windows Registry Editor Version 5.00


; WARNING: before run replace PATH_TO_APP with correct value
; Example: C:\\Anaconda3

[HKEY_CLASSES_ROOT\Directory\shell\AnacondaJupyterNotebook]
; This will make it appear when you right click ON a folder
; The "Icon" line can be removed if you don't want the icon to appear
@="&Jupyter Notebook There"
"Icon"="\"PATH_TO_APP\\Menu\\jupyter.ico""

[HKEY_CLASSES_ROOT\Directory\shell\AnacondaJupyterNotebook\command]
@="cmd /K pushd \"%1\" && \"PATH_TO_APP\\Scripts\\activate.bat\" && jupyter-notebook"


[HKEY_CLASSES_ROOT\Directory\Background\shell\AnacondaJupyterNotebook]
; This will make it appear when you right click INSIDE a folder
; The "Icon" line can be removed if you don't want the icon to appear
@="&Jupyter Notebook Here"
"Icon"="\"PATH_TO_APP\\Menu\\jupyter.ico\""

[HKEY_CLASSES_ROOT\Directory\Background\shell\AnacondaJupyterNotebook\command]
@="cmd /K \"PATH_TO_APP\\Scripts\\activate.bat\" && jupyter-notebook"

; From https://github.com/NickVeld/win-registry-snippets/blob/main/AnacondaJupyterNotebookHere.reg
`;

<template>
  <CodeBlock @code={{codeExample}} @language="reg" />
</template>
