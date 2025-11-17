**free
//=======================================================================
// Declare 3 alphanumeric data type. Assign your first name
// value in first data type and assign your Last name value 
// in second data type and then add these two data types and 
// store the result in third data type. Also display the value
// of third data type by using DSPLY Keyword. 
//======================================================================

dcl-s frstName Char(10);
dcl-s lastName char(15);
dcl-s fullName char(25);

frstName = 'Aravind';
lastName = 'Vemula';
fullName = frstName + lastName;
dsply fullName;

*inlr = *on;
return;

