#!/bin/bash

url=$1
if [[ ! -d "$url/recon/" ]];then
    mkdir -p $url/recon
fi

assetfinder $url | grep "$url" | httprobe | sort -u | tee -a subs_alive.txt
cat subs_alive.txt | rev | cut -d "/" -f 1 | rev | sort -u | tee -a refined_live_subs.txt
python3 EyeWitness/EyeWitness.py --web -f $url/recon/alive.txt -d $url/recon/eyewitness --resolve
