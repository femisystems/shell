#!/bin/bash
echo "Hello! How are you?"

read RESPONSE

if [ "$RESPONSE" = "good" ]
then
  echo "That's great"
fi