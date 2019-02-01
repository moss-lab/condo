#!/bin/bash -l
#SBATCH --partition=long_1node          #Partition to submit to
#SBATCH --time=14-00:00:00             #Time limit for this job
#SBATCH --nodes=1                   #Nodes to be used for this job during runtime
#SBATCH --ntasks-per-node=12      #Number of tasks to fire
#SBATCH --job-name=change   #Name of this job in work queue
#SBATCH --mail-user=randrews@iastate.edu  #Email to send notifications to
#SBATCH --mail-type=ALL             #Email notification type (BEGIN, END, FAIL, ALL)

module load python
module load viennarna
module load py-biopython
module load py-numpy/1.14.2-py3-zugitkk
module load python

#ScanFold-Scan_SLURM usage: python ScanFold-Scan_SLURM.py fasta.file step window random temp type

python /work/LAS/wmoss-lab/randrews/scripts/ScanFold/ScanFold-Scan_SLURM.py RSV.fa 1 100 100 37 mono &
python /work/LAS/wmoss-lab/randrews/scripts/ScanFold/ScanFold-Scan_SLURM.py RSV.fa 1 140 100 37 mono &
python /work/LAS/wmoss-lab/randrews/scripts/ScanFold/ScanFold-Scan_SLURM.py RSV.fa 1 160 100 37 mono &
python /work/LAS/wmoss-lab/randrews/scripts/ScanFold/ScanFold-Scan_SLURM.py RSV.fa 1 160 100 37 mono &
python /work/LAS/wmoss-lab/randrews/scripts/ScanFold/ScanFold-Scan_SLURM.py RSV.fa 1 200 100 37 mono &
python /work/LAS/wmoss-lab/randrews/scripts/ScanFold/ScanFold-Scan_SLURM.py RSV.fa 1 500 100 37 mono &
wait;

python /work/LAS/wmoss-lab/randrews/scripts/ScanFold/ScanFold-Fold_SLURM.py -i RSV.fa.step_win_rand.1_100_100.txt &
python /work/LAS/wmoss-lab/randrews/scripts/ScanFold/ScanFold-Fold_SLURM.py -i RSV.fa.step_win_rand.1_140_100.txt &
python /work/LAS/wmoss-lab/randrews/scripts/ScanFold/ScanFold-Fold_SLURM.py -i RSV.fa.step_win_rand.1_160_100.txt &
python /work/LAS/wmoss-lab/randrews/scripts/ScanFold/ScanFold-Fold_SLURM.py -i RSV.fa.step_win_rand.1_180_100.txt &
python /work/LAS/wmoss-lab/randrews/scripts/ScanFold/ScanFold-Fold_SLURM.py -i RSV.fa.step_win_rand.1_200_100.txt &
python /work/LAS/wmoss-lab/randrews/scripts/ScanFold/ScanFold-Fold_SLURM.py -i RSV.fa.step_win_rand.1_500_100.txt &
wait;

