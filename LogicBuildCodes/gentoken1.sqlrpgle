**free
    ctl-opt dftactgrp(*no) bnddir('QC2LE');
    dcl-f tokenp usage(*input:*update:*output) keyed;
    dcl-pi *n;
          inpID char(10);
    end-pi;
    dcl-s token char(10);
    dcl-s eventts timestamp;
    dcl-s timediff packed(4:0);
    if inpID = *blanks;
        setll *start tokenp;
        read tokenp;
        dow not %eof(tokenp);
            timediff = %diff(%timestamp() : timestmp :*H);
            if timediff >= 1;
                Genrate_token(token);
                timestmp = %timestamp();
                tokenid = token;
                update tokenr;
            endif;
            read tokenp;
        enddo;
    else;
        chain (inpID) tokenp;
        if %found(tokenp);
            timediff = %diff(%timestamp() : timestmp :*H);
            if timediff >= 1;
                tokenid = Genrate_token(token);
                timestmp = %timestamp();
                update tokenr;
            endif;
        else;
            id  = inpID;
            tokenid = Genrate_token(token);
            timestmp = %timestamp();
            write tokenr;
        endif;
    endif;
    *inlr = *on;
    dcl-proc Genrate_token;
        dcl-pi *n char(10);
            token char(10);
        end-pi;

        dcl-s i         uns(5);
        dcl-s min       int(10) inz(1);
        dcl-s max       int(10) inz(62);
        dcl-s rndFloat  float(8);
        dcl-s rndInt    int(10);
        dcl-s Stgtoken  char(10);
        dcl-s StgVar    char(62) inz('ABCDEFGHIJKLMNOPQRSTUVWXYZabc+
                                    efghijklmnopqrstuvwxyz1234567890');
        exec sql
            set option commit = *none;

        for i = 1 to 10;
            exec sql
            select rand() into :rndFloat from sysibm.sysdummy1;

            rndInt   = %int( (rndFloat * (max - min + 1)) ) + min;
            Stgtoken = %trim(Stgtoken) + %SUBST(StgVar:rndInt:1);
        endfor;
            token = Stgtoken;
            return token;
    end-proc;
