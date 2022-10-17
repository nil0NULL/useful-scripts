#!/usr/bin/bash

dirs=("$@")
for dir in "${dirs[@]}" ; do 
    echo "$dir"
    title=$(sed -e 's/.*\"title\":\"\([^"]*\)\".*/\1/' $dir/entry.json)
    echo $title
    title=${title//\\/_}
    title=${title//\//_}
    #echo $title
    for sub_dir in $dir/*/ ; do 
	pushd "$sub_dir"
	ffmpeg -i audio.m4s -i video.m4s -vcodec copy -acodec copy -y -strict experimental "$title.mp4"
	popd
    done
done
