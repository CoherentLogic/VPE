XVSC ; Paideia/SMH - VPE warn of a global kill; ; 10/17/09 11:16pm
 ;;13.0;VICTORY PROG ENVIRONMENT;;Feb 29, 2016
 ;;XV
 ;
 Q:$G(XVVWARN)="QWIK"
 N HLD
 S HLD=$$ALLCAPS^XVEMKU(XVVSHC)
 I HLD["K",HLD["^" DO
 . N FLAGG S FLAGG="GLB"
 . D KILLCHK^XVEMKU(HLD)
 QUIT
