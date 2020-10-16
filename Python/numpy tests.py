import numpy as np
vec1 = np.array([0,1,2]).reshape(3,1)
vec2 = np.array([1,3,2])
k = vec1*vec2
print("\n",vec1)
print("\n",vec2)
print("\n",k)
print(np.det(vec1))