#!/bin/bash

for NUM_THREADS in 32 64
do
    CONFIG="mg_B_t"$NUM_THREADS
    FILENAME=$CONFIG".aspen"

    #for MACHINE in V_HBM128_DDR8 V_HBM256_DDR8 V_HBM512_DDR8 V_HBM1024_DDR8 V_HBM2048_DDR8 V_HBM4096_DDR8
    #for MACHINE in V_HMC1024_DDR8 V_HMC128_DDR8 V_HMC2048_DDR8 V_HMC256_DDR8 V_HMC4096_DDR8 V_HMC512_DDR8 
    for MACHINE in V_HBM1024_PCM8 V_HBM128_PCM8 V_HBM2048_PCM8 V_HBM256_PCM8 V_HBM4096_PCM8 V_HBM512_PCM8
    do
	echo "./main_release "$FILENAME"  ../machinemodels/"$MACHINE"/hms.aspen > out_"$CONFIG"_"$MACHINE" 2>&1 & " >> sweepjob.sh
    done
done

exit 0