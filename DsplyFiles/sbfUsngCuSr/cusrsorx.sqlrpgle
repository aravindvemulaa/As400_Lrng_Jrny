         ctl-opt Option(*SRCSTMT : *nodebugio);
         dcl-f CUSRSORD workstn sfile(crsr : #rrn);
         dcl-f CURSORPF usage(*input : *update);
         dcl-s #rrn packed(4:0) inz(0);
         dcl-s EmpName char(15);
         dcl-s Empno   Zoned(5:0);
         dcl-s EmpAddr char(20);
         dcl-s LikeValue varchar(15);

         Dow *In03 = *off;
           Exsr $clear;
           if SRCH <> *blanks;
             LikeValue = %trim(SRCH) + '%';
             Clear Srch;
            Else;
             LikeValue = '%';
             Clear srch;
           Endif;
           Exsr $load;
           Exsr $dsply;

         Enddo;
           *inlr = *on ;
      *********************************************************************************
      **********  Subroutine Part   ***************************************************
      *********************************************************************************
            Begsr $clear;
              *in50=*off;
              write crsrctl;
              #rrn = 0;
              *in50 = *on;
            Endsr;

      *---------------------------------------------------------------------------------
      *   Load SubRoutine
      *---------------------------------------------------------------------------------
            begsr $load;
               Exec SQL
                 SET OPTION COMMIT = *NONE;
               Exec sql
                 declare Mycursor cursor for
                 Select ENAME, ENO, EADDRS from cursorpf
                          Where ENAME like :LikeValue;
               Exec SQL
                 Open Mycursor;
                    Exec Sql
                      Fetch Mycursor Into :EmpName, :Empno, :EmpAddr;
                  Dow sqlcode =  0 ;
                    #rrn +=1;
                    ENAME =  EmpName;
                    ENO   =  Empno;
                    EADDRS = EmpAddr;
                    write crsr;
                    Exec Sql
                      Fetch Mycursor Into :EmpName, :Empno, :EmpAddr;
                  Enddo;
               Exec Sql Close Mycursor;
            EndSr;
      *-------------------------------------------------------------------------------
      *     Display Subroutine
      *--------------------------------------------------------------------------------
            Begsr $dsply;
             Write crsrctl;
                Exfmt crsrctl;
                READC CRSR;
                clear Optn;
            Endsr;
