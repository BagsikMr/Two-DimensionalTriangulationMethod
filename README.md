# Two-DimensionalTriangulationMethod
Two-Dimensional Triangulation Method for Time Difference of Arrival

## Table of contents
* [General info](#general-info)
* [Setup](#setup)

## General info
The Two-Dimensional Time Difference of Arrival (TDoA) triangulation method involves determining the position of a transmitter based on the differences in signal arrival time at at least 3 receivers (base stations). The x,y position of the transmitter is determined by the intersection point of at least two hyperbolas. An example equation for a single hyperbola, determined based on the difference in signal arrival time d and the positions of two previously defined base stations (x<sub>a</sub>, y<sub>a</sub>), (x<sub>b</sub>, y<sub>b</sub>) is defined as:
```math
f(x,y) = d = \sqrt{(x_a - x)^2 + (y_a - y)^2} - \sqrt{(x_b - x)^2 + (y_b - y)^2}
```

The program is used for visualizing the potential position of a transmitter on a two-dimensional plane with dimensions M x N.
The plane is expressed as an array called "data" and is built on the same principle as the screen memory.
The function perform a process of scanning the grid of values of x and y, and set the value 1 in the "data" memory when the absolute difference between the calculated value of the function f(x, y) and the given d value is less than the epsilon value.
Otherwise, the memory will be set to 0.


## Setup
Just run sln.

