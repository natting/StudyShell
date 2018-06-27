#! /bin/bash
#function test
function string_test() {
	echo "string test 1111"
}
# function 은 생략가능
string_test2() {
	echo "string test 2222"
}
# 변수는 ${xxx} 로 하는게 맘편함.
# @ 는 argument
string_test3() {
	echo "string test 3333"
	echo "argument : ${@}"
}

a=5
b=10
c="natting test"

echo a=$a
echo b=$b
echo c=$c

# read test : 걍 read 변수하면 됨.
echo -n "input sth:"    #-n = 개행
read input  #read 함수로 input 변수에 입력
echo "your input is $input"

# expr test : 연산문을 위해서..
# *는 다른데서 사용되므로 back slash 있어야함
result=`expr $a + $b`
echo "a+b = $result"
result=`expr $a - $b`
echo "a-b = $result"
result=`expr $a \* $b`
echo "a*b = $result"
result=`expr $b / $a`
echo "b/a=$result"

# while문 test : -lt, -gt, -ge, -le
i=1
while [ $i -lt 4 ]
do
	echo $i
	i=$(($i+1))
done

# function test
string_test
string_test2
# 변수로 입력 가능==> $@
string_test3 "natting" "test" "1234" "789456123"
