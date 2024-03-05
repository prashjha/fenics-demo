#!/bin/bash

# source conda script
source $HOME/anaconda3/etc/profile.d/conda.sh

# activate conda enviroment
conda activate confen

# run fenics example python script
python ft01_poisson.py
