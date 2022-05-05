# False Postion

# Description of Function
This function finds the roots of a prespecified function using the false postion root finding method. This function must be provided with an upper guess at the root as well as a lower guess at the root. The user can also specify what they want their stopping criteria to be. 

# Inputs
xl-lower bound

xu-upper bound

es- approx error defaults to .0001

%maxit-max number of iterations (defaults to 200)



# Outputs
root- root real

fx-value @ root

ea-approx relative error

iter-number of iterations




# Special Notes About Functions
It will check for at least three arguments.

This function will automatically assume 200 iterations and 0.000001% error. 

This function will also check to make sure that your lower and upper guess bracket the root since fixed t iternation is a closed method. 
