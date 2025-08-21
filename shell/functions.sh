#!/bin/bash
function ENGLISH_CALC {
  a="$1"
  operator="$2"
  c="$3"
  if [ "$operator" = "plus" ]; then
    echo "$((a + c))"
  elif [ "$operator" = "minus" ]; then
    echo "$((a - c))"
 elif [ "$operator" = "times" ]; then
    echo "$((a * c))"
  else
    echo "Invalid operator"
  fi
}

# testing code
ENGLISH_CALC 3 plus 5
ENGLISH_CALC 5 minus 1
ENGLISH_CALC 4 times 6