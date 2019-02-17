#!/bin/bash
for i in {1..10000}
do
  echo "$(curl -sSL $1)" >> /tmp/temp
done
echo "A = $(grep -o 'a' /tmp/temp | wc -l)" > /tmp/result.txt
echo "B = $(grep -o 'b' /tmp/temp | wc -l)" >> /tmp/result.txt
rm -f /tmp/temp
echo "$(cat /tmp/result.txt)"
