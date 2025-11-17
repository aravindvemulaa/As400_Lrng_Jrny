**free

dcl-s tableNum packed(2:0);
dcl-s value    packed(2:0);
dcl-s count    packed(2:0);

tableNum = 7;

for i = 1 to 10;
    DSPLY (%CHAR(TABLENUM) + ' X ' +
           %CHAR(i) + ' = ' +
           %CHAR(TABLENUM * i));
endfor;

*inlr = *on;
return;




