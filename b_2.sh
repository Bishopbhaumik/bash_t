echo "enter file path:"
read PATH_TO_SOMEWHERE
for file in "$PATH_TO_SOMEWHERE"; do
      if [ -d $file ]
      then
              # do something directory-ish
      else
              if [ ["$file" == "*.txt" ] ]      #  this is the snag
              then
                     # do something txt-ish
              fi
      fi
done;