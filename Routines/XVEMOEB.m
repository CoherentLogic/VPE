XVEMOEB ;DJB,VRROLD**CHANGE - INSERT,DELETE,ARROW,OTHER [02/17/95]
 ;;7.0;VPE;;COPYRIGHT David Bolduc @1993
 ;
INSERT ;Insert a character
 I $L(CD)>244 S FLAGQ=1 Q
 ;---Tag---
 I YCUR=0 D  S XCHAR=XCHAR+1,XCUR=XCUR+1 D SAVE^XVEMOEU,PRINTT^XVEMOEP Q
 . I XCHAR=1 S CD=X_CODETG_$C(9)_CODELN Q
 . S CD=$E(CODETG,1,XCHAR-1)_X_$E(CODETG,XCHAR,999)_$C(9)_CODELN
 . Q
 ;---Line---
 I XCHAR=1 S CD=CODETG_$C(9)_X_CODELN
 E  S CD=CODETG_$C(9)_$E(CODELN,1,XCHAR-1)_X_$E(CODELN,XCHAR,999)
 I XCHAR#WIDTH=0 S XCUR=START,YCUR=YCUR+1
 E  S XCUR=XCUR+1
 S XCHAR=XCHAR+1 D SAVE^XVEMOEU,PRINTL^XVEMOEP
 Q
DELETE ;Delete a character
 ;---<DEL> key struck---
 I VK="<DEL>" D  Q
 . ;Edit tag
 . I YCUR=0 D   D SAVE^XVEMOEU,PRINTT^XVEMOEP Q
 . . S CD=$E(CODETG,1,XCHAR-1)_$E(CODETG,XCHAR+1,999)_$C(9)_CODELN
 . ;Edit line
 . S CD=CODETG_$C(9)_$E(CODELN,1,XCHAR-1)_$E(CODELN,XCHAR+1,999)
 . D SAVE^XVEMOEU,PRINTL^XVEMOEP
 . Q
 ;---<BS> key struck---
 Q:XCHAR'>1
 ;Edit tag
 I YCUR=0 D  D SAVE^XVEMOEU,PRINTT^XVEMOEP Q
 . S XCUR=XCUR-1,XCHAR=XCHAR-1
 . S CD=$E(CODETG,1,XCHAR-1)_$E(CODETG,XCHAR+1,999)_$C(9)_CODELN
 ;Edit line
 I XCHAR=2 D  D SAVE^XVEMOEU,PRINTL^XVEMOEP Q
 . S XCUR=XCUR-1,XCHAR=XCHAR-1
 . S CD=CODETG_$C(9)_$E(CODELN,2,999) D SAVE^XVEMOEU,PRINTL^XVEMOEP
 I XCUR=START,YCUR>1 S XCUR=WIDTH+START-1,YCUR=YCUR-1
 E  S XCUR=XCUR-1
 S XCHAR=XCHAR-1
 S CD=CODETG_$C(9)_$E(CODELN,1,XCHAR-1)_$E(CODELN,XCHAR+1,999)
 D SAVE^XVEMOEU,PRINTL^XVEMOEP
 Q
BULKDEL ;Delete a range of characters.
 Q:YCUR=0  NEW TEMP
 I TAB1>0,TAB2>0 S (TAB1,TAB2)=0 D PRINTA^XVEMOEP Q
 I TAB1'>0 D  Q
 . W @XVV("RON"),$S(XCHAR'>$L(CODELN):$E(CODELN,XCHAR),1:" ")
 . W @XVV("ROFF"),$C(8) S TAB1=XCHAR_","_YCUR
 W @XVV("RON"),$S(XCHAR'>$L(CODELN):$E(CODELN,XCHAR),1:" ")
 W @XVV("ROFF"),$C(8) S TAB2=XCHAR_","_YCUR
 I +TAB1>+TAB2 S TEMP=TAB1,TAB1=TAB2,TAB2=TEMP
 Q
BULKDEL1 ;Make the deletion.
 Q:YCUR=0  I TAB1'>0!(TAB2'>0) Q
 S CD=CODETG_$C(9)_$E(CODELN,1,+TAB1-1)_$E(CODELN,+TAB2+1,999)
 S XCHAR=+TAB1,XCUR=XCHAR#WIDTH+(START-1)
 S YCUR=$P(TAB1,",",2),(TAB1,TAB2)=0
 D SAVE^XVEMOEU,PRINTL^XVEMOEP
 Q
ARROW ;Process arrow keys
 D @$E(VK,2,$L(VK)-1)
 Q
AR ;Arrow Right
 I YCUR=0,XCHAR'<($L(CODETG)+1) Q
 I YCUR>0,XCHAR'<($L(CODELN)+1) Q
 I XCHAR#WIDTH=0 S XCUR=START,YCUR=YCUR+1,XCHAR=XCHAR+1 Q
 S XCUR=XCUR+1,XCHAR=XCHAR+1
 Q
AL ;Arrow Left
 I XCUR>START S XCUR=XCUR-1,XCHAR=XCHAR-1 Q
 I XCUR=START,YCUR>1 S XCUR=WIDTH+START-1,YCUR=YCUR-1,XCHAR=XCHAR-1 Q
 Q
AU ;Arrow Up
 I YCUR=1 S YCUR=0 D  Q
 . I XCHAR>($L(CODETG)+1) F  Q:XCHAR=1!(XCHAR=($L(CODETG)+1))  S XCHAR=XCHAR-1,XCUR=XCUR-1
 I YCUR>1 S YCUR=YCUR-1,XCHAR=XCHAR-WIDTH
 Q
AD ;Arrow Down
 I YCUR=0 S YCUR=1 Q
 I YCUR<YCNT S YCUR=YCUR+1,XCHAR=XCHAR+WIDTH
 I XCHAR>($L(CODELN)+1) F  Q:XCHAR=1!(XCHAR=($L(CODELN)+1))  S XCHAR=XCHAR-1,XCUR=XCUR-1
 Q
OTHER ;<F1AL>,<F1AR>,<F2AL>,<F2AR>
 I VK="<F2AL>",XCUR>23 S XCUR=XCUR-15,XCHAR=XCHAR-15 Q
 I VK="<F2AR>",XCUR<(WIDTH+START-15),($L(CODELN)-XCHAR)>14 D  Q
 . S XCUR=XCUR+15,XCHAR=XCHAR+15
 I VK="<F1AL>" S XCUR=START,XCHAR=1,YCUR=1 Q
 I VK="<F1AR>" D  Q
 . S XCHAR=$L(CODELN)+1
 . S XCUR=$S(XCHAR#WIDTH=0:WIDTH+START-1,1:XCHAR#WIDTH+(START-1))
 . S YCUR=$S((XCHAR-1)#WIDTH=0:YCNT+1,1:YCNT)
 Q