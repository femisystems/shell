#!/bin/sh
echo "************************************************************************************"
echo "*   Welcome to this minimal shell program                                          *"
echo "*   In the next few minutes, we will be asking you basic information about you!    *"
echo "************************************************************************************"
echo "\nDo you want to continue? Enter y(yes) or n(no)"

read OPT

if [[ "$OPT" == "y" || "$OPT" == "yes"  ]]; then
  continue
else
  echo "Bye bye!"; exit 0
fi

echo "Good! Let's get started\n"
echo "What is your name?"; read NAME
echo "What's your gender? (m or f)"; read GENDER
echo "What are your interests?"; read INTERESTS
echo "Would you like your information written in a file?"; read OPT

DIR_NAME="myinfo"

# just in case we don't have a docs directory, create one!
createDir () {
  if [[ -d $DIR_NAME ]]; then
    return
  else
    mkdir $DIR_NAME
  fi

  return
}

# instead of writing responses to console, just write them in a file
writeout () {
  touch $DIR_NAME/${NAME}-info.txt

  echo "Name: $NAME" >> $DIR_NAME/${NAME}-info.txt
  echo "Gender: $GENDER" >> $DIR_NAME/${NAME}-info.txt
  echo "My Interests:\n$INTERESTS" >> $DIR_NAME/${NAME}-info.txt

  return 1
}

# print out the user's information
printout () {
  echo "Name - $NAME"
  echo "Gender - $GENDER"
  echo "Interests - $INTERESTS"

  return
}

# gather user's responses and output them based on choice
compile () {
  # so this function uses a parameter that will be supplied by the user
  # check the first parameter $1 to know if it's yes or no
  if [[ $1 == 'y' || $1 == 'yes' ]]; then
    echo "\nWriting to file..."

    # now create the directory if need be
    createDir

    # call the write function we earlier created.
    # trust me, you don't need to call it like a js function 😁
    writeout

    # we need the return value $? from the same function
    # don't freak out, it's the way bash rolls
    ret=$?

    # we ensure that the file is actually written before we move on
    if [[ $ret == 1 ]]; then
      echo "Done!"

      # now we move the written file to docs directory! Nothing fancy
      # mv ${NAME}-info.txt docs/${NAME}-info.txt
      echo "\nYour file is ready in $DIR_NAME"

      # okay, this guy is actually optional.
      # we just pop it open in a text editor. Shikena!!!
      open -e $DIR_NAME/${NAME}-info.txt
    else
      echo "\nUnable to write file"
      return
    fi
  else
    # if the user chooses not to have a written file, we just
    # spill it out in the terminal
    printout
  fi
}

# so, we call the compile function with a single param $OPT
compile $OPT
