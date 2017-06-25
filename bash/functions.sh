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
