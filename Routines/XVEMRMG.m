XVEMRMG ;DJB,VRR**Goto Tag+Offset,XINDEX ; 8/12/09 10:23pm
 ;;12;VPE;**LOCAL**;COPYRIGHT David Bolduc @1993
 ;
 ; 2009 08 12 VEN/TOAD **LOCAL MOD** replaced %INDEX with XINDEX
 ; throughout routine - Rick Marshall of VEN on VISTA Forum.
 ;
EN ;
 I '$D(^TMP("XVV","IR"_VRRS,$J,1)) W $C(7) Q
 I $G(^TMP("XVV","IR"_VRRS,$J,1))=" <> <> <>" W $C(7) Q
 NEW FLAGQ,TAG,OFFSET
 Q:$G(LN)'["+"
 S TAG=$P(LN,"+",1)
 S OFFSET=$P(LN,"+",2) Q:OFFSET'>0
 S FLAGQ=0
 D FINDTAG Q:FLAGQ
 D OFFSET
 Q
 ;
FINDTAG ;Find line tag that contains TXT
 NEW CHK,I,TG,TMP
 S CHK=0
 F I=1:1 S TMP=$G(^TMP("XVV","IR"_VRRS,$J,I)) Q:TMP']""  Q:TMP=" <> <> <>"  D  Q:CHK
 . Q:TMP'[$C(30)
 . D GETTAG Q:TG'[TAG
 . ;Note: FLAGMENU=YND^XVVT("TOP")^YCUR^XCUR
 . S FLAGMENU=I_"^"_I_"^"_1
 . S CHK=1
 I 'CHK S FLAGQ=1,(XCUR,YCUR)=0 D MSG^XVEMRUM(16)
 Q
 ;
GETTAG ;Get tag from scroll array and convert to external format
 S TG=$P(TMP," "_$C(30),1)
 I TG?1.N1." " S TG="" Q
 F  Q:$E(TG)'=" "  S TG=$E(TG,2,999) ;Strip starting spaces
 Q
 ;
OFFSET ;Go to offset
 NEW HELP,NUM,X
 ;Convert node array number to line number
 S (NUM,X)=$P(FLAGMENU,U,1)
 S OFFSET=NUM+OFFSET
 F  S X=$O(^TMP("XVV","IR"_VRRS,$J,X)) Q:X'>0  D  Q:NUM=OFFSET
 . I ^(X)[$C(30) S NUM=NUM+1
 ;Show at least 1 line of code
 I X'>0 S X=$O(^TMP("XVV","IR"_VRRS,$J,""),-1) S:X>1 X=X-1
 S FLAGMENU=X_"^"_X_"^"_1
 Q
 ;====================================================================
INDEX ;Run XINDEX
 D SYMTAB^XVEMKST("S","VRR",VRRS) ;......Save symbol table
 NEW RTN
 S RTN=$G(^TMP("XVV","VRR",$J,VRRS,"NAME"))
 W !,"*** RUNNING XINDEX ("_RTN_") ***",!
 D  ;
 . NEW XVV,XVVS,VRRS
 . D ^XINDEX
 . KILL
 D SYMTAB^XVEMKST("R","VRR",VRRS) ;......Restore symbol table
 X ^XVEMS("ZS",3) ;......................Reset VShell variables
 D PAUSE^XVEMKC(2)
 Q