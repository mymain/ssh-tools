#!/bin/bash

#passwd -S -a
passwd -S -a | awk -v user=$USER '{ if ( $1 == user ) { printf  "%s\n",  $3; } }'

#TBC passw change policy 

#view:
#chage -l username

#set:
#chage username