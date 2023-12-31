import { CodeBlock } from 'ember-shiki';

const codeExample = `
$ cat file1.txt                                                                                                                            
cat                                                                                                                                              
mv                                                                                                                                               
comm                                                                                                                                             
cp 

$ cat file2.txt
cat                                                                                                                                              
cp                                                                                                                                               
diff                                                                                                                                             
comm
                                                                                                   
$ diff -c file1.txt file2.txt                                                                                                              
*** file1.txt   Thu Jan 11 08:52:37 2018                                                                                                         
--- file2.txt   Thu Jan 11 08:53:01 2018                                                                                                         
***************                                                                                                                                  
*** 1,4 ****                                                                                                                                     
  cat                                                                                                                                            
- mv                                                                                                                                             
- comm                                                                                                                                           
  cp                                                                                                                                             
--- 1,4 ----                                                                                                                                     
  cat                                                                                                                                            
  cp                                                                                                                                             
+ diff                                                                                                                                           
+ comm

# From https://www.geeksforgeeks.org/diff-command-linux-examples/`;

<template>
  <CodeBlock @code={{codeExample}} @language="diff" />
</template>
