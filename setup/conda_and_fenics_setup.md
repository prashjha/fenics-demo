# install anaconda using terminal

- I found the instructions in this [link](https://www.digitalocean.com/community/tutorials/how-to-install-anaconda-on-ubuntu-18-04-quickstart) very useful

- After the conda installation in your machine, make sure to locate the conda script `conda.sh`. In ubuntu machines, it is usually at `$HOME/anaconda3/etc/profile.d/conda.sh`

## Installation steps

```sh
# 1. Get the name of the latest distribution from https://repo.anaconda.com/archive/
# `Anaconda3-2024.02-1-Linux-x86_64` is the latest as of March 2024

# 2. Download (use /tmp directory)
cd /tmp 
wget https://repo.anaconda.com/archive/Anaconda3-2024.02-1-Linux-x86_64.sh

# run anaconda script and follow prompts (once script has finished running, at the end it will show the path where conda is installed; usually it is at ${HOME}/anaconda3)
bash Anaconda3-2024.02-1-Linux-x86_64.sh

# enable conda in shell (so that you can run command `conda` in terminal)
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

- Take a look at fenics environment file [fenics-conda-env.yml](fenics-conda-env.yml) that has all the basic packages (you can add more to the list depending on the needs or remove, e.g., hippylib, pyvista, jupyterlab). The file looks as follows:
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
  - jupyterlab      # optional
  - scipy           # optional
  - psutil          # optional
  - fenics          # fenics package
  - pip:
    - h5py          
    - seaborn       # for plotting
    - hippylib      # for Bayesian inference (optional)
    - meshio        # for converting meshes
    - pyvista       # for plotting and converting meshes (optional)
    - pygmsh        # gives python front-end to gmsh meshing library
```

- Create a conda environment using the environment file [fenics-conda-env.yml](fenics-conda-env.yml)
```sh
# below will create an environment named `confen` (name is specified in the environment file `fenics-conda-env.yml`)
conda env create -f fenics-conda-env.yml 
```

- Test if new environment activates and works
```sh
# activate env
conda activate confen

# deactivate
conda deactivate
```


- **Alternative way:** If there is an issue creating environment with all the packages in [fenics-conda-env.yml](fenics-conda-env.yml) file, consider another environment file [fenics-conda-lean-env.yml](fenics-conda-lean-env.yml) that has smaller number of packages. Also, due to conflict of new packages with ones in your machine, conda may take long time to find the right versions of some of the packages in conda environment file. It it is taking too long a time, consider creating conda environment using the new file as follows:
  - Create environment using this file:
  ```sh
  conda env create -f fenics-conda-lean-env.yml 
  ```
  - Next, install the two other key libraries from command line as follows:
  ```sh
  # activate env (activate the environment as we want to install the packages inside this environment)
  conda activate confen
  # install pip packages
  pip install pygmsh meshio
  # note that if there was a conda package, say 'xyz', you will install it using 'conda' channel as follows
  # conda install xyz
  ```

- Test fenics code (**in below, replace the path to `conda.sh` file to the correct path for your installation, e.g., in Mac it could be in `/Users/<user name>/opt/anaconda3/etc/profile.d/`**)
```sh
# go to directory where fenics test code is
cd fenics_test

# exectute runFenics.sh script or follow the instructions here

# source conda script (you may not need this if conda is set correctly in the shell)
source $HOME/anaconda3/etc/profile.d/conda.sh

# activate conda enviroment
conda activate confen

# run fenics example python script
python ft01_poisson.py
```

- Visualize [fenics_test/results/solution.pvd](fenics_test/results/solution.pvd) or [fenics_test/results/solution000000.vtu](fenics_test/results/solution000000.vtu) file in paraview


# create fenics environment

- Take a look at fenics environment file [fenicsx-conda-env.yml](fenicsx-conda-env.yml) that has all the basic packages (you can add more to the list depending on the needs or remove, e.g., hippylib, pyvista, jupyterlab). The file looks as follows:
```yml
name: confen        # name of the environment
channels:
  - conda
  - conda-forge
dependencies:
  - python=3.8      # need this specific version for compatibility with fenics
  - mpich           # for parallel computing support  
  - pip             # to install pip packages
  - matplotlib      # for plotting
  - jupyter         # jupyter notebook
  - scipy           # optional
  - fenics
  - pip:
    - h5py          # for HDF5 file support
    - meshio        # for converting meshes
    - pyvista[all,trame]    # for plotting and converting meshes (optional)
    - pygmsh        # gives python front-end to gmsh meshing library
    - ipywidgets    # for interactive widgets in Jupyter notebooks
```

- Create a conda environment using the environment file [fenics-conda-env.yml](fenics-conda-env.yml)
```sh
# below will create an environment named `confen` (name is specified in the environment file `fenics-conda-env.yml`)
conda env create -f fenics-conda-env.yml 
```

- Test if new environment activates and works
```sh
# activate env
conda activate confen

# deactivate
conda deactivate
```

- Test fenics code (**in below, replace the path to `conda.sh` file to the correct path for your installation, e.g., in Mac it could be in `/Users/<user name>/opt/anaconda3/etc/profile.d/`**)
```sh
# go to directory where fenics test code is
cd fenics_test

# exectute runFenics.sh script or follow the instructions here

# source conda script (you may not need this if conda is set correctly in the shell)
source $HOME/anaconda3/etc/profile.d/conda.sh

# activate conda enviroment
conda activate confen

# run fenics example python script
python ft01_poisson.py
```

- Visualize [fenics_test/results/solution.pvd](fenics_test/results/solution.pvd) or [fenics_test/results/solution000000.vtu](fenics_test/results/solution000000.vtu) file in paraview


# create fenicsx environment

- Take a look at fenics environment file [fenicsx-conda-env.yml](fenicsx-conda-env.yml) that has all the basic packages (you can add more to the list depending on the needs or remove, e.g., hippylib, pyvista, jupyterlab). The file looks as follows:
```yml
name: confenx       # name of the environment
channels:
  - conda
  - conda-forge
dependencies:
  - fenics-dolfinx
  - mpich           # for parallel computing support  
  - pip             # to install pip packages
  - matplotlib      # for plotting
  - jupyter         # jupyter notebook
  - scipy           # optional
  - pip:
    - h5py          # for HDF5 file support
    - meshio        # for converting meshes
    - pyvista[all,trame]    # for plotting and converting meshes (optional)
    - pygmsh        # gives python front-end to gmsh meshing library
    - ipywidgets    # for interactive widgets in Jupyter notebooks
```

- Create a conda environment using the environment file [fenicsx-conda-env.yml](fenicsx-conda-env.yml)
```sh
# below will create an environment named `confen` (name is specified in the environment file `fenics-conda-env.yml`)
conda env create -f fenicsx-conda-env.yml 
```

- Test if new environment activates and works
```sh
# activate env
conda activate confenx

# deactivate
conda deactivate
```

- Test fenicsx code (**in below, replace the path to `conda.sh` file to the correct path for your installation, e.g., in Mac it could be in `/Users/<user name>/opt/anaconda3/etc/profile.d/`**)
```sh
# go to directory where fenics test code is
cd fenicsx_test

# exectute runFenics.sh script or follow the instructions here

# source conda script (you may not need this if conda is set correctly in the shell)
source $HOME/anaconda3/etc/profile.d/conda.sh

# activate conda enviroment
conda activate confenx

# run fenics example python script
python ft01_poisson.py
```

- Visualize [fenicsx_test/results/solution.pvd](fenicsx_test/results/solution.pvd) or [fenicsx_test/results/solution000000.vtu](fenicsx_test/results/solution000000.vtu) file in paraview
