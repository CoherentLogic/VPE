XVEMSYN ;V4W/DLW - Syntax highlighting ;2019-04-11  10:27 PM
 ;;15.0;VICTORY PROG ENVIRONMENT;;May 01, 2019
 ; (c) David Wicksell 2019
 ;
SYNTAX(XVBUFFER,XVBUFNUM,XVW) ;Build a syntax structure for a corresponding line
 N XVCHAR,XVUCHAR,XVCMD,XVDATA,XVNUM,XVEXT
 S XVBUFNUM=$G(XVBUFNUM)
 S XVW=$G(XVW,1)
 S (XVDATA("ARG"),XVDATA("FUNC"),XVDATA("STRING"),XVDATA("TAG"),XVEXT)=0
 S (XVDATA("CMD"),XVDATA("STATE"))=""
 W:XVW $$CONTROL("DEF")
 I XVBUFFER=" <> <> <>" W:XVW XVBUFFER Q
 I XVBUFNUM,$G(^TMP("XVV","IR"_VRRS,$J,XVBUFNUM+1),$C(30))'[$C(30),^(XVBUFNUM+1)'=" <> <> <>" S XVEXT=1
 I $E(XVBUFFER,1)=" ",XVBUFFER'[$C(30) D
 . N XVSTATE
 . M XVDATA=^TMP("XVV","IR"_VRRS,$J,XVBUFNUM,"STATE")
 . S XVSTATE=XVDATA("STATE")
 . I XVSTATE="" W:XVW $P(XVBUFFER,$C(30),1),$P(XVBUFFER,$C(30),2) Q
 . W:XVW $E(XVBUFFER,1,9)
 . I XVSTATE="ERROR" W:XVW $$CONTROL("ERR")
 . I XVSTATE="COMMENT" W:XVW $$CONTROL("COM")
 . I XVSTATE="TAG" W:XVW $$CONTROL("TAG")
 . I XVSTATE="COMMAND" W:XVW $$CONTROL("CMD")
 . I XVSTATE="ARGUMENT" W:XVW $$CONTROL("ARG")
 . I XVSTATE="FUNCTION" W:XVW $$CONTROL("FUNC")
 . I XVSTATE="PUNCMARK" W:XVW $$CONTROL("PUNC")
 . I XVSTATE="NUMBER" W:XVW $$CONTROL("NUM")
 . I XVSTATE="STRING" W:XVW $$CONTROL("STR")
 . S XVDATA=9
 . G @XVSTATE
 E  D
 . D START(XVBUFFER,.XVDATA)
 I XVEXT=1 M ^TMP("XVV","IR"_VRRS,$J,XVBUFNUM+1,"STATE")=XVDATA
 W:XVW $$CONTROL("DEF")
 S $X=$L(XVBUFFER)-1
 Q
 ;
START(XVBUFFER,XVDATA) ;Start state
 S XVDATA=1
 S XVCHAR=$E(XVBUFFER,XVDATA)
 I XVCHAR="" Q
 I XVBUFFER[$C(30),+XVBUFFER'>VRRHIGH,XVCHAR?1N W:XVW XVCHAR G STATUS
 I XVCHAR?1(1A,1"%") S XVDATA("TAG")=1 W:XVW $$CONTROL("TAG"),XVCHAR G TAG
 I XVCHAR?1N S XVDATA("TAG")=2 W:XVW $$CONTROL("TAG"),XVCHAR G TAG
 I XVCHAR=" "!(XVCHAR=$C(9)) W:XVW $$CONTROL("TAG"),XVCHAR G TAG
 I XVCHAR=$C(30) W:XVW $$CONTROL("CMD") G COMMAND
 I XVCHAR=";" W:XVW $$CONTROL("COM"),XVCHAR G COMMENT
 W:XVW $$CONTROL("ERR"),XVCHAR G ERROR
 Q
 ;
STATUS ;Status state
 S XVDATA=XVDATA+1
 S XVCHAR=$E(XVBUFFER,XVDATA)
 I XVCHAR="" Q
 I XVCHAR?1N W:XVW XVCHAR G STATUS
 I XVCHAR=" "!(XVCHAR=$C(9)) W:XVW XVCHAR G STATUS
 I XVCHAR?1(1A,1"%") W:XVW $$CONTROL("TAG"),XVCHAR G TAG
 I XVCHAR=$C(30) W:XVW $$CONTROL("CMD") G COMMAND
 I XVCHAR=";" W:XVW $$CONTROL("COM"),XVCHAR G COMMENT
 W:XVW $$CONTROL("ERR"),XVCHAR G ERROR
 Q
 ;
TAG ;Tag state
 S XVDATA=XVDATA+1
 S XVCHAR=$E(XVBUFFER,XVDATA)
 I XVCHAR="" S:XVEXT=1 XVDATA("STATE")="TAG" Q
 I XVDATA("TAG")=0,XVCHAR="%" S XVDATA("TAG")=1 W:XVW XVCHAR G TAG
 I XVDATA("TAG")=0,XVCHAR?1N S XVDATA("TAG")=2 W:XVW XVCHAR G TAG
 I XVDATA("TAG")<2,XVCHAR?1A S XVDATA("TAG")=1 W:XVW XVCHAR G TAG
 I XVCHAR?1N W:XVW XVCHAR G TAG
 I XVCHAR=" "!(XVCHAR=$C(9)) S XVDATA("TAG")=0 W:XVW XVCHAR G TAG
 I XVCHAR?1(1":",1"(") S XVDATA("CMD")="TAG",XVDATA("TAG")=0  W:XVW $$CONTROL("PUNC"),XVCHAR G PUNCMARK
 I XVCHAR=$C(30) S XVDATA("TAG")=0 W:XVW $$CONTROL("CMD") G COMMAND
 I XVCHAR=";" W:XVW $$CONTROL("COM"),XVCHAR G COMMENT
 W:XVW $$CONTROL("ERR"),XVCHAR G ERROR
 Q
 ;
ERROR ;Error state
 S XVDATA=XVDATA+1
 S XVCHAR=$E(XVBUFFER,XVDATA)
 I XVCHAR="" S:XVEXT=1 XVDATA("STATE")="ERROR" Q
 W:XVW XVCHAR G ERROR
 Q
 ;
COMMENT ;Comment state
 S XVDATA=XVDATA+1
 S XVCHAR=$E(XVBUFFER,XVDATA)
 I XVCHAR="" S:XVEXT=1 XVDATA("STATE")="COMMENT" Q
 W:XVW XVCHAR G COMMENT
 Q
 ;
COMMAND ;Command state
 S XVDATA=XVDATA+1
 S XVUCHAR=$$ALLCAPS^XVEMKU($E(XVBUFFER,XVDATA))
 S XVCHAR=$E(XVBUFFER,XVDATA)
 I XVCHAR="" S:XVEXT=1 XVDATA("STATE")="COMMAND" Q
 I XVDATA("CMD")="" W:XVW $$CONTROL("CMD")
 I XVDATA("CMD")="",XVUCHAR="B" S XVDATA("CMD")="[REAK]" W:XVW XVCHAR G COMMAND
 I XVDATA("CMD")="",XVUCHAR="C" S XVDATA("CMD")="[LOSE]" W:XVW XVCHAR G COMMAND
 I XVDATA("CMD")="",XVUCHAR="D" S XVDATA("CMD")="[O]" W:XVW XVCHAR G COMMAND
 I XVDATA("CMD")="",XVUCHAR="E" S XVDATA("CMD")="[LSE]" W:XVW XVCHAR G COMMAND
 I XVDATA("CMD")="",XVUCHAR="F" S XVDATA("CMD")="[OR]" W:XVW XVCHAR G COMMAND
 I XVDATA("CMD")="",XVUCHAR="G" S XVDATA("CMD")="[OTO]" W:XVW XVCHAR G COMMAND
 I XVDATA("CMD")="",XVUCHAR="H" S XVDATA("CMD")="[ALT]|[ANG]" W:XVW XVCHAR G COMMAND
 I XVDATA("CMD")="",XVUCHAR="I" S XVDATA("CMD")="[F]" W:XVW XVCHAR G COMMAND
 I XVDATA("CMD")="",XVUCHAR="J" S XVDATA("CMD")="[OB]" W:XVW XVCHAR G COMMAND
 I XVDATA("CMD")="",XVUCHAR="K" S XVDATA("CMD")="[ILL]" W:XVW XVCHAR G COMMAND
 I XVDATA("CMD")="",XVUCHAR="L" S XVDATA("CMD")="[OCK]" W:XVW XVCHAR G COMMAND
 I XVDATA("CMD")="",XVUCHAR="M" S XVDATA("CMD")="[ERGE]" W:XVW XVCHAR G COMMAND
 I XVDATA("CMD")="",XVUCHAR="N" S XVDATA("CMD")="[EW]" W:XVW XVCHAR G COMMAND
 I XVDATA("CMD")="",XVUCHAR="O" S XVDATA("CMD")="[PEN]" W:XVW XVCHAR G COMMAND
 I XVDATA("CMD")="",XVUCHAR="Q" S XVDATA("CMD")="[UIT]" W:XVW XVCHAR G COMMAND
 I XVDATA("CMD")="",XVUCHAR="R" S XVDATA("CMD")="[EAD]" W:XVW XVCHAR G COMMAND
 I XVDATA("CMD")="",XVUCHAR="S" S XVDATA("CMD")="[ET]" W:XVW XVCHAR G COMMAND
 I XVDATA("CMD")="",XVUCHAR="T" S XVDATA("CMD")="C[OMMIT]|RE[START]|RO[LLBACK]|S[TART]" W:XVW XVCHAR G COMMAND
 I XVDATA("CMD")="",XVUCHAR="U" S XVDATA("CMD")="[SE]" W:XVW XVCHAR G COMMAND
 I XVDATA("CMD")="",XVUCHAR="V" S XVDATA("CMD")="[IEW]" W:XVW XVCHAR G COMMAND
 I XVDATA("CMD")="",XVUCHAR="W" S XVDATA("CMD")="[RITE]" W:XVW XVCHAR G COMMAND
 I XVDATA("CMD")="",XVUCHAR="X" S XVDATA("CMD")="[ECUTE]" W:XVW XVCHAR G COMMAND
 I XVDATA("CMD")="",XVUCHAR="Z" S XVDATA("CMD")="Z" W:XVW XVCHAR G COMMAND
 I XVDATA("CMD")="",XVUCHAR?1(1".",1" ") W:XVW XVCHAR G COMMAND
 I XVDATA("CMD")="",XVUCHAR=";" W:XVW $$CONTROL("COM"),XVCHAR G COMMENT
 I XVDATA("CMD")="Z",XVUCHAR?1A W:XVW XVCHAR G COMMAND
 I XVDATA("CMD")="Z",XVUCHAR=" " S XVDATA("CMD")="" W:XVW $$CONTROL("ARG"),XVCHAR G ARGUMENT
 I XVDATA("CMD")="Z",XVUCHAR=":" S XVDATA("CMD")="POST" W:XVW $$CONTROL("PUNC"),XVCHAR G PUNCMARK
 I XVDATA("CMD")="POST",XVUCHAR=" " S XVDATA("CMD")="" W:XVW XVCHAR G COMMAND
 I XVDATA("CMD")="POST",XVUCHAR?1A S XVDATA("CMD")="",XVDATA("ARG")=1 W:XVW $$CONTROL("ARG"),XVCHAR G ARGUMENT
 I XVDATA("CMD")="POST",XVUCHAR?1P S XVDATA("CMD")="" W:XVW $$CONTROL("PUNC"),XVCHAR G PUNCMARK
 I XVDATA("CMD")'="" D  Q
 . F XVNUM=1:1:$L(XVDATA("CMD"),"|") D  Q
 . . S XVCMD=$P(XVDATA("CMD"),"|",XVNUM)
 . . I XVUCHAR'=" ",$E(XVCMD,1)="[",XVUCHAR=$E($P(XVCMD,"[",2),1) S $E(XVCMD,1,2)="",XVDATA("CMD")=XVCMD W:XVW XVCHAR G COMMAND Q
 . . I XVUCHAR'=" ",$E(XVCMD,1)'="[",XVUCHAR=$E(XVCMD,1) S $E(XVCMD,1)="",XVDATA("CMD")=XVCMD W:XVW XVCHAR G COMMAND Q
 . . I XVUCHAR=" ",$E(XVCMD,1)?1(1"[",1"]") S XVDATA("CMD")="" W:XVW $$CONTROL("ARG"),XVCHAR G ARGUMENT Q
 . . I XVUCHAR=";",$E(XVCMD,1)?1(1"[",1"]") S XVDATA("CMD")="" W:XVW $$CONTROL("COM"),XVCHAR G COMMENT Q
 . . I XVUCHAR=":" S XVDATA("CMD")="POST" W:XVW $$CONTROL("PUNC"),XVCHAR G PUNCMARK Q
 . . W:XVW $$CONTROL("ERR"),XVCHAR G ERROR
 W:XVW $$CONTROL("ERR"),XVCHAR G ERROR
 Q
 ;
ARGUMENT ;Argument state
 S XVDATA=XVDATA+1
 S XVCHAR=$E(XVBUFFER,XVDATA)
 I XVCHAR="" S:XVEXT=1 XVDATA("STATE")="ARGUMENT" Q
 I XVDATA("ARG")=0,XVCHAR="""" S XVDATA("STRING")=1 W:XVW $$CONTROL("STR"),XVCHAR G STRING
 I XVDATA("ARG")=0,XVCHAR?1N W:XVW $$CONTROL("NUM"),XVCHAR G NUMBER
 I XVCHAR?1(1A,1N,1"%") S XVDATA("ARG")=1 W:XVW XVCHAR G ARGUMENT
 I XVDATA("CMD")="POST",XVCHAR=" " S XVDATA("ARG")=0,XVDATA("CMD")="" W:XVW XVCHAR G ARGUMENT
 I XVCHAR=" " S XVDATA("ARG")=0 W:XVW $$CONTROL("CMD"),XVCHAR G COMMAND
 I XVDATA("ARG")=0,XVCHAR="$" S XVDATA("FUNC")=1 W:XVW $$CONTROL("FUNC"),XVCHAR G FUNCTION
 I XVCHAR=";" S XVDATA("ARG")=0 W:XVW $$CONTROL("COM"),XVCHAR G COMMENT
 I XVCHAR?1P S XVDATA("ARG")=0 W:XVW $$CONTROL("PUNC"),XVCHAR G PUNCMARK
 W:XVW $$CONTROL("ERR"),XVCHAR G ERROR
 Q
 ;
FUNCTION ;Function state
 S XVDATA=XVDATA+1
 S XVCHAR=$E(XVBUFFER,XVDATA)
 I XVCHAR="" S:XVEXT=1 XVDATA("STATE")="FUNCTION" Q
 I XVDATA("FUNC")=1,XVCHAR="$" S XVDATA("FUNC")=0 W:XVW XVCHAR G FUNCTION
 I XVDATA("FUNC")=0,XVCHAR="$" W:XVW $$CONTROL("ERR"),XVCHAR G ERROR
 I XVCHAR?1(1A,1N) S XVDATA("FUNC")=0 W:XVW XVCHAR G FUNCTION
 I XVDATA("CMD")="POST",XVCHAR=" " S XVDATA("CMD")="" W:XVW $$CONTROL("ARG"),XVCHAR G ARGUMENT
 I XVCHAR=" " W:XVW $$CONTROL("CMD"),XVCHAR G COMMAND
 I XVCHAR=";" W:XVW $$CONTROL("COM"),XVCHAR G COMMENT
 I XVCHAR?1P W:XVW $$CONTROL("PUNC"),XVCHAR G PUNCMARK
 W:XVW $$CONTROL("ERR"),XVCHAR G ERROR
 Q
 ;
PUNCMARK ;Punctuation mark state
 S XVDATA=XVDATA+1
 S XVCHAR=$E(XVBUFFER,XVDATA)
 I XVCHAR="" S:XVEXT=1 XVDATA("STATE")="PUNCMARK" Q
 I XVDATA("CMD")="TAG",XVDATA("TAG")=0,XVCHAR?1(1"%",1".") S (XVDATA("TAG"),XVDATA("ARG"))=1 W:XVW $$CONTROL("ARG"),XVCHAR G ARGUMENT
 I XVDATA("CMD")="TAG",XVCHAR=" " S XVDATA("CMD")="",XVDATA("TAG")=0 W:XVW $$CONTROL("DEF"),XVCHAR G STATUS
 I XVDATA("CMD")="TAG",XVCHAR?1P S XVDATA("TAG")=0 W:XVW XVCHAR G PUNCMARK
 I XVDATA("CMD")="TAG",XVCHAR?1AN S XVDATA("ARG")=1 W:XVW $$CONTROL("ARG"),XVCHAR G ARGUMENT
 I XVCHAR="""" S XVDATA("STRING")=1 W:XVW $$CONTROL("STR"),XVCHAR G STRING
 I XVDATA("CMD")="POST",XVCHAR=" " S XVDATA("CMD")="" W:XVW $$CONTROL("ARG"),XVCHAR G ARGUMENT
 I XVCHAR=" " W:XVW $$CONTROL("CMD"),XVCHAR G COMMAND
 I XVCHAR="$" S XVDATA("FUNC")=1 W:XVW $$CONTROL("FUNC"),XVCHAR G FUNCTION
 I XVCHAR?1(1A,1"%") S XVDATA("ARG")=1 W:XVW $$CONTROL("ARG"),XVCHAR G ARGUMENT
 I XVCHAR=";" W:XVW $$CONTROL("COM"),XVCHAR G COMMENT
 I XVCHAR?1P W:XVW XVCHAR G PUNCMARK
 I XVCHAR?1N W:XVW $$CONTROL("NUM"),XVCHAR G NUMBER
 W:XVW $$CONTROL("ERR"),XVCHAR G ERROR
 Q
 ;
NUMBER ;Number state
 S XVDATA=XVDATA+1
 S XVCHAR=$E(XVBUFFER,XVDATA)
 I XVCHAR="" S:XVEXT=1 XVDATA("STATE")="NUMBER" Q
 I XVCHAR="""" S XVDATA("STRING")=1 W:XVW $$CONTROL("STR"),XVCHAR G STRING
 I XVCHAR?1N W:XVW XVCHAR G NUMBER
 I XVDATA("CMD")="POST",XVCHAR=" " S XVDATA("CMD")="" W:XVW $$CONTROL("ARG"),XVCHAR G ARGUMENT
 I XVCHAR?1A S XVDATA("ARG")=1 W:XVW $$CONTROL("ARG"),XVCHAR G ARGUMENT
 I XVCHAR=" " W:XVW $$CONTROL("CMD"),XVCHAR G COMMAND
 I XVCHAR=";" W:XVW $$CONTROL("COM"),XVCHAR G COMMENT
 I XVCHAR?1P W:XVW $$CONTROL("PUNC"),XVCHAR G PUNCMARK
 W:XVW $$CONTROL("ERR"),XVCHAR G ERROR
 Q
 ;
STRING ;String state
 S XVDATA=XVDATA+1
 S XVCHAR=$E(XVBUFFER,XVDATA)
 I XVCHAR="" S:XVEXT=1 XVDATA("STATE")="STRING" Q
 I XVCHAR="""" S XVDATA("STRING")=0 W:XVW XVCHAR,$$CONTROL("ARG") G ARGUMENT
 I XVDATA("STRING")=1 W:XVW XVCHAR G STRING
 W:XVW $$CONTROL("ERR"),XVCHAR G ERROR
 Q
 ;
CONTROL(CODE,ROW,COL) ;Return proper ANSI VT-100 escape sequences for colors and cursor movement
 N CL,CR,MOV,OFF,DEF,CMD,ARG,TAG,FUNC,COM,PUNC,NUM,STR,ERR,BLACK,RED,GREEN,YELLOW,BLUE,MAGENTA,CYAN,WHITE
 S ROW=$G(ROW),COL=$G(COL)
 I COL'="",ROW="" S ROW=1
 I ROW'="",COL="" S COL=1
 S CL=$C(27)_"[1K",CR=$C(27)_"[0K",DEF=$C(27)_"[0m"
 S MOV=$C(27)_"["_ROW_";"_COL_"H",OFF=""
 S BLACK=$C(27)_"[30m"_$C(27)_"[40m"
 S RED=$C(27)_"[31m"_$C(27)_"[41m"
 S GREEN=$C(27)_"[32m"_$C(27)_"[42m"
 S YELLOW=$C(27)_"[33m"_$C(27)_"[43m"
 S BLUE=$C(27)_"[34m"_$C(27)_"[44m"
 S MAGENTA=$C(27)_"[35m"_$C(27)_"[45m"
 S CYAN=$C(27)_"[36m"_$C(27)_"[46m"
 S WHITE=$C(27)_"[37m"_$C(27)_"[47m"
 S CMD=$E(@($$ALLCAPS^XVEMKU($G(^XVEMS("PARAM",XVV("ID"),"SYNTAX","COMMAND","FG"),"Yellow"))),1,5)
 S CMD=CMD_$E(@($$ALLCAPS^XVEMKU($G(^("BG"),"Off"))),6,10)
 S ARG=$E(@($$ALLCAPS^XVEMKU($G(^XVEMS("PARAM",XVV("ID"),"SYNTAX","ARGUMENT","FG"),"Magenta"))),1,5)
 S ARG=ARG_$E(@($$ALLCAPS^XVEMKU($G(^("BG"),"Off"))),6,10)
 S TAG=$E(@($$ALLCAPS^XVEMKU($G(^XVEMS("PARAM",XVV("ID"),"SYNTAX","TAG","FG"),"Magenta"))),1,5)
 S TAG=TAG_$E(@($$ALLCAPS^XVEMKU($G(^("BG"),"Off"))),6,10)
 S FUNC=$E(@($$ALLCAPS^XVEMKU($G(^XVEMS("PARAM",XVV("ID"),"SYNTAX","FUNCTION","FG"),"Cyan"))),1,5)
 S FUNC=FUNC_$E(@($$ALLCAPS^XVEMKU($G(^("BG"),"Off"))),6,10)
 S COM=$E(@($$ALLCAPS^XVEMKU($G(^XVEMS("PARAM",XVV("ID"),"SYNTAX","COMMENT","FG"),"Blue"))),1,5)
 S COM=COM_$E(@($$ALLCAPS^XVEMKU($G(^("BG"),"Off"))),6,10)
 S PUNC=$E(@($$ALLCAPS^XVEMKU($G(^XVEMS("PARAM",XVV("ID"),"SYNTAX","PUNCTUATION","FG"),"Green"))),1,5)
 S PUNC=PUNC_$E(@($$ALLCAPS^XVEMKU($G(^("BG"),"Off"))),6,10)
 S NUM=$E(@($$ALLCAPS^XVEMKU($G(^XVEMS("PARAM",XVV("ID"),"SYNTAX","NUMBER","FG"),"Red"))),1,5)
 S NUM=NUM_$E(@($$ALLCAPS^XVEMKU($G(^("BG"),"Off"))),6,10)
 S STR=$E(@($$ALLCAPS^XVEMKU($G(^XVEMS("PARAM",XVV("ID"),"SYNTAX","STRING","FG"),"Red"))),1,5)
 S STR=STR_$E(@($$ALLCAPS^XVEMKU($G(^("BG"),"Off"))),6,10)
 S ERR=$E(@($$ALLCAPS^XVEMKU($G(^XVEMS("PARAM",XVV("ID"),"SYNTAX","ERRROR","FG"),"White"))),1,5)
 S ERR=ERR_$E(@($$ALLCAPS^XVEMKU($G(^("BG"),"Red"))),6,10)
 W DEF QUIT @CODE
