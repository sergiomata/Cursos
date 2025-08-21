# loop on array member
NAMES=(Joe Jenny Sara Tony)
for N in ${NAMES[@]} ; do
  echo "My name is $N"
done

# loop on command output results
for f in $( ls prog.sh /etc/localtime ) ; do
  echo "File is: $f"
done

COUNT=4
while [ $COUNT -gt 0 ]; do
  echo "Value of count is: $COUNT"
  COUNT=$(($COUNT - 1))
done

COUNT=1
until [ $COUNT -gt 5 ]; do
  echo "Value of count is: $COUNT"
  COUNT=$(($COUNT + 1))
done

COUNT=0
while [ $COUNT -ge 0 ]; do
  echo "Value of COUNT is: $COUNT"
  COUNT=$((COUNT+1))
  if [ $COUNT -ge 5 ] ; then
    break
  fi
done

# Prints out only odd numbers - 1,3,5,7,9
COUNT=0
while [ $COUNT -lt 10 ]; do
  COUNT=$((COUNT+1))
  # Check if COUNT is even
  if [ $(($COUNT % 2)) = 0 ] ; then
    continue
  fi
  echo $COUNT
done

#!/bin/bash
NUMBERS=(951 402 984 651 360 69 408 319 601 485 980 507 725 547 544 615 83 165 141 501 263 617 865 575 219 390 237 412 566 826 248 866 950 626 949 687 217 815 67 104 58 512 24 892 894 767 553 81 379 843 831 445 742 717 958 609 842 451 688 753 854 685 93 857 440 380 126 721 328 753 470 743 527)

LAST_INDEX=0
echo "${NUMBERS[LAST_INDEX]}"
until [ "${NUMBERS[LAST_INDEX]}" -eq "237" ]; do
  LAST_INDEX=$(($LAST_INDEX + 1))
  echo "${LAST_INDEX}"
done
SLICED_ARRAY=("${NUMBERS[@]:0:$LAST_INDEX}")
for number in ${SLICED_ARRAY[@]} ; do
  if ((${number} % 2 == 0)); then
   echo "${number}"
   fi
done