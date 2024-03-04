# install anaconda using terminal

- instructions in the [website](https://www.digitalocean.com/community/tutorials/how-to-install-anaconda-on-ubuntu-18-04-quickstart).

- find the conda script `conda.sh` after the installation. In my case it is at `$HOME/anaconda3/etc/profile.d/conda.sh`

## Installation steps following [link](https://www.digitalocean.com/community/tutorials/how-to-install-anaconda-on-ubuntu-18-04-quickstart)

```sh
# 1. Get the name of the latest distribution from https://repo.anaconda.com/archive/

# 2. Download 
cd /tmp
# at the moment `Anaconda3-2024.02-1-Linux-x86_64` is latest
wget https://repo.anaconda.com/archive/Anaconda3-2024.02-1-Linux-x86_64.sh

# run anaconda script and follow prompts (once script has finished running, at the end it will show the path where conda is installed; usually it is at ${HOME}/anaconda3)
bash Anaconda3-2024.02-1-Linux-x86_64.sh

# enable conda in shell (you can then run command `conda` in terminal)
echo $SHELL
eval "$($HOME/anaconda3/bin/conda shell.bash hook)"

# check if `base` environment activates
conda activate base

# deactivate conda environment
conda deactivate

# deactivate automatic activation of base when you open a terminal
conda config --set auto_activate_base false

# find directory that has conda script and activate conda and see if source works
source $HOME/anaconda3/etc/profile.d/conda.sh
```

# create fenics environment

- take a look at fenics environment file [fenics-conda-env.yml](fenics-conda-env.yml) where we have all the basic packages (you can add more to the list depending on the needs). The contents of the files are also shown below:
```yml
name: confen # name of the environment
channels:
  - conda
  - conda-forge
dependencies:
  - python=3.8
  - pip             # to install pip packages
  - matplotlib      # for plotting
  - jupyter         # juyter notebook
  - jupyterlab      # jupyter lab (if you prefer jupyter lab)
  - scipy
  - psutil
  - fenics          # fenics package
  - pip:
    - h5py
    - seaborn       # for plotting
    - hippylib      # for Bayesian inference (not needed)
    - meshio        # for converting meshes
    - pyvista       # for plotting and converting meshes
    - pygmsh        # gives python front-end to gmsh meshing library
```

- create a conda environment using the environment file [fenics-conda-env.yml](fenics-conda-env.yml)
```sh
# below will create an environment named `confen` (name is specified in the environment file `fenics-conda-env.yml`)
conda env create -f fenics-conda-env.yml 
```

- test if new environment activates
```sh
# activate env
conda activate confen

# deactivate
conda deactivate
```


- ***Alternative way:** If there is an issue creating environment with all the packages in [fenics-conda-env.yml](fenics-conda-env.yml) file, consider another environment file [fenics-conda-lean-env.yml](fenics-conda-lean-env.yml) that has smaller number of packages. 
  - Create environment using this new file if there was an issue using `fenics-conda-env.yml` file as follows:
  ```sh
  conda env create -f fenics-conda-lean-env.yml 
  ```
  - Next, install the two other key libraries from command line as follows:
  ```sh
  # activate env
  conda activate confen
  # install pip packages
  pip install pygmsh meshio
  # if there was a conda package, say xyz, you will install it using
  # conda install xyz
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

- visualize [results/solution.pvd](results/solution.pvd) or [results/solution000000.vtu](results/solution000000.vtu) file in paraview
