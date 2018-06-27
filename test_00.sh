#! /bin/bash
#function test
function string_test() {
	echo "string test 1111"
}
# function 은 생략가능
string_test2() {
	echo "string test 2222"
}

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

i=1
while [ $i -lt 4 ]
do
	echo $i
	i=$(($i+1))
done
string_test
string_test2
