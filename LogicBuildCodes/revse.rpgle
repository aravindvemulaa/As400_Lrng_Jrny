**free
ctl-opt dftactgrp(*no) option(*nodebugio) actgrp(*new);
dcl-pr Parms1;
   usrval packed(5:0);
   temp   packed(5:0);
   i      packed(2:0);
   reVal  packed(5:0);
end-pr;

dcl-s usrVal packed(5:0);
dcl-s temp   packed(5:0);
dcl-s i      packed(2:0);
dcl-s reVal  packed(5:0);
dcl-s msg    char(40);

   usrVal=5675;
   callp reverse(usrVal:temp:i:reval);
   msg = %char(usrVal)+ ' ' + %char(temp) + ' ' + %char(i) + ' ' + %char(reVal);
   dsply msg;

   *inlr =*on;

dcl-proc Reverse;
dcl-pi *n;
   usrval packed(5:0);
   temp   packed(5:0);
   i      packed(2:0);
   reVal  packed(5:0);
end-pi;
dou usrval<=0;
   temp = %rem(usrval:10);
   reVal =  reVal*10 + temp;
   usrval = usrval/10;
enddo;
end-proc;
