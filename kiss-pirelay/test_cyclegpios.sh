#!/bin/bash

for j in {1..10}; do
  echo -n Run_$j:
   time {
    for i in {1..8}; do value=on port=$i ./gpio.sh; done
    for i in {8..1}; do value=off port=$i ./gpio.sh; done
  }
done

# sampledata
################
# Run_1:
# real	0m0.274s
# user	0m0.110s
# sys	0m0.080s
# Run_2:
# real	0m0.278s
# user	0m0.080s
# sys	0m0.100s
