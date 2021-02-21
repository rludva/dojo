#!/usr/bin/env bash

# Yero Test Function: Test Nothing..
function Nothing() {
  echo "green"
}

# First Test function: Check if there is a variable named MAGIC_NUMBER..
function variableExists() {
  VARIABLE="MAGIC_NUMBER"
  if [[ $(env | grep "$VARIABLE=" | wc -l) -eq 1 ]]; then
    echo "green"
    return
  fi
  echo "red"
}

# Test Function: Check if the 'magic' number
function variableIsInteger() {
  VARIABLE="MAGIC_NUMBER"
  if [ "$VARIABLE" -eq "$VARIABLE" ] 2>/dev/null; then
      echo "green"
    return
  fi
  echo "red"
}

# Test Function: Check if the value is 'magic'..
function variableIsMagic() {
  if [ "$MAGIC_NUMBER" -eq 13 ]; then
    echo "green"
    return
  fi
  echo "red"
}

## Process The Tests..
clear
echo "Processing tests.."
echo -n "0. Nothing: " && Nothing
. ./production.sh && echo -n "1. variableExists: " && variableExists
. ./production.sh && echo -n "2. variableIsInteger: " && variableIsInteger
. ./production.sh && echo -n "3. variableIsMagic: " && variableIsMagic
echo ""
