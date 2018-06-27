#! /bin/bash

a=5
b=10
c="natting test"

echo a=$a
echo b=$b
echo c=$c

echo -n "input sth:"    #-n = 개행
read input  #read 함수로 input 변수에 입력
echo "your input is $input"

result=`expr $a + $b`
echo "a+b = $result"
result=`expr $a - $b`
echo "a-b = $result"
result=`expr $a \* $b`
echo "a*b = $result"
result=`expr $b / $a`
echo "b/a=$result"
