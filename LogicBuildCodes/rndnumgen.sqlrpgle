**FREE
ctl-opt dftactgrp(*no) option(*nodebugio);


dcl-s min       int(10) inz(1);
dcl-s max       int(10) inz(100);
dcl-s rndInt    int(10);
dcl-s rndFloat  float(8);

exec sql
  set option commit = *none;

exec sql
  select rand() into :rndFloat from sysibm.sysdummy1;

rndInt = %int( (rndFloat * (max - min + 1)) ) + min;


dsply ('Random number ' + %char(rndInt));

*inlr = *on;
return;
