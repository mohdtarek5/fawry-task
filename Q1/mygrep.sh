#command should be able to search for strings inside text file
#allow the use of commands like -v and -n and a combination of both
#handle errors when no string is given with a prompt message


#first variable = command
#second variable = string check
#third variable = filename

#if 3rd variable = null 
#set variable as 1st string
#2nd variable as filename
#else if 3 variables 1st is command 2nd is string 3rd filename
#else error handle

#check if starting with argument by checking for -
#verify -n, -v, -nv, -vn commands incase they are 3 arguments
#store commands in separate variable
#if less than 2 arguments, then exit
#if valid
#set line counter to 0
#loop through text
#match each word to variable
#if word matching make a new variable
#if matching store in new variable matchingWords
#if not matching put in variable invertedWords

#if there is time implement bonus task

invertWords=false
lineNumbers=false

if [[ "$1" =~ ^- ]]; then
    case "$1" in
    -n) lineNumbers=true ;;
    -v) invertWords=true ;;
    -nv | -vn)
        lineNumbers=true
        invertWords=true
        ;;
    *)
        echo "Invalid option: $1"
        exit 1
        ;;
    esac
fi

echo "Line numbers flag set to: $lineNumbers"
echo "Invert words flag set to: $invertWords"

if [[ "$invertWords" == true || "$lineNumbers" == true ]]; then
    flag="$1"
    wordToCheck="$2"
    fileName="$3"
    echo "flag: $flag"
    echo "matching word: $wordToCheck"
    echo "file name: $fileName"
    echo "At least one of the flags (invertWords or lineNumbers) is set to true."
else
    wordToCheck="$1"
    fileName="$2"
    echo "matching word: $wordToCheck"
    echo "file name: $fileName"
    echo "Neither invertWords nor lineNumbers is set to true."
fi

