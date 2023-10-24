* solver
  * Run 'wmake' command inside 'diffusionSolver'
 
* case
  * blockMesh             // this command will generate the mesh in OpenFOAM
  * diffusionFoam       // this command will run the diffusion solver compiled
  * touch diffusion.foam  // this command will generate the .foam extension to run the post-processing
 
* post-processing
  * Open 'paraview'
  * Generate the contour and line plot 
