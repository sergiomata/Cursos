#!/bin/bash

BUFFETT="Life is like a snowball. The important thing is finding wet snow and a really long hill."
# write your code here
ISAY=${BUFFETT[@]}
ISAY=${ISAY[@]/snow/foot}
echo "ISAY"
echo "${ISAY}"
ISAY=${ISAY[@]/snow/}
echo "${ISAY[@]}"
ISAY=${ISAY[@]/finding/getting} 
echo "${ISAY[@]}"
WETINDEX=`expr index "$ISAY" 'w'`
echo "${WETINDEX}"
CHOP1FIELD=${ISAY:0:WETINDEX-2}
CHOP2FIELD=${ISAY:WETINDEX}
echo "${CHOP2FIELD}"
TINDEX=`expr index "$CHOP2FIELD" 't'`
echo "${TINDEX}"
CHOP3FIELD=${CHOP2FIELD:TINDEX}
echo "${CHOP3FIELD}"
ISAY=${CHOP1FIELD}${CHOP3FIELD} 
echo "${ISAY}"