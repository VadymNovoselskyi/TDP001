if !([[ $1 =~ ^[0-9]+$ ]] && [[ $2 =~ ^[0-9]+$ ]]); then
    echo "args must be positive ints"
    exit
fi

if [ $1 -gt $2 ]; then
    echo "The first arg should be smaller that the second one"
    exit
fi

function isPrime {
    n=$1
    if [ "$n" -lt 2 ]; then
        echo "false"
        return
    fi
    if [ $(($n % 2)) -eq 0 ]; then
        echo "false"
        return
    fi
    if [ "$n" -eq 2 ]; then
        echo "true"
        return
    fi

    local upperLimit=$(echo "scale=0; sqrt($n)" | bc -l)
    local COUNTER=3

    while [[ $COUNTER -le $upperLimit ]]; do
        if [ $(($n % $COUNTER)) -eq 0 ]; then
            echo "false"
            return
        fi
        let COUNTER=$(($COUNTER+2))
    done
    echo "true"
}

COUNTER=$1
shouldPrint=true
while [ $COUNTER -lt $(($2 + 1)) ]; do
    isPrimeNum=$(isPrime $COUNTER)

    if [ "$isPrimeNum" = true ]; then
        if [ "$shouldPrint" = true ]; then
            shouldPrint=false
            echo "$COUNTER"
        else
            shouldPrint=true
        fi
    fi

    let COUNTER=$(($COUNTER+1))
done