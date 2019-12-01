

# One - Dimensional Parallel Flow Heat Exchanger Analysis

## Abstract

1. We seek to model the Heat exchanger set up and obtain Governing Equations for this process.
2. We now use the corresponding governing equations and set up Boundary Conditions and obtain a proper Boundary Value Problem.
3. Perform a Case study and model the setup to the BVP above.
4. Use Finite Element Method or Finite Difference Method and find out the unknown Temperature Distribution and solve for the unknown.
5. Find out Other physical Quantities related to the Problem.



## Modelling the Heat Exchanging Process in Parallel Flow

### The Assumptions taken in this derivation

1. The Temperature of fluid at a cross section is uniform i.e. T(r,x) = T(x) only.
2. The Pipe thickness is negligible.
3. Thermal conductivity of pipe is high.
4. k is a constant.

For the following we use a Cylindrical Coordinate System

![Apparatus Set-up](C:\Users\Veerendra Harshal\AppData\Roaming\Typora\typora-user-images\image-20191124031518221.png)

In the set up, Parallel flow is established.



![Heat Flow Diagram](C:\Users\Veerendra Harshal\Documents\Course Work\SEM 5\Finite Element Analysis\Heat Exchanger\Basic\Drawings\Heat flow diagram)

### Heat Flux and Heat flow within fluid

$$
\overrightarrow{q} + k\nabla T = 0 \\
q_{x} = -k\frac{\partial T}{\partial x} \\
\text{Since our Heat flow is only in x direction,} \\
Q(x) = -kA_{cs}\frac{\partial T}{\partial x} \\

\text{Hence for the cool and hot pipes,} \\
Q_{c}(x) = -k \times (\pi R_{i}^{2}) \times \frac{\partial T_{c} }{\partial x} \\
Q_{h}(x) = -k \times (\pi R_{i}^{2}) \times \frac{\partial T_{h} }{\partial x}
\\
\text{By Energy Balance as shown in above picture}
\\
Q_{c}(x+dx) = Q_{c}(x) + dQ_{conv}
\\
Q_{h}(x) = Q_{h}(x+dx) + dQ_{conv}
\\
Q_{c}(x+dx) - Q_{c}(x) = \frac{\partial Q_{c}} {\partial x} dx
\ = -\pi k r_{i}^{2} \frac{\partial ^{2} T_{c}} {\partial x ^{2}} dx
\\
Q_{h}(x+dx) - Q_{h}(x) = - \frac{\partial Q_{c}} {\partial x} dx
\ = \pi k r_{i}^{2} \frac{\partial ^{2} T_{c}} {\partial x ^{2}} dx
$$

### Convective Heat Flow

$$
\text{Convected Heat Flow}\\
dQ_{conv} = \frac{\Delta T} {R_{eff}}  \\
R_{eff} = \frac{1}{h_{in}A_{in}} + \frac{1}{h_{out}A_{out}} + R_{conduction \ in \ pipe}

\\
\text{For the problem , The pipes generally used are made with copper that have considerable thermal conductivity, and hence can be ignored} 
\\ \text{Hence,} \ \ R_{conduction \ in\  pipe} = 0 \\
R_{eff} = U_{heat} \times \pi D_{i} \times dx\\ \text{Where Uheat is overall Heat Transfer Coefficient} \\
U_{heat} = \frac{1}{\frac{1}{h{in} A_{in}} + \frac{1}{h_{out} A_{out}}}

\\
dQ_{conv} = \pi U_{heat} D_{o}(T_{h}-T_{c}) dx
$$

An important feature of this model is that it is based on the fin equation.
The fin equation can directly be incorporated but we are dealing with two dependant variable here (Temperatures).

Hence solving multiple Equations simultaneously is the way forward.

### Conservation of Energy within the pipe system


$$
\text{The Temperature gradient is manifested as the enthalpy distribution within the fluid}
\\
\rho V C_{p} T = Enthalpy\\
\text{Hence across any cross section of the pipe, Enthalpy of liquids taken in together is conserved.
 }\\ \text{
 This is true as the Convected heat flow is internal.} 
 \\ \\ \\ \rho_{c} \dot{V}_{c} C_{pc} \frac{\partial T_{c}}{\partial x} + \rho_{h} \dot{V}_{h} C_{ph} \frac{\partial T_{h}}{\partial x} =0
 \\
$$

###  Putting together the equations

$$
\text{Treating this as a Fluid mechanics problem , we notice that the heat intake is basically the fluid enthalpy intake }
\\ \rho_{c} \dot{V}_{c} C_{pc}T_{c} = Q_{c} 
\\
\rho_{c} \dot{V}_{c} C_{pc} \frac{\partial T_{c}}{\partial x} = \frac{\partial Q_{c}}{\partial x}
\\
Similarly, \\ 
\rho_{h} \dot{V}_{h} C_{ph}T_{h} = Q_{h} 
\\
\rho_{h} \dot{V}_{h} C_{ph} \frac{\partial T_{h}}{\partial x} = \frac{\partial Q_{h}}{\partial x}
\\
Hence, \\
\rho_{c} \dot{V_{c}} C_{pc} \frac{\partial T_{c}}{\partial x} = \frac{dQ_{conv}}{dx} = -\rho_{h} \dot{V}_{h} C_{ph} \frac{\partial T_{h}}{\partial x}
\\
\frac{\partial T_{h}}{\partial x} = -\frac{\rho_{c} \dot{V_{c}} C_{pc}}{\rho_{h} \dot{V}_{h} C_{ph}} \frac{\partial T_{c}}{\partial x}
\\

Differentiating \ the \ equation,
\\
\rho_{c} \dot{V_{c}} C_{pc} \frac{\partial T_{c}}{\partial x} = \pi U_{heat} D_{o}(T_{h}-T_{c})
\\
\rho_{c} \dot{V_{c}} C_{pc} \frac{\partial^{2} T_{c}}{\partial x^{2}} =  \pi U_{heat} D_{o} (\frac{\partial T_{h}}{\partial x} - \frac{\partial T_{c}}{\partial x})
\\
\rho_{c} \dot{V_{c}} C_{pc} \frac{\partial^{2} T_{c}}{\partial x^{2}} = \pi U_{heat} D_{o} ( -\frac{\rho_{c} \dot{V_{c}} C_{pc}}{\rho_{h} \dot{V}_{h} C_{ph}} \frac{\partial T_{c}}{\partial x} - \frac{\partial T_{c}}{\partial x})
\\
Taking,
M = \rho_{c} \dot{V_{c}} C_{pc} 
\\
U =  \pi U D_{o} ( \frac{\rho_{c} \dot{V_{c}} C_{pc}}{\rho_{h} \dot{V}_{h} C_{ph}}  + 1)
\\

M \frac{\partial^{2} T_{c}}{\partial x^{2}} + U  \frac{\partial T_{c}}{\partial x} = 0
\\
$$



## Setting up Boundary Conditions

By the setup we see that coolant comes in at Tci and leaves at Tco .

The heat exchanger fluid has Thi at beginning and leaves at Tho.

By the problem, we know Tci and Tco and Thi.
Tho is decided by the geometry of the situation.


$$
\text{Governing Equation}
\\
M \frac{\partial^{2} T }{\partial x^{2}} + U  \frac{\partial T}{\partial x} = 0 , \ \ 0<x<L 
\\
$$
Boundary Conditions
$$
\text{Essential Boundary Conditions}
\\
T(r,0) = T_{ci} ,\ 0<r<r_{i} \\
T(r,0) = T_{hi} ,\ r_{i} < r < r_{o} \\
T(r,L) = T_{co} ,\ 0<r<r_{i} \\
$$
The Boundary Value Problem
$$
\text{Boundary Value Problem}
\\
M \frac{\partial^{2} T }{\partial x^{2}} + U  \frac{\partial T}{\partial x} = 0 , \ \ 0<x<L \\
T(r,0) = T_{ci} ,\ 0<r<r_{i} \\
T(r,0) = T_{hi} ,\ r_{i} < r < r_{o} \\
T(r,L) = T_{co} ,\ 0<r<r_{i} \\

\\
$$

## Case Study for a Parallel Heat Flow Exchanger

1. The fluids used here are Water and Ethylene Glycol - Water Mixture.
2. The values used here are in SI Units.
3. Using Laminar flow in the pipe , h is used.

### The Properties of fluids 

Water is the coolant liquid.

Ethylene Glycol - Water Mixture 50% Mass Mixture



|                      | h    | c      |
| -------------------- | ---- | ------ |
| Density              | 1060 | 1000   |
| Specific Heat        | 805  | 4187   |
| Velocity of fluid    | 1    | 2      |
| Thermal Conductivity | 0.38 | 0.6408 |

### Properties of the Equipment


$$
\text{Heat Exchanger} \\ 

\\
D_{o} = 0.01
\ 
D_{i} = 0.008
\ 
D_{hyd} = D_{o} - D_{i}
\\
\dot{V_{c}} = \pi*(D_{i}^{2})*0.25*v_{c}
\\
\dot{V_{h}} =  \pi*(D_{o}^{2} - D_{i}^{2})*0.25*v_{h}
\\
h_{c} = \frac{4.36k_{c}}{D_{i}}
\\
h_{h} = \frac{4.36k_{h}}{D_{hyd}}

\\
U_{heat} = \frac{1}{\frac{1}{h{c} A_{in}} + \frac{1}{h_{h} A_{out}}}
\\
M = \rho_{c}*\dot{V_{c}}*Cp_{c} \\


\eta = 1 + (m_{c}/m_{h})\\
U = U_{heat}*\pi*D_{i}*\eta \\  
We \ therefore \ get \\
U = 5.3541 \ Wm^{-1}K^{-1}\\
M = 42.892 \ WK^{-1}\\
$$


### The Boundary Value Problem - Heat Exchanger


$$
42.892 \times \frac{\partial^{2} T }{\partial x^{2}} + 5.3541 \times \frac{\partial T}{\partial x} = 0
\\
T(r,0) = 293 ,\ 0<r<r_{i} \\
T(r,0) = 373 ,\ r_{i} < r < r_{o} \\
T(r,20) = 353 ,\ 0<r<r_{i} \\
$$

## Solving the Boundary Value Problem

### Finite Element Method

#### Discretization

The Domain is divided into 20 elements.

One Dimensional Element hence Number of Nodes per element  = 2 

Degrees of Freedom = 1

size of stiffness matrix = 2 x 2

#### Element Equations

$$
\text{Stiffness Matrix} \\
x = \frac{x_{1} + x_{2} + ls}{2} \\
J = \frac{dx}{ds} \\
\N = \left(\begin{matrix}N_{1}\\N_{2}\end{matrix}\right) = \left(\begin{matrix}\frac{1-s}{2} \\ \frac{1+s}{2} \end{matrix}\right) \\

\N s = \frac{\partial \N}{\partial s}

\\
k = M \times \int_{-1}^{+1} \frac{1}{J}\times\N s \times \frac{1}{J}\times \N s^{T} \times J ds + U \times \int_{-1}^{+1} \N \times \frac{1}{J}\times \N s^{T} \times J ds

\\

r = \left(\begin{matrix}-M \times \frac{\partial T}{\partial x}|_{x_{1}} \\ +M \times \frac{\partial T}{\partial x}|_{x_{2}}\end{matrix}\right)
$$

 

#### Stiffness Matrices

$$
k = \left(\begin{matrix}45.569&-45.569\\-40.214&40.214\end{matrix}\right)
\\
$$

Global Stiffness Matrix 

1. Size = Number of Nodes per Element x Number of Elements x Number of Degrees of Freedom.
2. R(1,1) and R(end,1) are Enthalpy inputs into the pipes.



#### Solving for Unknown Temperatures

$$
T_{unknown} = inv(K(NodeunEBC,NodeunEBC))* (R(NodeunEBC)-K(NodeunEBC,NodeEBC)*Tebc);
$$

Hence, Temperature Distribution is known.
$$
\text{Now that we know the Tc distribution , we can find the Th distribution}\\
{\rho_{h} \dot{V}_{h} C_{ph} }T_{h} +  {\rho_{c} \dot{V_{c}} C_{pc}} T_{c} = {\rho_{h} \dot{V}_{h} C_{ph} }T_{hi} +  {\rho_{c} \dot{V_{c}} C_{pc}} T_{ci} 
$$

| X(m) | Tc(K)  | Th(K)  |
| :--: | :----: | :----: |
|  0   |  293   |  373   |
|  1   | 300.68 | 371.61 |
|  2   | 307.46 | 370.38 |
|  3   | 313.44 | 369.3  |
|  4   | 318.72 | 368.34 |
|  5   | 323.38 | 367.5  |
|  6   | 327.49 | 366.75 |
|  7   | 331.12 | 366.1  |
|  8   | 334.32 | 365.52 |
|  9   | 337.14 |  365   |
|  10  | 339.64 | 364.55 |
|  11  | 341.84 | 364.15 |
|  12  | 343.78 | 363.8  |
|  13  | 345.49 | 363.49 |
|  14  | 347.01 | 363.22 |
|  15  | 348.34 | 362.97 |
|  16  | 349.52 | 362.76 |
|  17  | 350.56 | 362.57 |
|  18  | 351.48 | 362.41 |
|  19  | 352.29 | 362.26 |
|  20  |  353   | 362.13 |

### Finite Difference Method

#### Formulation

$$
M \frac{\partial^{2} T }{\partial x^{2}} + U  \frac{\partial T}{\partial x} = 0
\\
\frac{\partial^{2} T }{\partial x^{2}} = \frac{T_{i+1} - 2 \times T_{i} + T_{i-1}}{\Delta x^{2}}
\\
\frac{\partial T }{\partial x} = \frac{T_{i+1} - T_{i-1}}{2 \times \Delta x}
\\
M\times \frac{T_{i+1} - 2 \times T_{i} + T_{i-1}}{\Delta x^{2}} + U \times \frac{T_{i+1} - T_{i-1}}{2 \times \Delta x} = 0
\\
T_{i} = \frac{ \frac{M}{\Delta x^{2}} + \frac{U}{\Delta x} }{2 \times \frac{M}{\Delta x^{2}}}\times T_{i+1} + \frac{ \frac{M}{\Delta x^{2}} - \frac{U}{\Delta x} }{2 \times \frac{M}{\Delta x^{2}}} \times T_{i-1}
\\ \text{Simplifying it,} \\
T_{i} = aT_{i+1} +  bT_{i-1},
\\
a = \frac{ \frac{M}{\Delta x^{2}} + \frac{U}{\Delta x} }{2 \times \frac{M}{\Delta x^{2}}} \ 
b = \frac{ \frac{M}{\Delta x^{2}} - \frac{U}{\Delta x} }{2 \times \frac{M}{\Delta x^{2}}}
$$

#### Gauss Seidel Iteration

Tc(0) = Tci

Tc(L) = Tco

The nodes are intermittent and equidistant along the length L

Per iteration, we keep updating each node temperature per the formulation given above.

For node 1 and end , we skip this as essential boundary condition is maintained

Hence,
$$
T_{i} = T_{ci} , i = 1
\\
T_{i} = T_{ci} , i = end
\\
T_{i} = aT_{i+1} +  bT_{i-1} , i \neq 1,end
$$


| X(m) | Tc(K)  | Th(K)  |
| :--: | :----: | :----: |
|  0   | 293.00 | 373.00 |
|  1   | 300.68 | 371.61 |
|  2   | 307.46 | 370.38 |
|  3   | 313.44 | 369.30 |
|  4   | 318.72 | 368.34 |
|  5   | 323.38 | 367.50 |
|  6   | 327.49 | 366.75 |
|  7   | 331.12 | 366.10 |
|  8   | 334.32 | 365.52 |
|  9   | 337.14 | 365.00 |
|  10  | 339.64 | 364.55 |
|  11  | 341.84 | 364.15 |
|  12  | 343.78 | 363.80 |
|  13  | 345.49 | 363.49 |
|  14  | 347.01 | 363.22 |
|  15  | 348.34 | 362.97 |
|  16  | 349.52 | 362.76 |
|  17  | 350.56 | 362.57 |
|  18  | 351.48 | 362.41 |
|  19  | 352.29 | 362.26 |
|  20  | 353.00 | 362.13 |



### Temperature Distribution over Length 

![Temperature Graph](C:\Users\Veerendra Harshal\Documents\Course Work\SEM 5\Finite Element Analysis\Heat Exchanger\Basic\Temperatures.png)

*The Temperature Distribution against Length scale.*



#### Temperature at the Outlet of Hot pipe

$$
\text{The Temperature at exit:} \\
T_{ho} = 362.13
$$



## Heat Analysis

### Heat Transfer Derivation 


$$
\text{Finding the Heat transferred} \\
Q_{conv} = \int_{0}^{L} \pi U_{heat} D_{i} (T_{h}-T_{c}) dx \\
Q_{exchanged} = \rho_{h} \dot{V}_{h} C_{ph}T_{hi} - \rho_{h} \dot{V}_{h} C_{ph}T_{ho} = \rho_{c} \dot{V}_{c} C_{pc}T_{co} - \rho_{c} \dot{V}_{c} C_{pc}T_{ci}
\\
Q_{analytical} = U_{heat} \times \pi D_{i} \times LMTD \\
LMTD = \frac{\Delta T_{1} - \Delta T_{2}}{ln \frac{\Delta T_{1}}{\Delta T_{2}}} \\
\Delta T_{1} = T_{hi} - T_{ci} \ \  \Delta T_{2} = T_{ho} - T_{co} 
\\ 
$$

### Heat Exchange Results 

| Heat Exchange Process    | Heat Exchange Value (W) - FEM | Heat Exchange Value (W) - FDM |
| ------------------------ | ----------------------------- | ----------------------------- |
| Convective Heat Transfer | 2826.6                        | 2999.6                        |
| Exchange in Enthalpies   | 2573.5                        | 2573.5                        |
| Analytical Solution      | 2960.3                        | 2960.3                        |

## 





