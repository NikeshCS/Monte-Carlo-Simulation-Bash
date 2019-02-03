#!/bin/bash

#numOfPoints
numOfPoints=10

#Variables
inside=0
outside=0
actualValue=3.141592
estimatedValue=0
deviation=0
percentError=0
finalPercentError=0
distance=1
sqrtdist=0
x=1
y=1

  #Loop
  for ((i = 0; i<numOfPoints; i++)); do
      x=$(awk -v seed=$RANDOM 'BEGIN{srand(seed);print rand()}')
      y=$(awk -v seed=$RANDOM 'BEGIN{srand(seed);print rand()}')
      distance=$(echo $x*$x + $y*$y | bc)
      sqrtdist=$(echo "scale=2; sqrt($distance)" | bc)
      if (($(echo "$sqrtdist <= 1" | bc)));
      then
        inside=$((inside+1))
      else
        outside=$((outside+1))
fi

done


#Calculate Variables
estimatedValue=$(echo "scale=2; 4*($inside/$numOfPoints)" | bc -l)
deviation=$(echo "scale=2; $actualValue - $estimatedValue" | bc -l)
percentError=$(echo "scale=2; $deviation/$actualValue" | bc -l)
finalPercentError=$(echo "scale=2; $percentError * 100" | bc -l)

#Display Information
echo "Estimated value of PI: $estimatedValue"
echo "Deviation: $deviation"
echo "Percent Error: $finalPercentError"
exit 0