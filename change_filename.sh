#!/bin/bash
exec 3<007en
exec 4<007cn
no=1
while read f1 <&3 && read f2 <&4
do
    #echo $f1\($f2\)
    tmpname=${f1}"("${f2}")"
    #echo $tmpname
   allnames[$no]=$tmpname
   let "no+=1"
done
#let "count=no-1"
no=1
for i in *
do
  if ! [ -d $i ]
  then
      continue
  fi
  pref=${i:0:4}
  tmpname=${allnames[$no]}
  newname=$pref$tmpname
  #echo $newname
  if ! [ $i = $newname ];then
     mv -v $i $newname
  fi
  let "no+=1"
done


  

