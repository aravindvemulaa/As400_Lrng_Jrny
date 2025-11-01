     HOption(*Nodebugio)
     FCUSTDTLS  CF   E             WORKSTN
     FCUST_MSTR IF A E           K DISK
     DlstCustID        S              4S 0

         Dow *in03 = *off;
            Exfmt CUSTMSTR;
            If *in12 = *on or *In03 = *On;
               leave;
            Endif;
            select;
               When *in06=*on;
                  write CUSTOMER;
                  clear CUSTMSTR;
      *------------------------------------------------------------------------*
      *   Window file for customer type selection based on type Customer ID    *
      *   will Be Genrated                                                     *
      *------------------------------------------------------------------------*
               When FLD='CUST_TYPE' and *In04 = *On;
                  Exfmt CUSTYP;
                     Dow *in12 =*off;
                        Select;
                           When FLD001 = 1;
                              CUST_TYPE = 'BU';
                              exsr CustIdGen;
                              leave;
                           When FLD003 = 1;
                              CUST_TYPE = 'GN';
                              Exsr CustIdGen;
                              leave;
                           When FLD002 = 1;
                              CUST_TYPE = 'SP';
                              Exsr CustIdGen;
                              leave;
                           Other;
                              Emsg = 'Please select valid';
                        Endsl;
                     EndDo;

      *------------------------------------------------------------------------*
      *   Window file for ID Proof type selection                              *
      *------------------------------------------------------------------------*
               When FLD='ID_PRF_TYP' and *In04 = *On;
                  Exfmt ID;
                  Dow *in12 = *off;
                     Select;
                        When DOCTYP1=1;
                           ID_PRF_TYP = 'ADR';
                           leave;
                        When DOCTYP2 = 1;
                           ID_PRF_TYP = 'PAN';
                           leave;
                        When DOCTYP3 = 1;
                           ID_PRF_TYP = 'VID';
                           leave;
                        When DOCTYP4 = 1;
                           ID_PRF_TYP = 'PSP';
                           leave;
                        Other;
                           Emsg = 'Please select Valid';
                     EndSl;
                  EndDo;

      *------------------------------------------------------------------------*
      *   Window file to copy the current address if it is the same as the     *
      *   permanent address                                                    *
      *------------------------------------------------------------------------*
               When FLD='CURADDRS' and *IN04= *on;
                  Exfmt CNFRMADDR;
                  DoW *In12 = *Off;
                     select;
                        When *In05=*on;
                          CURADDRS = ADDRESS;
                          LEAVE;
                     EndSl;
                  EndDo;
            Endsl;
         EndDo;
         *Inlr = *On;
      *-------------------------------------------------------------------------
      *  Subroutinr to grnrate custid
      *-------------------------------------------------------------------------
         Begsr CustIdGen;
            clear FLD;
            Exec Sql
               select CUSTID into: lstCustID FROM cust_mstr
               ORDER BY CUSTID DESC FETCH FIRST 1 ROW ONLY;
               select;
                  When CUST_TYPE='GN';
                    Custid='GN'+ %char(lstCustID + 1);
                  When CUST_TYPE='BU';
                    Custid='BU'+ %char(lstCustID + 1);
                  When CUST_TYPE='SP';
                    Custid='SP'+ %char(lstCustID + 1);
               EndSl;
               clear FLD;
         Endsr;
