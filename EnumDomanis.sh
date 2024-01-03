#!/bin/bash

baseDir = "/Bug_Bounty/scripts/recon"

if [[ -d "baseDir" ]]; then
    for dir in "$baseDir"/*/; do 
        if [[ -f "${dir}/roots.txt"]]; then
            programName = $(basename "$dir")
            echo "Printing domains for $programName"
            subfinder -dl "${dir}/roots.txt" -silent | anew "${dir}/alldomains.txt}" | notify -silent -bulk
        else
            programName = $(basename "$dir")
            echo "No root domain found for $programName!"
        fi
    done
else
    echo "Directory '$baseDir' does not exist"