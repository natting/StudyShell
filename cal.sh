#!/bin/bash
# 나현섭 225999

var=0
leapYear=0
is_LeapYear() {
    echo $1
    var=$1
    if [ 'expr var % 4' -eq 0 ]
    then
        if [ 'expr $1 % 400' -eq 0 ]
        then
            leapYear=1
        elif  [ '' ]
        then
            leapYear=0
        fi
    else
        leapYear=0
    fi
}

echo "# 윤년 계산기 #"
echo "---------------"
echo "1. 윤년 확인"
echo "2. 달력 출력"
echo "3. 종료"
echo "--------------"
read -p "입력: "
case $REPLY in
    1) menu=1
        ;;
    2) menu=2
        ;;
    3) menu=3
        ;;
    *) menu=0
        echo "잘못입력하셨습니다. 아무키나 누르세요"
esac

# 윤년 체크
if [ $menu -eq 1 ]
then
    printf "연도(1~9999)을 입력하세요:"
    read years
    if (( ($years > 9999) || ($years < 1) ))
    then
        echo "잘못 입력하셨습니다. 아무키나 누르세요..."
    fi

    aYear=$(($years % 4))
    bYear=$(($years % 100))
    cYear=$(($years % 400))
    if [ $aYear -eq 0 ]
    then
        if [ $cYear -eq 0 ]
        then
            leapYear=1
        elif [ $bYear -eq 0 ]
        then
            leapYear=0
        else
            leapYear=1
        fi
    else
        leapYear=0
    fi

    if [ $leapYear -eq 1 ]
    then
        echo "윤년입니다."
    else
        echo "윤년이 아닙니다."
    fi
fi

#달력출력
if [ $menu -eq 2 ]
then
    read -p "연도(1~9999)와 월 입력하세요. 예) 2016 2: "
    # 2016 2 를 년과 월로 나누기
    year=${REPLY:0:4}
    if (( ${#REPLY} == 6 ));then
        mon=${REPLY:5:6}
    elif (( ${#REPLY} == 7 ));then
        mon=${REPLY:5:7}
    else
        echo "sth wrong"
        # do sth go to exit
    fi
    if (( ($year > 9999) || ($year < 1) || ($mon > 12) || ($mon < 1) ))
    then
        echo "잘못입력하셨습니다. 아무키나 누르세요..."
    fi
    printf "year = %d, mon = %d \n" $year $mon

    # 윤년 체크 : ToDo - make function
    aYear=$(( $year % 4 ))
    bYear=$(( $year % 100 ))
    cYear=$(( $year % 400 ))
    if [ $aYear -eq 0 ]
    then
        if [ $cYear -eq 0 ]
        then
            leapYear=1
        elif [ $bYear -eq 0 ]
        then
            leapYear=0
        else
            leapYear=1
        fi
    else
        leapYear=0
    fi
    printf "윤년=%d \n" $leapYear
    # ToDo : END

    # 입력된 year 일수 계산 (1년 1월 1일은 월요일)
    # 입력된 월의 시작 위치 찾아라
    # 윤년 유무와 days 로 endday 찾아라
    printf " Su Mo Tu We Th Fr Sa \n"
fi

#종료
if [ $menu -eq 3 ]
then
    echo "종료"
    exit
fi

