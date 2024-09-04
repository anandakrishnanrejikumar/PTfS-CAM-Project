#!/bin/bash -l
#SBATCH --job-name=run_perf        
#SBATCH --nodes=1 --time=01:00:00  
#SBATCH --mail-type=ALL            
#SBATCH --mail-user=ananda.rejikumar@fau.de
echo "email notification"
# Load any necessary modules (if needed)
# module load intel

# Set OpenMP environment variables
export OMP_NUM_THREADS=72
export OMP_PROC_BIND=close
export OMP_PLACES=core


# Loop to run the command 10 times
for i in {1..20}
do
   echo "Run #$i"
   srun -qopenmp --cpu-freq=2000000-2000000:performance ./perf 2000 20000
done
echo "email notification"