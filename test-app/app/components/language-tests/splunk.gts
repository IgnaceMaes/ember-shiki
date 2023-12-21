import { CodeBlock } from 'ember-shiki';

const codeExample = `
# CPU/Memory usage
\`dmc_set_index_introspection\` sourcetype=splunk_resource_usage component=Hostwide host=*  | eval CPU_Usage=('data.cpu_system_pct' + 'data.cpu_user_pct')   | timechart avg(CPU_Usage) by  host


index=_introspection host=* sourcetype=splunk_resource_usage component=Hostwide
| \`drop_dm_object_name("data")\`
| timechart limit=0 useother=f span=30s avg(cpu_user_pct) AS avg,max(cpu_user_pct) AS max by host

index=_introspection host=* sourcetype=splunk_resource_usage component=Hostwide
| \`drop_dm_object_name("data")\`
| eval used_pct=round((mem_used/mem)*100,2)
| eval swap_used_pct=round((swap_used/swap)*100,2)
| timechart limit=0 useother=f span=1m max(used_pct) AS max_used,max(swap_used_pct) AS max_swap_used by host

# https://github.com/getkub/SplunkScriplets/blob/master/docs/splunk_tips/searches/cpu_memory.txt
`;

<template>
  <CodeBlock @code={{codeExample}} @language="splunk" />
</template>
