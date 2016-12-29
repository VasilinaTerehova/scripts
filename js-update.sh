export dir=/c/Pentaho7.0
array=($(find $dir -name "jersey*.jar" | sort -n))
version=1.19.1
for i in ${array[@]}
do 
	#echo $i
	filename=$(basename "$i" .jar)
  path=$(dirname "$i")
  echo $path
	echo $filename
	if [[ $filename =~ .*$version$ ]]; then
		echo "file 1.19.1 already version"
	else
		#echo "old version"
		patternPart=${filename%%[0-9.]*}
		fullNewName=$(ls lib/|grep $patternPart)
		echo $fullNewName
		if [ -z $fullNewName ];
		then 
			echo "no found for $filename"
		fi
		if [ -f $path/$fullNewName ];
		then
			echo "already copied"
		else
			rm $i
			echo "copy here"
			cp lib/$fullNewName $path/$fullNewName
		fi
	fi
done
