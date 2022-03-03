#! /bin/sed -nf
#Name-Bishop Bhaumik Roll-1928024
 ##############################################################################################
#it is a sed script to remove the comments of the c file  here we are using several sed flag and making
#regex the sed file is checking charecters in the c file where it is getting single line comment i.e (//)
#and multiline comments i.e.(/* for starting and ending at */) in this case this sed script has loop 
#so first it will take the filename.c and give it's output as then again taking input of updated filename.case
#Now for * it is again running sed script and taking we are again running the loop of internediate loop.
#first special character (/, ", ').  The original version went exactly a character at a time, hence the 
#greater speed of this one. We have to build the line in hold space are entirely.
 ################################################################################################

 
:loop
 

/^\/\// s,.*,,          #checking for / or /*
 
/^$/{
  x      #Exchange the content between patten space mentioned above and hold space.
  p      #Print the first embedded line or all content in the pattern space.
  n       #appending to then nextline
  b loop     #Branch label, it label is omitted it moves to end of the script in loop
}        
/^"/{
  :double    #checking for  the single comments        
  /^$/{
    x
    p
    n
    /^"/b break      #if single comment is found
    b double
  }
 
  H                    #copy the data from pattern space to hold space
  x
  s,\n\(.[^\"]*\).*,\1,
  x
  s,.[^\"]*,,
 
  /^"/b break          #breaking the cycle
  /^\\/{
    H
    x
    s,\n\(.\).*,\1,
    x
    s/.//            #replacing with space
  }
  b double
}
 
/^'/{
  :single
  /^$/{
    x
    p
    n
    /^'/b break
    b single
  }
  H
  x
  s,\n\(.[^\']*\).*,\1,
  x
  s,.[^\']*,,
 
  /^'/b break
  /^\\/{
    H
    x
    s,\n\(.\).*,\1,
    x
    s/.//
  }
  b single
}
 
/^\/\*/{
  s/.//
  :ccom
  s,^.[^*]*,,
  /^$/ n
  /^\*\//{
    s/..//
    b loop
  }
  b ccom
}
 
:break
H
x
s,\n\(.[^"'/]*\).*,\1,
x
s/.[^"'/]*//
b loop           #again leveling and closing the loop