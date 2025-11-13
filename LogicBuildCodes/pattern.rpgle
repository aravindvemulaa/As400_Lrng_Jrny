**free
dcl-s row packed(2:0);
dcl-s col packed(2:0);
dcl-s line varchar(5) inz;

row = 5;
dow row >= 1;
    col= 1;              // Start column counter at 1 for each row
    dow col <= row;
        line += '*';     // add '*' characters equal to the row number
        col += 1;        // Increment column counter
    enddo;
    row -= 1;
    dsply line;
    clear line;

enddo;
*inlr = *on;