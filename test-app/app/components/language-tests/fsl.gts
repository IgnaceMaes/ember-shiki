import { CodeBlock } from 'ember-shiki';

const codeExample = `

machine_name      : "TCP/IP";
machine_reference : "http://www.texample.net/tikz/examples/tcp-state-machine/";
machine_version   : 1.0.0;

machine_author    : "John Haugeland <stonecypher@gmail.com>";
machine_license   : MIT;

jssm_version      : >= 5.0.0;



Closed 'Passive open'      -> Listen;
Closed 'Active Open / SYN' -> SynSent;

Listen 'Close'         -> Closed;
Listen 'Send / SYN'    -> SynSent;
Listen 'SYN / SYN+ACK' -> SynRcvd;

SynSent 'Close'         -> Closed;
SynSent 'SYN / SYN+ACK' -> SynRcvd;
SynSent 'SYN+ACK / ACK' -> Established;

SynRcvd 'Timeout / RST' -> Closed;
SynRcvd 'Close / FIN'   -> FinWait1;
SynRcvd 'ACK'           -> Established;

Established 'Close / FIN' -> FinWait1;
Established 'FIN / ACK'   -> CloseWait;

FinWait1 'FIN / ACK'     -> Closing;  // the source diagram has this action wrong
FinWait1 'FIN+ACK / ACK' -> TimeWait;
FinWait1 'ACK / Nothing' -> FinWait2; // see http://www.cs.odu.edu/~cs779/spring17/lectures/architecture_files/image009.jpg

FinWait2 'FIN / ACK' -> TimeWait;

Closing 'ACK' -> TimeWait;

TimeWait 'Up to 2*MSL' -> Closed;

CloseWait 'Close / FIN' -> LastAck;

LastAck 'ACK' -> Closed;



# From https://github.com/StoneCypher/jssm/blob/main/src/machines/linguist/tcp%20ip.fsl`;

<template>
  <CodeBlock @code={{codeExample}} @language="fsl" />
</template>
