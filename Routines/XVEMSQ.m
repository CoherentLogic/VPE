XVEMSQ ;DJB,VSHL**QWIKs - Add/Edit [1/16/96 11:06pm]
 ;;12;VPE;;COPYRIGHT David Bolduc @1993
 ;
 NEW BOX,BX,CD,CDHLD,FLAGJMP,FLAGQ,I,NAM,PROMPT
 ;Next 5 lines for viewing BOX
 I $E(XVVSHC)="." G:XVVSHC'?1.2"."1.N.1A EX NEW BOX,TYPE D  D LISTQ^XVEMSQL(BOX,TYPE) G EX
 . I XVVSHC?1"."1.N S BOX=$E(XVVSHC,2,99),TYPE=1 Q 
 . I XVVSHC?1"."1.N1A S BOX=$E(XVVSHC,2,$L(XVVSHC)-1),TYPE=2 Q
 . I XVVSHC?1".."1.N S BOX=$E(XVVSHC,3,99),TYPE=3 Q
 . I XVVSHC?1".."1.N1A S BOX=$E(XVVSHC,3,$L(XVVSHC)-1),TYPE=4 Q
 I "<AD>,<AL>,<AU>,<F1-1>,<F1-2>,<F1-3>,<F1-4>,<QD>,<TAB>"'[XVVSHC G EX
 I XVVSHC?1"<A".E D EN^XVEMSCL("VSHL") G EX ;Cmnd Line History
 D @$S(XVVSHC="<F1-1>":"LISTQ^XVEMSQL("""",1)",XVVSHC="<F1-2>":"LISTQ^XVEMSQL("""",2)",XVVSHC="<F1-3>":"LISTQ^XVEMSQL("""",3)",XVVSHC="<F1-4>":"LISTQ^XVEMSQL("""",4)",1:"ADD")
EX ;
 Q
ADD ;Add/Edit a QWIK
 W !!?1,"*** Add/Edit QWIK Command ***"
ADD1 S (FLAGQ,FLAGJMP)=0 D GETNAM(1) Q:FLAGQ  D DISPLAY^XVEMSQA
ADD2 D NAME^XVEMSQE G:XVVSHC="<TAB>" ADD1 Q:FLAGQ
 D CODE^XVEMSQE G:XVVSHC="<TAB>" ADD1 Q:FLAGQ
 D TEXT^XVEMSQE("DSC") G:XVVSHC="<TAB>" ADD1 Q:FLAGQ
 D TEXT^XVEMSQE("PARAM") G:XVVSHC="<TAB>" ADD1 Q:FLAGQ
 D BOX^XVEMSQE Q:FLAGQ
 I FLAGJMP G ADD2 ;User hit <ESC> and number of field to jump to
 G ADD1
 ;====================================================================
GETNAM(LAYGO) ;Get name of QWIK.
 ;LAYGO=If 1 you may select name of QWIK that doesn't already exist.
GETNAM1 W ! S CD="" D SCREEN^XVEMKEA("Enter QWIK: ",1,XVV("IOM")-2)
 I CD="?"!(XVVSHC="<ESCH>") D  G GETNAM1
 . I '$G(LAYGO) D MSG^XVEMSQA(8),MSG^XVEMSQA(7) Q
 . D MSG^XVEMSQA(1),MSG^XVEMSQA(7)
 I ",<ESC>,<F1E>,<F1Q>,<TAB>,<TO>,"[(","_XVVSHC_",")!(CD']"")!(CD="^") S FLAGQ=1 Q
 I CD="??" D USER^XVEMSQS G GETNAM1
 I CD=" " S CD=$G(^XVEMS("%",$J_$G(^XVEMS("SY")),"LASTQWIK")) I CD']"" G GETNAM1
 S CD=$$ALLCAPS^XVEMKU(CD)
 I CD'?1A.7AN D MSG^XVEMSQA(1),MSG^XVEMSQA(7) G GETNAM1
 I $D(^XVEMS("QU",XVV("ID"),CD))>1,$G(^(CD))']"" KILL ^XVEMS("QU",XVV("ID"),CD) ;Clean up any bad nodes.
 I '$G(LAYGO),$G(^XVEMS("QU",XVV("ID"),CD))']"" D  G GETNAM1
 . D MSG^XVEMSQA(8),MSG^XVEMSQA(7)
 S NAM=CD,^XVEMS("%",$J_$G(^XVEMS("SY")),"LASTQWIK")=NAM
 Q