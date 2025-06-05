# mesh_examples.ipynb
This file uses the functions in `gmsh_particles.py` for meshing various geometries. In the `gmsh_particles.py`, wherever possible the option to create a mirrored mesh, e.g., quadrant of circle is meshed and mirrored wrt x and y axes to get the mesh of full circle, is implemented. 

File also shows how to use `meshio` to convert the gmsh mesh into Fenics friendly `.xdmf` format. 

# gmsh_particles.py
This file implements methods to mesh standard geometries. The file depends on some functions defined in `geom_util.py`. 

# msh_to_xdmf.py
Defines a function `msh_to_xdmf` that converts `.msh` file into `.xdmf` file for fenics. 

# square_with_hole
Mesh files for this example.

# square_with_hole_pygmsh
Mesh files for this example.

# rectangle_with_two_holes
Mesh files for this example.

# mesh_3d
Mesh files for this example.

# msh_to_xdmf.py
Python script that can be used to convert `.msh` format mesh file into `.xdmf` format for Fenics. 
