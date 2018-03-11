###Script que muestra los directoros de PATH
path=$PATH
while [ $path ]; do
	echo ${path%%:*}
	if [ ${path#*:} = $path ]; then
		path=
	else
		path=${path#*:}
	fi
done
