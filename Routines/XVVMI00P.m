XVVMI00P ; ; 04-JAN-2004
 ;;15.0;VICTORY PROG ENVIRONMENT;;May 01, 2019
 F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,2,0)
 ;;=1^FM CALL^3
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,2,1)
 ;;=20
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,2,2)
 ;;=2,11^20^2,2
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,2,4)
 ;;=^^^1
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,3,0)
 ;;=3^1^3
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,3,1)
 ;;=21
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,3,2)
 ;;=4,5^25^4,3^1
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,3,4)
 ;;=^^^1
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,4,0)
 ;;=5^2^3
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,4,1)
 ;;=22
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,4,2)
 ;;=5,5^25^5,3^1
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,4,4)
 ;;=^^^1
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,5,0)
 ;;=7^3^3
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,5,1)
 ;;=23
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,5,2)
 ;;=6,5^25^6,3^1
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,5,4)
 ;;=^^^1
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,6,0)
 ;;=4^^3^^VALUE1
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,6,1)
 ;;=61
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,6,2)
 ;;=4,32^47
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,6,3)
 ;;=!M
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,6,3.1)
 ;;=D DEFAULT^XVEMRID(1)
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,6,11)
 ;;=D HELP^XVEMRID(1)
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,6,14)
 ;;=Q:X=""  Q:"Hh"'[X  D EXTHELP^XVEMRIE(1)
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,7,0)
 ;;=6^^3
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,7,1)
 ;;=62
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,7,2)
 ;;=5,32^47
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,7,3)
 ;;=!M
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,7,3.1)
 ;;=D DEFAULT^XVEMRID(2)
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,7,11)
 ;;=D HELP^XVEMRID(2)
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,7,14)
 ;;=Q:X=""  Q:"Hh"'[X  D EXTHELP^XVEMRIE(2)
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,8,0)
 ;;=8^^3
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,8,1)
 ;;=63
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,8,2)
 ;;=6,32^47
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,8,3)
 ;;=!M
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,8,3.1)
 ;;=D DEFAULT^XVEMRID(3)
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,8,11)
 ;;=D HELP^XVEMRID(3)
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,8,14)
 ;;=Q:X=""  Q:"Hh"'[X  D EXTHELP^XVEMRIE(3)
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,9,0)
 ;;=9^4^3
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,9,1)
 ;;=24
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,9,2)
 ;;=7,5^25^7,3^1
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,9,4)
 ;;=^^^1
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,10,0)
 ;;=10^^3
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,10,1)
 ;;=64
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,10,2)
 ;;=7,32^47
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,10,3)
 ;;=!M
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,10,3.1)
 ;;=D DEFAULT^XVEMRID(4)
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,10,11)
 ;;=D HELP^XVEMRID(4)
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,10,14)
 ;;=Q:X=""  Q:"Hh"'[X  D EXTHELP^XVEMRIE(4)
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,11,0)
 ;;=11^5^3
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,11,1)
 ;;=25
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,11,2)
 ;;=8,5^25^8,3^1
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,11,4)
 ;;=^^^1
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,12,0)
 ;;=13^6^3
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,12,1)
 ;;=26
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,12,2)
 ;;=9,5^25^9,3^1
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,12,4)
 ;;=^^^1
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,13,0)
 ;;=15^7^3
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,13,1)
 ;;=27
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,13,2)
 ;;=10,5^25^10,3^1
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,13,4)
 ;;=^^^1
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,14,0)
 ;;=17^8^3
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,14,1)
 ;;=28
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,14,2)
 ;;=11,5^25^11,3^1
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,14,4)
 ;;=^^^1
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,15,0)
 ;;=19^9^3
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,15,1)
 ;;=29
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,15,2)
 ;;=12,5^25^12,3^1
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,15,4)
 ;;=^^^1
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,16,0)
 ;;=21^10^3
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,16,1)
 ;;=30
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,16,2)
 ;;=13,5^25^13,2^1
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,16,4)
 ;;=^^^1
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,17,0)
 ;;=23^11^3
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,17,1)
 ;;=31
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,17,2)
 ;;=14,5^25^14,2^1
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,17,4)
 ;;=^^^1
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,18,0)
 ;;=25^12^3
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,18,1)
 ;;=32
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,18,2)
 ;;=15,5^25^15,2^1
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,18,4)
 ;;=^^^1
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,19,0)
 ;;=12^^3
 ;;^UTILITY(U,$J,"DIST(.404,",718,40,19,1)
 ;;=65
