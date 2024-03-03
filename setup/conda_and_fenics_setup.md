# install anaconda using terminal

- instructions in the [website](https://www.digitalocean.com/community/tutorials/how-to-install-anaconda-on-ubuntu-18-04-quickstart).

- find the conda script after installation. In my case it is at `$HOME/anaconda3/etc/profile.d/conda.sh`

Installation steps following [website](https://www.digitalocean.com/community/tutorials/how-to-install-anaconda-on-ubuntu-18-04-quickstart)

```sh
# 1. Get the name of the latest distribution from https://repo.anaconda.com/archive/

# 2. Download 
cd /tmp
wget https://repo.anaconda.com/archive/Anaconda3-2024.02-1-Linux-x86_64.sh

# run anaconda script and follow instruction (at the end it shows the path where conda is installed, usually it will be ${HOME}/anaconda3)
bash Anaconda3-2024.02-1-Linux-x86_64.sh

# enable conda in shell
echo $SHELL
eval "$($HOME/anaconda3/bin/conda shell.bash hook)"

# check if base activates
conda activate base

# deactivate conda environment
conda deactivate base

# deactivate automatic activation of base when you open a terminal
conda config --set auto_activate_base false

# find directory that has conda script and activate conda and see if source works
source $HOME/anaconda3/etc/profile.d/conda.sh
```

# create fenics environment

- take a look at fenics environment file where we have all the basic packages (you can add more to the list depending on the needs)
```yml
name: confen
channels:
  - conda
  - conda-forge
dependencies:
  - python=3.8
  - pip
  - matplotlib
  - jupyter
  - jupyterlab
  - scipy
  - psutil
  - fenics
  - pip:
    - h5py
    - seaborn
    - hippylib
    - meshio
    - pyvista
    - pygmsh
```

- create a conda environment using the environment file `fenics-conda-env.yml`
```sh
conda env create -f fenics-conda-env.yml 
```
above will create a environment `confen` (name of environment is specified in the environment file `fenics-conda-env.yml`).

- test if new environment activates
```sh
# activate env
conda activate confen

# deactivate
conda deactivate
```

- test fenics code
```sh
# go to directory where fenics test code is
cd ../poisson_test

# exectute runFenics.sh script or follow the instructions here

# source conda script
source $HOME/anaconda3/etc/profile.d/conda.sh

# activate conda enviroment
conda activate confen

# run fenics example python script
python ft01_poisson.py
```

- visualize `.pvd` or `.vtu` file in paraview
