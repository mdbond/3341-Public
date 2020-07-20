#!/bin/bash

javac Counter.java

while true
do
  timeout 3 java Counter || echo Timed out
done
