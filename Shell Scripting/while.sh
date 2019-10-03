#!/bin/bash
function whil
{
contador=0
while [ $contador -lt 10 ]; do
	echo "El contador es $contador"
	let contador=contador+1
done
}
whil
