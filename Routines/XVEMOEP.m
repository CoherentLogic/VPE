XVEMOEP ;DJB,VRROLD**CHANGE - Print [12/31/94]
 ;;7.0;VPE;;COPYRIGHT David Bolduc @1993
 ;
PRINTA ;Print All - Heading,Tag,Line
 S CODETG=$P(CD,$C(9)),(CODELN,TEMP)=$P(CD,$C(9),2,999)
 F YCNT=1:1 Q:$L(CODELN)<(YCNT*WIDTH+1)
 D CLRSCRN^XVEMOEU
 S DX=14 X XVVS("CRSR")
 W @XVV("RON") X XVVS("XY") W "LINE:",$J(VRRLN,3),@XVV("ROFF")
 S DX=27 X XVVS("CRSR")
 W @XVV("RON") X XVVS("XY") W "LENGTH:",$J($L(CD),4),@XVV("ROFF")
 S DX=43 X XVVS("CRSR")
 W @XVV("RON") X XVVS("XY") W "<ESC>H=Help",@XVV("ROFF")
 S DX=58 X XVVS("CRSR")
 W @XVV("RON") X XVVS("XY") W "<RET>=Quit",@XVV("ROFF")
 S DX=0,DY=DY+1 X XVVS("CRSR")
 W @XVV("RON") X XVVS("XY") W "  TAG-->" S DX=$X W @XVV("ROFF") X XVVS("XY")
 W " ",CODETG
 S DX=0,DY=DY+1 X XVVS("CRSR")
 W @XVV("RON") X XVVS("XY") W " LINE-->" S DX=$X W @XVV("ROFF") X XVVS("XY")
 W " ",$E(CODELN,1,WIDTH) S TEMP=$E(CODELN,WIDTH+1,999)
PRINTA1 ;Print remainder of line
 I TEMP="" D CLRSCRN1^XVEMOEU Q
 W !?9,$E(TEMP,1,WIDTH) S TEMP=$E(TEMP,WIDTH+1,999)
 G PRINTA1
PRINTL ;Print Line
 S CODETG=$P(CD,$C(9)),CODELN=$P(CD,$C(9),2,999)
 S TEMP=$E(CODELN,XCHAR,999)
 F YCNT=1:1 Q:$L(CODELN)<(YCNT*WIDTH+1)
 I YCNT>YCNTHLD S TOP=TOP-1,YCNTHLD=YCNTHLD+1 D PRINTA Q  ;When lines scroll up.
 S DX=34,DY=TOP X XVVS("CRSR")
 W @XVV("RON") X XVVS("XY") W $J($L(CD),4),@XVV("ROFF")
 I XCUR>START S DX=XCUR,DY=TOP+1+YCUR X XVVS("CRSR") W @XVVS("BLANK_C_EOS")
 I XCUR=START,YCUR=1 S DX=XCUR,DY=TOP+1+YCUR X XVVS("CRSR") W @XVVS("BLANK_C_EOS")
 I XCUR=START,YCUR>1 S DX=WIDTH+START,DY=TOP+1+YCUR-1 X XVVS("CRSR") W @XVVS("BLANK_C_EOS") S DX=XCUR,DY=TOP+1+YCUR
 X XVVS("CRSR")
 W $E(TEMP,1,WIDTH+START-XCUR) S TEMP=$E(TEMP,WIDTH+START+1-XCUR,999)
PRINTL1 ;Print remainder of line
 I TEMP="" X XVVS("CRSR") Q
 W !?START,$E(TEMP,1,WIDTH) S TEMP=$E(TEMP,WIDTH+1,999)
 G PRINTL1
 Q
PRINTT ;Print Tag
 S CODETG=$P(CD,$C(9)),CODELN=$P(CD,$C(9),2,999)
 S DX=34,DY=TOP X XVVS("CRSR") W @XVV("RON"),$J($L(CD),4),@XVV("ROFF")
 S DX=XCUR,DY=TOP+1 X XVVS("CRSR") W @XVVS("BLANK_C_EOL") X XVVS("XY")
 W $E(CODETG,XCHAR,999)
 S DX=XCUR,DY=TOP+1 X XVVS("CRSR")
 Q