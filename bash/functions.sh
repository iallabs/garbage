# function command line options integration

optionsexample () {
    newfile=""
    path=""
    fil=""
    ext=""
    readd=""
    option=""
    while [[ $# -gt 1 ]]; do
        key="$1"
        case $key in
            -n | --new )
            newfile=$2
            shift
            ;;
            -p | --path )
            path=$2
            shift
            ;;
            -f | --file )
            fil=$2
            shift
            ;;
            -x | --ext )
            ext=$2
            shift
            ;;
            -r | --read )
            readd="True"
            ;;
            -o | --option )
            option=$2
            shift
            ;;
        esac
        shift
    done
    if [ $readd ]; then
        pretty_json "$path/$file"
    fi
}

# ask yes no example

mkinstances () {
    source json_utils.sh
    f=find / -name instances.json
    if [ -z $f ]; then
        while true; do
            read -p "Do you wish to create instances.json file ?" yn
            case $yn in
                [Yy]* ) json -n instances -p $default -t list; break;;
                [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
    esac
done
    fi
    echo "instances.json exit at $f"
}

