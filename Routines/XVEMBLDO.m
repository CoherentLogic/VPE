XVEMBLDO ;DJB,VSHL**VPE Setup - Old Editor ; 12/15/00 5:21pm
 ;;12;VPE;;COPYRIGHT David Bolduc @1993
 ;
TOP ;
 NEW END,FF,FLAGQ,I,LINE,START,TO,TXT,U,X,XX,Y
 NEW CNT,LN,RTN,TAG
 S FLAGQ=0
 D INIT^XVEMBLD G:FLAGQ EX
 D UCI^XVEMBLD G:FLAGQ EX
 D EDITOLD G:FLAGQ EX
 ;Next, load Help text
 S CNT=1
 KILL ^XVEMS("ZZ","VRROLD")
 S RTN="XVEMOH",TAG="VRROLD" D TEXT2^XVEMSGH
 S RTN="XVEMOH1",TAG="VRROLD" D TEXT2^XVEMSGH
 S RTN="XVEMOH2",TAG="VRROLD" D TEXT2^XVEMSGH
EX ;
 Q
EDITOLD ;Load old Editor into ^XVEMS("EOLD") global
 NEW CODE,I,TXT
 S FLAGQ=0
 W !!?2,"Install global at ""XVEMS(""EOLD"")",!
 D YESNO^XVEMBLD("Install old Routine Editor global: YES// ") Q:FLAGQ
 S TXT=$T(CODEOLD+1)
 S CODE=$P(TXT,";",3,99)
 KILL ^XVEMS("EOLD")
 S ^XVEMS("EOLD")=CODE
 F I=2:1 S TXT=$T(CODEOLD+I) Q:$P(TXT,";",3)="***"  S CODE=$P(TXT,";",3,99),^XVEMS("EOLD",I-1)=CODE
 W !!?2,"Old routine editor successfully loaded.",!
 Q
 ;
CODEOLD ;Old global for rtn editing
 ;;X ^XVEMS("EOLD",3) Q:$G(DUZ)=""  NEW FLAGSAVE,FLAGVPE,XVVS NEW:$G(XVV("OS"))']"" XVV X ^XVEMS("EOLD",4) Q:'$D(^TMP("XVV","VRR",$J))  X ^XVEMS("EOLD",1) L
 ;;NEW VRRPGM,X D SAVE^XVEMOC Q:$G(VRRPGM)']""  X ^XVEMS("EOLD",2)
 ;;NEW X S X=VRRPGM X XVVS("ZS") KILL ^UTILITY($J)
 ;;Q:$G(DUZ)>0  S ^TMP("XVV",$J)=$G(%1) D ID^XVEMKU S:$G(XVVSHL)="RUN" %1=^TMP("XVV",$J) KILL ^TMP("XVV",$J)
 ;;S $P(FLAGVPE,"^",4)="EDIT",FLAGSAVE=0 D PARAM^XVEMO($G(%1))
 ;;***