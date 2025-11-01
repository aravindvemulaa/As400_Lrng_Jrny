**free

Ctl-Opt Option(*NoDebugIO);

Dcl-F CusrsorD Workstn Sfile(crsr: RRN);
Dcl-F cursorpf Usage(*Input) Keyed;

Dcl-S RRN Packed(4:0);
Dcl-S StartRec Like(ENAME);
Dcl-S dENAME Char(15);
Dcl-S dEno zoned(5);
Dcl-S sflpgsiz Packed(3:0) Inz(5);
Dcl-S LastRec like(ENAME);

Exec SQL Set Option Commit = *None;

Exsr ClearSr;
Exsr LoadSr;

Dow *in03 = *off;
    Exfmt CRSRCTL;
    Select;
        When *in26 = *on and *in51 = *off; // Page Down
            Exsr ClearSr;
            Exsr LoadSr;

        When *in25 = *on; // Page Up
            Exsr ClearSr;
            Exsr PageUp;
    EndSl;
EndDo;

*InLR = *On;

BegSr ClearSr;
    *in50 = *off;
    Write CRSRCTL;
    *in50 = *on;
    RRN = 0;
EndSr;

BegSr LoadSr;
    Exec SQL
    Declare C1 Scroll Cursor For
    Select ENAME, Eno
    From cursorpf
    Where ENAME >= :StartRec
    Order By ENAME;

    Exec SQL Close C1;
    Exec SQL Open C1;

    RRN = 0;
    Dow SqlCode = 0;
        Exec SQL
            Fetch Next From C1 Into :dENAME, :dEno;
        If SqlCode = 100;
            Leave;
        EndIf;
        ENAME = dENAME;
        Eno = dEno;
        RRN += 1;
        Write crsr;
        LastRec = dENAME;

        If RRN = sflpgsiz;
            Leave;
        EndIf;
    EndDo;
    StartRec = LastRec;
    Exec SQL Close C1;

    If SqlCode = 100;
        *in51 = *on;  // End of file
    Else;
        *in51 = *off;
    EndIf;
EndSr;

BegSr PageUp;
    Exec SQL
    Declare C2 Scroll Cursor For
    Select ENAME, Eno
    From cursorpf
    Where ENAME < :StartRec
    Order By ENAME Desc;

    Exec SQL Open C2;

    RRN = 0;
    Dow SqlCode = 0;
        Exec SQL
            Fetch Next From C2 Into :dENAME, :dEno;

        If SqlCode = 100;
            Leave;
        EndIf;
        ENAME = dENAME;
        Eno = dEno;
        RRN += 1;
        Write crsr;
        LastRec = dENAME;

        If RRN = sflpgsiz;
            Leave;
        EndIf;
    EndDo;
    StartRec = LastRec;
    Exec SQL Close C2;

    Exec SQL Close C2;
    If SqlCode = 100;
        *in51 = *on;
    Else;
        *in51 = *off;
    EndIf;
EndSr;



