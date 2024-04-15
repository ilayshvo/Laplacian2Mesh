#!/bin/bash

#SBATCH -o /home/users/i/ilay1302/Laplacian2Mesh/slurm_logs/myjob.%j.%N.out   # Output-File
#SBATCH -D /home/users/i/ilay1302/Laplacian2Mesh/                  # Working Directory
#SBATCH -J Hello-Prepare 		# Job Name
#SBATCH --ntasks=16 		# Anzahl Prozesse P (CPU-Cores) 
#SBATCH --cpus-per-task=16	# Anzahl CPU-Cores pro Prozess P
#SBATCH --gres=gpu:tesla:2	# 2 GPUs anfordern
#SBATCH --mem=16G              # 5GiB resident memory pro node

#Max Walltime vorgeben:
#SBATCH --time=03:00:00 # Erwartete Laufzeit

#Auf GPU-Knoten rechnen:
#SBATCH --partition=gpu

#Job-Status per Mail:
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shvo@campus.tu-berlin.de

# benötigte SW / Bibliotheken laden (CUDA, etc.)
#module load nvidia/cuda/12.2 python/3.9.13-gpu

# Make python print directly after each print
export PYTHONUNBUFFERED=10
source venv2/bin/activate
#pip install -r requirements.txt
echo "Starting prepare script"
#sh ./scripts/coseg_aliens/prepare_data.sh
python3 ./prepare/pre_seg_dataset.py \
--data_path data/coseg_aliens \
--device cuda \

