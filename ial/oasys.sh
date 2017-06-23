source ./home/ubuntu/ial/

ORDERPATH="/home/ubuntu/order"
ANSWERPATH="/home/ubuntu/answer"

helloworldtest () {

}

makeanswer () {


}


order () {
    if [ $1='Test Hello']; then

        echo 'helloworldtest' > /home/ubuntu/answer/hellotest.txt
    fi

    echo $($1) > /home/ubuntu/answer/answer.txt
}
