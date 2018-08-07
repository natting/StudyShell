# 배열의 크기 지정없이 배열 변수로 선언
# 참고: 'declare -a' 명령으로 선언하지 않아도 배열 변수 사용 가능함
declare -a array

# 4개의 배열 값 지정
array=("hello" "test" "array" "world")

# 기존 배열에 1개의 배열 값 추가(순차적으로 입력할 필요 없음)
array[4]="variable"

# 기존 배열 전체에 1개의 배열 값을 추가하여 배열 저장(배열 복사 시 사용)
array=(${array[@]} "string")

# 위에서 지정한 배열 출력
echo "hello world 출력: ${array[0]} ${array[3]}"
echo "배열 전체 출력: ${array[@]}"
echo "배열 전체 개수 출력: ${#array[@]}"

# 배열갯수만큼 출력됨...왜??
printf "배열 출력: %s\n" ${array[@]}

# 배열 특정 요소만 지우기
unset array[4]
echo "배열 전체 출력: ${array[@]}"

# 배열 전체 지우기
unset array
echo "배열 전체 출력: ${array[@]}"

#================================================================================
# 지정된 범위 안에서 반복문 필요 시 좋음
for string in "hello" "world" "..."; do;
    echo ${string};
done

# 수행 조건이 true 일때 실행됨 (실행 횟수 지정이 필요하지 않은 반복문 필요 시 좋음)
count=0
while [ ${count} -le 5 ]; do
    echo ${count}
    count=$(( ${count}+1 ))
done

# 수행 조건이 false 일때 실행됨 (실행 횟수 지정이 필요하지 않은 반복문 필요 시 좋음)
count2=10
until [ ${count2} -le 5 ]; do
    echo ${count2}
    count2=$(( ${count2}-1 ))
done

#======================================================
# if else
string1="hello"
string2="world"
if [ ${string1} == ${string2} ]; then
    # 실행 문장이 없으면 오류 발생함
    # 아래 echo 문장을 주석처리하면 확인 가능함
    echo "hello world"
elif [ ${string1} == ${string3} ]; then
    echo "hello world 2"
else
    echo "hello world 3"
fi

# AND
if [ ${string1} == ${string2} ] && [ ${string3} == ${string4} ]
	echo "not possible"
# OR
if [ ${string1} == ${string2} ] || [ ${string3} == ${string4} ]
	echo "not possible"
# 다중 조건
if [[ ${string1} == ${string2} || ${string3} == ${string4} ]] && [ ${string5} == ${string6} ]
	echo "not possible"

#=======================================================
# case문 테스트를 위한 반복문 : ;;로 종료
for string in "HELLO" "WORLD" "hello" "world" "s" "start" "end" "etc"; do
    # case문 시작
    case ${string} in
        hello|HELLO)
            echo "${string}: hello 일때"
            ;;
        wo*)
            echo "${string}: wo로 시작하는 단어 일때"
            ;;
        s|start)
            echo "${string}: s 혹은 start 일때"
            ;;
        e|end)
            echo "${string}: s 혹은 start 일때"
            ;;
        *)
            echo "${string}: 기타"
            ;;
    esac
    # //case문 끝
done
#for test END
#=========================================================================
