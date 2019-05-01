XVEMDN ;DJB/VEDD**NODE Lookup and Look-up by Global [11/04/94];2017-08-15  12:19 PM
 ;;15.0;VICTORY PROG ENVIRONMENT;;May 01, 2019
 ; Original Code authored by David J. Bolduc 1985-2005
 ;
 NEW FILE,FLD,NODE,NODE0,NODE1,PIECE
 NEW FLAGD,FNAM,FNUM,LEV,NP
 KILL ^TMP("XVV","VEDD",$J,"NP") S FILE=ZNUM
ND ;Lookup by NODE and PIECE
 D NDGET G:FLAGQ EX D NDBLD
 I '$D(^TMP("XVV","VEDD",$J,"NP")) W $C(7),"   No such node." G ND
ND1 D NDPRT G:FLAGQ EX
 I $O(^TMP("XVV","VEDD",$J,"NP",NODE,""))=0 S FILE=+$P(^TMP("XVV","VEDD",$J,"NP",NODE,0),U,3),NODE1=NODE G ND
 D NDSUM G:FLAGD ND G:FLAGE EX
 S FLAGQ=0 G ND1
EX ;
 S:'FLAGE FLAGQ=0 KILL ^TMP("XVV","VEDD",$J,"NP")
 Q
NDGET ;Node get
NDGET1 I FILE'=ZNUM W !!,"Select '",NODE1,"' SUBNODE: "
 E  W !,"Select NODE: "
 R NODE:XVV("TIME") S:'$T NODE="^" I "^"[NODE S FLAGQ=1 Q
 I NODE="?" D HELP G NDGET1
 Q
NDBLD ;
 S FLD=0 KILL ^TMP("XVV","VEDD",$J,"NP")
 F  S FLD=$O(^DD(FILE,FLD)) Q:FLD'>0  I $P($P(^DD(FILE,FLD,0),U,4),";")=NODE S NODE0=^(0),NP=$P(NODE0,U,4),PIECE=$P(NP,";",2),^TMP("XVV","VEDD",$J,"NP",NODE,PIECE)=FLD_U_$P(NODE0,U,1,4)
 Q
NDPRT ;Print
 S PIECE="" W @XVV("IOF") D HD
 F  S PIECE=$O(^TMP("XVV","VEDD",$J,"NP",NODE,PIECE)) Q:PIECE=""  W !?3,$J(NODE_";"_PIECE,12),?20,$J($P(^TMP("XVV","VEDD",$J,"NP",NODE,PIECE),U),7),?32,$P(^(PIECE),U,2) I $Y>XVVSIZE D PAGE Q:FLAGQ=1
 Q
NDSUM ;
 W !!?2,"You may now do an 'INDIVIDUAL FIELD DD'",!?2,"on the field(s) listed above.."
 S FLAGD=0 W ! S DIC="^DD("_FILE_",",DIC(0)="QEAM" D ^DIC I Y<0 S FLAGD=1 Q
 S FNUM=+Y,FNAM=$P(Y,U,2),LEV=1,FILE(LEV)=FILE D INDIV^XVEMKI1(FILE(LEV),FNUM) Q:FLAGQ
 I $Y'>XVVSIZE F I=$Y:1:XVVSIZE W !
 D PAUSE^XVEMKC(2)
 Q
PAGE ;
 D PAUSEQE^XVEMKC(2) Q:FLAGQ  W @XVV("IOF") D HD
 Q
HELP ;
 NEW FLD,NDTEMP
 S FLD=0 KILL ^TMP("XVV","VEDD",$J,"NP")
 F  S FLD=$O(^DD(FILE,FLD)) Q:FLD'>0  S NDTEMP=$P($P(^DD(FILE,FLD,0),U,4),";") W:'$D(^TMP("XVV","VEDD",$J,"NP",NDTEMP))#2 "  ",NDTEMP W:$X>70 !?5 S ^TMP("XVV","VEDD",$J,"NP",NDTEMP)=""
 KILL ^TMP("XVV","VEDD",$J,"NP") Q
HD ;Node look-up
 W !?3,"NODE ; PIECE",?20,"FLD NUM",?42,"FIELD NAME"
 W !?3,"------------",?20,"-------",?32,"------------------------------"
 Q
