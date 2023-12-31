import { CodeBlock } from 'ember-shiki';

const codeExample = `
--  COALESCE returns the first non-blank of its arguments
--  It is commonly used to provide default values to expressions
--  that might result in a blank
EVALUATE
SELECTCOLUMNS (
    TOPN ( 10, Store ),
    "Store name", Store[Store Name],
    "Manager",
        COALESCE ( Store[Area Manager], "** Not Assigned **" ),
    "Years open",
        DATEDIFF (
            Store[Open Date],
            COALESCE ( Store[Close Date], TODAY () ),
            YEAR
        )
)
ORDER BY [Manager]

-- From https://dax.guide/coalesce/
`;

<template>
  <CodeBlock @code={{codeExample}} @language="dax" />
</template>
