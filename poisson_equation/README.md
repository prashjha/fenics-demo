# ft01_poisson.py
Fenics code to quickly test the fenics installation

# runFenics.sh
Shell script that shows how to activate conda environment and run the fenics code. 

Note that you will need a correct path to the `conda.sh` file (see [../setup/conda_and_fenics_setup.md](../setup/conda_and_fenics_setup.md) file for more details).

# results
Contains the output of poisson test that you can visualize in paraview. `.pvd` file contains the list of all simulation file that you can open in paraview. Alternatively, you can directly open `.vtu` file in paraview. 

# demo.ipynb
Short jupyter notebook file for a quick demo

# poisson_equation.ipynb
Here, we step-by-step write fenics code to solve the Poisson equation. It also shows how to load the mesh in fenics and solve the same equation on complex domains. 

# view.pvsm
Paraview state file that can be used to visualize the result. Simply load the state using this file and select the correct `.pvd` file and it will create the view. Checkout paraview tutorials for more details. 


