XVVMI006 ; ; 04-JAN-2004
 ;;15.0;VICTORY PROG ENVIRONMENT;;May 01, 2019
 Q:'DIFQR(19200.113)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,19200.113)
 ;;=^XVV(19200.113,
 ;;^UTILITY(U,$J,19200.113,0)
 ;;=VPE PROGRAMMER CALL^19200.113I^21^21
 ;;^UTILITY(U,$J,19200.113,1,0)
 ;;=DBS DIALOG BUILDER^^DIALOG^p^Create msg array
 ;;^UTILITY(U,$J,19200.113,1,"P")
 ;;=1^2^3^4^5
 ;;^UTILITY(U,$J,19200.113,1,"RTN")
 ;;=BLD^DIALOG
 ;;^UTILITY(U,$J,19200.113,1,"V1")
 ;;=201
 ;;^UTILITY(U,$J,19200.113,1,"V2")
 ;;="TEST"
 ;;^UTILITY(U,$J,19200.113,1,"V4")
 ;;="AAA"
 ;;^UTILITY(U,$J,19200.113,2,0)
 ;;=DBS DIALOG EZBLD^^DIALOG^p^Simple text output
 ;;^UTILITY(U,$J,19200.113,2,"P")
 ;;=1^2
 ;;^UTILITY(U,$J,19200.113,2,"RTN")
 ;;=$$EZBLD^DIALOG
 ;;^UTILITY(U,$J,19200.113,3,0)
 ;;=DBS DIALOG WRITER^^DIALOG^p^Writes text
 ;;^UTILITY(U,$J,19200.113,3,"P")
 ;;=6^4^7^8^9
 ;;^UTILITY(U,$J,19200.113,3,"RTN")
 ;;=MSG^DIALOG
 ;;^UTILITY(U,$J,19200.113,4,0)
 ;;=DBS DIC $$FIND^^DIC^p^Returns record number
 ;;^UTILITY(U,$J,19200.113,4,"P")
 ;;=10^12^15^14^17^18^21
 ;;^UTILITY(U,$J,19200.113,4,"RTN")
 ;;=$$FIND^DIC
 ;;^UTILITY(U,$J,19200.113,5,0)
 ;;=DBS DIC FIND^^DIC^p^General purpose look-up
 ;;^UTILITY(U,$J,19200.113,5,"P")
 ;;=10^12^13^15^14^16^17^18^19^20^21
 ;;^UTILITY(U,$J,19200.113,5,"RTN")
 ;;=FIND^DIC
 ;;^UTILITY(U,$J,19200.113,6,0)
 ;;=FM DELETE^^DIK^v^Delete an entry
 ;;^UTILITY(U,$J,19200.113,6,"P")
 ;;=24^22^23
 ;;^UTILITY(U,$J,19200.113,6,"RTN")
 ;;=DIK
 ;;^UTILITY(U,$J,19200.113,7,0)
 ;;=FM DIB^^DIB^v^User controlled edit
 ;;^UTILITY(U,$J,19200.113,7,"P")
 ;;=25^59^26
 ;;^UTILITY(U,$J,19200.113,7,"RTN")
 ;;=EN^DIB
 ;;^UTILITY(U,$J,19200.113,8,0)
 ;;=FM DATA CONVERT^^DIQ^v^Convert data to ext. form
 ;;^UTILITY(U,$J,19200.113,8,"P")
 ;;=27^28
 ;;^UTILITY(U,$J,19200.113,8,"RTN")
 ;;=Y^DIQ
 ;;^UTILITY(U,$J,19200.113,9,0)
 ;;=FM DATA DISPLAY^^DIQ^v^Display data
 ;;^UTILITY(U,$J,19200.113,9,"P")
 ;;=29^22^30^31
 ;;^UTILITY(U,$J,19200.113,9,"RTN")
 ;;=EN^DIQ
 ;;^UTILITY(U,$J,19200.113,10,0)
 ;;=FM LOADER^^DDIOL^p^Replaces WRITE statements
 ;;^UTILITY(U,$J,19200.113,10,"P")
 ;;=32^33^34
 ;;^UTILITY(U,$J,19200.113,10,"RTN")
 ;;=EN^DDIOL
 ;;^UTILITY(U,$J,19200.113,11,0)
 ;;=FM ACCESS^^^v^Determine file access
 ;;^UTILITY(U,$J,19200.113,11,"P")
 ;;=35^36
 ;;^UTILITY(U,$J,19200.113,11,"RTN")
 ;;=DIAC
 ;;^UTILITY(U,$J,19200.113,12,0)
 ;;=FM DIC^^^v^File lookup/Add new entry
 ;;^UTILITY(U,$J,19200.113,12,"P")
 ;;=29^37^38^39^40^41^42^43^44^45^46^47^48
 ;;^UTILITY(U,$J,19200.113,12,"RTN")
 ;;=DIC
 ;;^UTILITY(U,$J,19200.113,13,0)
 ;;=FM XREF LOOKUP^^DIC1^v^Lookup on specific xrefs
 ;;^UTILITY(U,$J,19200.113,13,"P")
 ;;=29^37^49^47
 ;;^UTILITY(U,$J,19200.113,13,"RTN")
 ;;=MIX^DIC1
 ;;^UTILITY(U,$J,19200.113,14,0)
 ;;=FM NEW ENTRY^^DICN^v^Adding a new entry
 ;;^UTILITY(U,$J,19200.113,14,"P")
 ;;=53^37^43^22^50^51^52
 ;;^UTILITY(U,$J,19200.113,14,"RTN")
 ;;=FILE^DICN
 ;;^UTILITY(U,$J,19200.113,15,0)
 ;;=FM YES/NO^^DICN^v^YES/NO response
 ;;^UTILITY(U,$J,19200.113,15,"P")
 ;;=54
 ;;^UTILITY(U,$J,19200.113,15,"RTN")
 ;;=YN^DICN
 ;;^UTILITY(U,$J,19200.113,16,0)
 ;;=FM DISPLAY^^DICQ^v^Entry display for lookups
 ;;^UTILITY(U,$J,19200.113,16,"P")
 ;;=29^37^40^55^56
 ;;^UTILITY(U,$J,19200.113,16,"RTN")
 ;;=DQ^DICQ
 ;;^UTILITY(U,$J,19200.113,17,0)
 ;;=FM DATA DICTIONARY^^DID^v^List data dictionary
 ;;^UTILITY(U,$J,19200.113,17,"P")
 ;;=29^57
 ;;^UTILITY(U,$J,19200.113,17,"RTN")
 ;;=EN^DID
 ;;^UTILITY(U,$J,19200.113,18,0)
 ;;=FM EDIT^^^v^Edit an entry
 ;;^UTILITY(U,$J,19200.113,18,"P")
 ;;=25^22^58^59^26^60
 ;;^UTILITY(U,$J,19200.113,18,"RTN")
 ;;=DIE
 ;;^UTILITY(U,$J,19200.113,19,0)
 ;;=DBS DATA RETRIEVER^^DIQ^p^Retrieves fields of data
 ;;^UTILITY(U,$J,19200.113,19,"P")
 ;;=10^12^62^61^67^21
 ;;^UTILITY(U,$J,19200.113,19,"RTN")
 ;;=GETS^DIQ
 ;;^UTILITY(U,$J,19200.113,20,0)
 ;;=DBS UPDATER^^DIE^p^Add new entries
 ;;^UTILITY(U,$J,19200.113,20,"P")
 ;;=63^64^65^21
 ;;^UTILITY(U,$J,19200.113,20,"RTN")
 ;;=UPDATE^DIE
 ;;^UTILITY(U,$J,19200.113,21,0)
 ;;=DBS FILER^^DIE^p^Puts data into the database
 ;;^UTILITY(U,$J,19200.113,21,"P")
 ;;=66^64^21
 ;;^UTILITY(U,$J,19200.113,21,"RTN")
 ;;=FILE^DIE
 ;;^UTILITY(U,$J,19200.113,21,"V1")
 ;;=
 ;;^UTILITY(U,$J,19200.113,21,"V2")
 ;;=
 ;;^UTILITY(U,$J,19200.113,21,"V3")
 ;;=
