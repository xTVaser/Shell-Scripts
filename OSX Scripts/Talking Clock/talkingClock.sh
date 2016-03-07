#!/bin/bash
while true; do
	hours=$(date +%I)
	minutes=$(date +%M)
	seconds=$(date +%S)
	ampm=$(date +%p)
	
	finalSay="It is $hours:$minutes:$seconds $ampm"
	
	ceilingVoice=9
	indexVoice=$RANDOM
	let "indexVoice %= $ceilingVoice"
	echo $indexVoice

	ceilingPhrase=6
	indexPhrase=$RANDOM
	let "indexPhrase %= $ceilingPhrase"
	echo $indexPhrase
	
	ceilingNice=6
	indexNice=$RANDOM
	let "indexNice %= $ceilingNice"
	echo $indexNice

	niceVoices=("Good News" "Pipe Organ" "Cellos" "Ralph" "Zarvox" "Bruce")	

	voices=("Good News" "Albert" "Bahh" "Whisper" "Zarvox" "Cellos" "Trinoids" "Bells" "Bad News")
	
	phrases=("Why are you still in this room?" "I saw what you just did! STOP" "I'm watching you!" "It's quite late at night" "Sorry if I scared you" "Buy more Apple Products")	
	
	if [ "$ampm" = "AM" ] && [ $hours -lt 6 ] && [[ ( $minutes == 0 && $seconds == 00 ) || ( $minutes == 30 && $seconds == 00 ) ]]; then
		osascript -e 'set volume 7'
		say -v "${voices[indexVoice]}" "${phrases[indexPhrase]}"

	elif [[ ( $minutes == 00 && $seconds == 00 ) || ($minutes == 30 && $seconds == 00 ) ]]; then 
		
		osascript -e 'set volume 5'
		if [ "${niceVoices[indexNice]}" = "Good News" ]; then
			osascript -e 'set volume 2'
		fi
		say -v "${niceVoices[indexNice]}" $finalSay 
	fi
	
	echo $finalSay

	sleep 1
done

