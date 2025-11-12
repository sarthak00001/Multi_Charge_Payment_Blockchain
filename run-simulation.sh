# if [ $# -lt 2 ]
# then
#     echo "usage: $0 <seed> <output-directory>"
#     exit
# fi

# GSL_RNG_SEED=$1  ./cloth $2

# python batch-means.py $2


##### CHANGED AFTER ERROR IN ACCESSING THE FOLDER AND THERE IS A ERROR IN C FILE WHERE ITS NOT ABLE TO FIND THE PATH AND BECAUSE ITS NOT ADDING HASH HENE NOT GOING TO THE RIGHT PATH

#!/bin/bash

if [ $# -lt 2 ]
then
    echo "usage: $0 <seed> <output-directory>"
    exit
fi

# Add trailing slash if missing
output_dir="${2%/}/"

echo "GSL_RNG_SEED=$1"
GSL_RNG_SEED=$1 ./cloth "$output_dir"

echo "COMPUTE SIMULATION OUTPUT STATS"
python3 batch-means.py "$output_dir"
