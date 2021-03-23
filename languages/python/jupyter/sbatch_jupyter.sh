#!/bin/bash  --login

#SBATCH --time=01:00:00
#SBATCH --nodes=1
#SBATCH --partition=short
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=36
#SBATCH --account=<account-handle>

module purge
module load conda
source activate /home/$USER/.conda/envs/jupyterenv

port=7878

echo "run the following command on your machine"
echo ""
echo "ssh -L $port:$HOSTNAME:$port $SLURM_SUBMIT_HOST.hpc.nrel.gov"

jupyter lab --no-browser --ip=0.0.0.0 --port=$port