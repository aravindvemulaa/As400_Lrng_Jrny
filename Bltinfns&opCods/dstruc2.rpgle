      *=====================================================================
      * Program: DSEXT
      * Purpose: Data Structure using EXTNAME file
      * Author: Aravind Vemula
      * Description: Demonstrates EXTNAME to create DS fields from PF
      *              structure and assign sample values
      *=====================================================================
      /free
      
      dcl-Ds customerRecord Extname('COMMONPF');

       EMPID = 1234;
       EMPNAME = 'Aravind';
      
       dsply EMPID;
       dsply EMPNAME;
       *inlr=*on;
      /end-free





