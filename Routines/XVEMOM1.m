XVEMOM1 ;DJB,VRROLD**Main Menu cont.. [9/20/96 8:08am]
 ;;7.0;VPE;;COPYRIGHT David Bolduc @1993
 ;
 I $E(VRRACT)="?" D HELP^XVEMKT("VRROLD") Q
 I VRRACT="ASC",$G(XVVSHL)="RUN" D ASCII^XVEMST,PAUSE^XVEMKC(1) Q
 I VRRACT="B" KILL VRRCRSR W:LNUM>VRRHIGH $C(7) S PGTOP=$S(PGTOP<(VRRHIGH-5):(VRRHIGH-5),1:PGTOP) Q
 I VRRACT="BK" D RUN^XVEMOU("BREAK^XVEMOE2") Q
 I VRRACT="D" D DELETE^XVEMOE Q
 I VRRACT="FMC",$G(XVVSHL)="RUN" D RUN^XVEMOU("^XVEMSF") Q
 I VRRACT="H" D HOT^XVEMOU Q
 I VRRACT="I" D RUN^XVEMOU("INSERT^XVEMOE") Q
 I VRRACT="J" D JOIN^XVEMOE2 Q
 I VRRACT="LC" D LC^XVEMOE1 Q
 I VRRACT="RS" D RUN^XVEMOU("RSE^XVEMOY") Q
 I VRRACT="SA" D SAVE^XVEMOE1 Q
 I VRRACT="SP" S VRRSP=$S(VRRSP=2:1,1:2) KILL VRRCRSR Q
 I VRRACT="T" KILL VRRCRSR W:PGTOP=1 $C(7) S PGTOP=1 Q
 I VRRACT="U" KILL VRRCRSR W:PGTOP=1 $C(7) S PGTOP=$S(PGTOP>$S(VRRSP=1:12,1:6):PGTOP-$S(VRRSP=1:12,1:6),1:1) Q
 I VRRACT="UN" D UNSAVE^XVEMOE1 Q
 I VRRACT="VEDD" D VEDD^XVEMOY Q
 I VRRACT="VGL" D VGL^XVEMOY Q
 Q
 ;====================================================================
MENUS ;List selected sub-menu
 D BOTTOM^XVEMOU ;Blank bottom of screen
 I VRRACT="ED" W " 'n',<TAB>=EditLn  I=Insert  D=Del  LC=LctChng  SA=Save  UN=Unsave",!," BK=Break  J=Join  MD=ChangeMode  PUR=Purge"
 I VRRACT="N" W " <RET>=DwnPg  U=UpPg  T=Top  B=Bottom  G=Goto  F=FndTag  L=LctStrng",!," <AU>=LnUp  <AD>=LnDn  <AL>=PgTop  <AR>=PgBottom"
 I VRRACT="BR" W " R=Rtn  H=Hot  RS=RtnSrch  VEDD=VEDD  VGL=VGL"
 I VRRACT="M" W " SP=DblSpace  MK=Mark  COL'n'=Collapse  FMC=FM Calls  ASC=ASCII"
 D PAUSE^XVEMKC(1)
 Q
GOTO ;Go to a line
 D BOTTOM^XVEMOU ;Blank bottom of screen
GOTO1 S VRRLN=$$GETLINE^XVEMOU("LINE NUMBER: ")
 I VRRLN="^" D RESET^XVEMOM Q
 I VRRLN="?" D MSG2^XVEMOUM(4) G GOTO1
 I VRRLN="MK" S VRRLN=$G(VRRMARK) I VRRLN'>0 D MSG2^XVEMOUM(6) G GOTO1
 I VRRLN?1.N Q
 D MSG2^XVEMOUM(3) G GOTO1
 Q
CRSRDEL1 ;Set FLAGDEL with range of lines for deleting
 I $G(FLAGDEL)?1.N1"-"1.N KILL FLAGDEL Q
 I VRRCRSR=1 W $C(7) Q
 I $G(FLAGDEL)']"" S FLAGDEL=VRRCRSR_"-" Q
 I VRRCRSR<+FLAGDEL S FLAGDEL=VRRCRSR_"-"_+FLAGDEL Q
 S FLAGDEL=FLAGDEL_VRRCRSR
 Q
CRSRDEL2 ;Delete range of lines using cursor
 I $G(FLAGDEL)'?1.N1"-"1.N W $C(7) KILL FLAGDEL Q
 S VRRLN=FLAGDEL D DELETEB^XVEMOE KILL FLAGDEL
 Q