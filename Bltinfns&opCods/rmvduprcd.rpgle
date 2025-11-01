      *=====================================================================
      * Program: RMVDUP
      * Purpose: Remove duplicate records from file
      * Author: Aravind Vemula
      * Description: Reads file sequentially and deletes duplicate
      *              EMPID records keeping only first occurrence
      *=====================================================================
     FCOMMONPF  UF   E           K DISK
      *
     D currentEmpId    S             50S 0
     D previousEmpId   S             50S 0
     D duplicateMsg    S             50A

      * Main Processing - Free Format
      /free

      read COMMONPF;
       
       dow not %eof(COMMONPF);
           currentEmpId = EMPID;
           if currentEmpId = previousEmpId;
               duplicateMsg = 'Deleted duplicate EMPID: ' + 
                              %char(currentEmpId);
               dsply duplicateMsg;
               delete COMMONPF;
           else;
               previousEmpId = currentEmpId;
           endif;

           read COMMONPF;
       enddo;

       *inlr = *on;
      /end-free