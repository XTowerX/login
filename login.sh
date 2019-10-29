#!/bin/bash

#overskriver den gamle fil med en tom line PGA >

printf "\n" > $home/SomeFile

#udskriver system info og tilføjer tekst til filen PGA >>

lsb_release -a >> $home/SomeFile

printf "\n" >> $home/SomeFile

# udskriver ram status

free -m >> $home/SomeFile

printf "\n">> $home/SomeFile

#udskriver CPU status

inxi -C >> $home/SomeFile

printf "\n">> $home/SomeFile

#udskriver nuværende system IP

ip -o -4  address show  | awk ' NR==2 { gsub(/\/.*/, "", $4); print "System IP="$4 } ' >> $home/SomeFile

printf "\n">> $home/SomeFile

#udskriver nuværende dato

date >> $home/SomeFile

printf "\n">> $home/SomeFile

#udskriver harddisk status

df --block-size=G >> $home/SomeFile

printf "\n">> $home/SomeFile

#alle disse udskrifter bliver lagt i SomeFile, som kopieres til MOTD

sudo cp $home/SomeFile /etc/motd
