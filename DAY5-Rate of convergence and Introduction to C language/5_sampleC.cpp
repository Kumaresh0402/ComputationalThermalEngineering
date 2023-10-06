#include <iostream>

int main()
{
    //std::string openfoam = "OpenFOAM";

    //std::cout << "Hello openfoam\n";
    //std::cout << "Hello " << openfoam << std::endl;
    std::cout << "Hello openfoam" << std::endl;

    // The command works from right end, "redirecting" to "Hello openfoam" to "std::cout" (print the statement in C language)
    // "std::cout" --> "cout" is the function or class inside the namespace "std"
    // namespace can access function or class using "::" --> name space resolution operator
}
