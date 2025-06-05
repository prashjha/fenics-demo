# fenics-demo-uop

## Setup

- First, install key packages following [setup/essential_packages.md](setup/essential_packages.md)

- Next, follow instructions in [setup/conda_and_fenics_setup.md](setup/conda_and_fenics_setup.md) to install conda and fenics and test fenics code. 

## Examples

1. Meshing Examples
	[File](meshing/create_mesh.ipynb) shows examples of creating meshes using either `gmsh` or `pygmsh` python package. File also shows how to create `.geo` file for complex geometries and run `gmsh` code in python. If it is a 2-d mesh, you can also easily plot the mesh using dolfin plot function. 

	[File](meshing_using_pygmsh/mesh_examples.ipynb) in folder `meshing_using_pygmsh` uses pygmsh to create the mesh (i.e., it bypasses creating a `.geo` file). Mesh of standard geometries are implemented. For most of the geometries when possible one can create a symmetric mesh by creating the mesh of one part of the domain and mirroring it. 

2. [fenics_examples](fenics_examples)
	Fenics (2019.1.0) implementation. Examples include:

	1. [Poisson Equation](fenics_examples/poisson_equation/poisson_equation.ipynb)
		We solve Poisson equation in 2-d in simple and complex geometries. This jupyter notebook file is also a good starting example of using notebook to seamlessly combine markdown text, python codes, and output of codes. 

	2. [Nonlinear Poisson Equation](fenics_examples/nonlinear_poisson_equation/nonlinear_poisson_equation.ipynb)
		Nonlinear version of Poisson equation is used to show how nonlinear variational problems can be solved in Fenics. Newton and Picard iteration methods are explained and implemented and compared with the Fenics's solve method for nonlinear variational problems. 

	3. [Elasticity - material deformation in 2-d and 3-d](fenics_examples/elasticity/elasticity.ipynb)
		We consider three different models (or constitutive relations and small/large deformation theories) of beams subjected to twisting and bending loading: isotropic linear elastic beam, orthotropic linear elastic beam, and beam made of hyperealstic material with large deformation theory. 

3. [fenicsx_examples](fenicsx_examples)
	Fenicsx implementation. Examples include:
	
	1. [Elasticity - material deformation in 2-d and 3-d](fenicsx_examples/elasticity/elasticity.ipynb)
		Fenicsx implementation of `fenics_examples/elasticity/elasticity.ipynb`.