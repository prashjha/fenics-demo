# fenics-demo-uop

## Setup

- First, install key packages following [setup/essential_packages.md](setup/essential_packages.md)

- Next, follow instructions in [setup/conda_and_fenics_setup.md](setup/conda_and_fenics_setup.md) to install conda and fenics and test fenics code

## Examples

1. [Meshing Examples](meshing/create_mesh.ipynb)
	Examples of creating meshes using either `gmsh` or `pygmsh` python package. File also shows how to create `.geo` file for complex geometries and run `gmsh` code in python. If it is a 2-d mesh, you can also easily plot the mesh using dolfin plot function. 

2. [Poisson Equation](poisson_equation/poisson_equation.ipynb)
	We solve Poisson equation in 2-d in simple and complex geometries. This jupyter notebook file is also a good starting example of using notebook to seamlessly combine markdown text, python codes, and output of codes. 

3. [Nonlinear Poisson Equation](nonlinear_poisson_equation/nonlinear_poisson_equation.ipynb)
	Nonlinear version of Poisson equation is used to show how nonlinear variational problems can be solved in Fenics. Newton and Picard iteration methods are explained and implemented and compared with the Fenics's solve method for nonlinear variational problems. 

4. [Elasticity - material deformation in 2-d and 3-d](elasticity/elasticity.ipynb)
	We consider three different models (or constitutive relations and small/large deformation theories) of beams subjected to twisting and bending loading: isotropic linear elastic beam, orthotropic linear elastic beam, and beam made of hyperealstic material with large deformation theory. 