#!/bin/bash

states=('arizona' 'colorado' 'georgia' 'florida' 'hawaii')

for state in ${states[@]}; do
 if [ $state == 'hawaii' ]; then
      echo "hawaii is the best!"
  else
     echo "Im not fond of hawaii"
  fi
done
