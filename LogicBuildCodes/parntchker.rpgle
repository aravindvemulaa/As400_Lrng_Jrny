**FREE
        ctl-opt option(*nodebugio);
        dcl-f agr usage(*input: *update) keyed;
        dcl-f AGRCLF usage(*input: *update) keyed rename(AGRMNTR:AGRMNTR1);
        dcl-s prnt char(5);
        dcl-s chld char(5);
        dcl-s index packed(4:0) inz(0);
        dcl-s arry char(5) dim(9999);
        dcl-s i packed(4:0) inz(1);
        dcl-s userinpt char(5);
        dcl-s found ind inz(*off);

        dsply 'Enter the parent agreement you want to add ' '' userinpt;
        dsply 'Enter the child agreement you want to add ' '' chld;

        setll userinpt Agrclf;
        reade userinpt Agrclf;
        dow not %eof(AGRCLF);
            index +=1;
            arry(index) = parent;
            reade userinpt AGRCLF;
        enddo;

        for i = 1 to index;
            setll arry(i) Agrclf;
            reade arry(i) Agrclf;
            dow not %eof(AGRCLF);
            if chld = parent;
                found = *on;
                leave;
            endif;
                index +=1;
                arry(index)= parent;
                reade arry(i) AGRCLF;
            enddo;
        endfor;

        // for i = 1 to index;
        // endfor;
        if found = *on;
            dsply (child + ' already exists in parent chain');
        else;
            dsply 'this can be added to parent';
        endif;
        *inlr = *on;
