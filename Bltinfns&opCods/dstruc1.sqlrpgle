      *=====================================================================
      * Program: DSSQL
      * Purpose: Data Structure with manual field assignment
      * Author: Aravind Vemula
      * Description: Regular (non-qualified) data structure with
      *              customer information fields populated and displayed
      *=====================================================================
      /free
      * Data Declaration
      dcl-Ds customerInfo;
          custid zoned(4:0);
          custname char(10);
          cust_address char(10);
      end-ds;

       custid = 1561;
       custname = 'Aravind';
       cust_address = 'HYD';

       dsply custid;
       dsply custname;
       dsply cust_address;
       dsply customerInfo;
       *inlr=*on;

      /end-free








