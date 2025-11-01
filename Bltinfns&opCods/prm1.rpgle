      *=====================================================================
      * Program: PRM1
      * Purpose: Pass parameters to PARMRCV1 program
      * Author: Aravind Vemula
      * Description: Demonstrates calling another program with parameters
      *              and passing data to it via parameter list
      *=====================================================================
      /free
      dcl-pr parmrcv1 extpgm('PARMRCV1');
          paramName char(20);
          paramRole char(10);
      end-pr;

      dcl-s employeeName char(20);
      dcl-s employeeRole char(10);

      
       employeeName = 'Aravind Vemula';
       employeeRole = 'Developer';

      * Call external program with parameters
       callp parmrcv1(employeeName: employeeRole);

       *inlr = *on;
      /end-free







