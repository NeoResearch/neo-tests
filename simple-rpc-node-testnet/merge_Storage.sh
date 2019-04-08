#!/bin/bash
cd Storage
BLOCK_CACHE=1000

for d in */ ; do # --------- Loop into directories ---------
    echo "$d"

	blockHeightToSkip=-1
	for filename in $d*; do # --------- Loop into files ---------
	    echo "checking filename $filename"
	    blockHeightInit=${filename%.json*}
	    blockHeightInit=${blockHeightInit##*block-}
	    if [ "$blockHeightInit" -le "$blockHeightToSkip" ]; then # --------- Files needs to be merged ---------
		continue
	    fi	
            echo ""
	    echo "new filename $filename"

	    #echo "block height is $blockHeightInit"
	    rest=$((blockHeightInit % BLOCK_CACHE))
	    echo "rest is $rest"
	    if [ "$rest" -ne "0" ]; then # --------- Files needs to be merged ---------
			FILE_ARRAY=()
			TRUNC_ARRAY=()
			FILE_ARRAY+=($filename)
			TRUNC_ARRAY+=("truncate -s-2 $filename")
			blockHeight=$blockHeightInit
			for filenameToMerge in $d*; do # --------- Loop into files to merge with ---------
				blockHeightToMerge=${filenameToMerge%.json*}
	    			blockHeightToMerge=${blockHeightToMerge##*block-}
				echo "blockHeightToMerge is $blockHeightToMerge"
				if [ "$((blockHeight + 1))" -eq "$blockHeightToMerge" ]; then
					if [ "$blockHeightToMerge" -le "$((blockHeightInit + BLOCK_CACHE - 1))" ]; then
						echo "Adding friends to File_ARRAY... $blockHeightToMerge"						
						FILE_ARRAY+=($filenameToMerge)
						TRUNC_ARRAY+=("; truncate -s-2 $filenameToMerge")
						TRUNC_ARRAY+=("; tail -c +2 $filenameToMerge > temp ; mv temp $filenameToMerge")
						blockHeight=$blockHeightToMerge
						blockHeightToSkip=$blockHeight 
					else
						echo "Exiting For loop at $blockHeightToSkip"
						break
					fi
				fi				
				#create a loop to break
			done # --------- Loop into files to merge with ---------

			if [ "$((blockHeight))" -eq "$((blockHeightInit + BLOCK_CACHE - 1))" ]; then # --------- Files reached the top ---------
				echo "We did it"
				echo "Serialized TRUNC_ARRAY is ${TRUNC_ARRAY[*]} "
				eval ${TRUNC_ARRAY[*]}

				echo "Serialized array is cat ${FILE_ARRAY[*]} > $dtemp_$blockHeight.json"
				cat ${FILE_ARRAY[*]} > $d"dtemp_$blockHeight.json"
				echo ']' >> $d"dtemp_$blockHeight.json"
				rm ${FILE_ARRAY[*]}
				mv $d"dtemp_$blockHeight.json" $d"dump-block-$blockHeight.json"
				

				


				#mv temp.json dump-block-$((blockHeightInit + BLOCK_CACHE - 1)).json
			fi # --------- Files reached the top ---------
            fi # --------- Files needs to be merged ---------
	done # --------- Loop into files ---------
done # --------- Loop into directories ---------

