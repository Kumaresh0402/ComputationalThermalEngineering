**Flow over a sphere**

1) How to create a sphere

** Use any modelling software
** here are the dimensions: radius = 0.1mm, location of the sphere (0.5mm, 0.5mm, 0.5mm)


2) Commands to be executed

* mkdir constant/triSurface, then copy your cad model (sphere.obj (or) sphere.stl)
* blockMesh
* surfaceFeatureExtract
* snappyHexMesh -overwrite
* icoFoam
