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

invertwords=false
displayline=false

if [[ "$1" =~ ^- ]]; then
    case "$1" in
    -n) displayline=true ;;
    -v) invertwords=true ;;
    -nv | -vn)
        displayline=true
        invertwords=true
        ;;
    *)
        echo "Invalid option: $1"
        exit 1
        ;;
    esac
fi

echo "Line numbers flag set to: $displayline"
echo "Invert words flag set to: $invertwords"

if [[ "$invertwords" == true || "$displayline" == true ]]; then
    flag="$1"
    wordtocheck="$2"
    filename="$3"
    echo "flag: $flag"
    echo "matching word: $wordtocheck"
    echo "file name: $filename"
    echo "At least one of the flags (invertwords or displayline) is set to true."
else
    flag="none"
    wordtocheck="$1"
    filename="$2"
    echo "flag: $flag"
    echo "matching word: $wordtocheck"
    echo "file name: $filename"
    echo "Neither invertwords nor displayline is set to true."
fi

linenumber=0

while IFS= read -r line; do
    ((linenumber++))
    if [[ "${line,,}" == *"${wordtocheck,,}"* ]]; then
        if [ "$displayline" = true ]; then
            echo "Found '$wordtocheck' in line $linenumber; $line "
        else
            echo "Found '$wordtocheck' in line $line "
        fi

    fi
done <"$filename"
