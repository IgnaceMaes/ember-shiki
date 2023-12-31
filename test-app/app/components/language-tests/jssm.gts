import { CodeBlock } from 'ember-shiki';

const codeExample = `

machine_name      : "BGP";
machine_reference : "http://www.inetdaemon.com/tutorials/internet/ip/routing/bgp/operation/finite_state_model.shtml";
machine_version   : 1.0.0;

machine_author    : "John Haugeland <stonecypher@gmail.com>";
machine_license   : MIT;

jssm_version      : >= 5.0.0;



       Idle -> [Idle Connect];
    Connect -> [Idle Connect OpenSent Active];
     Active -> [Idle Connect OpenSent Active];
   OpenSent -> [Idle Active OpenConfirm];
OpenConfirm -> [Idle OpenSent OpenConfirm Established];
Established -> [Idle Established];



# from https://github.com/StoneCypher/jssm/blob/main/src/machines/linguist/bgp.fsl`;

<template>
  <CodeBlock @code={{codeExample}} @language="jssm" />
</template>
