
![http://quantnet.wiwi.hu-berlin.de/style/banner.png](http://quantnet.wiwi.hu-berlin.de/style/banner.png)

## ![qlogo](http://quantnet.wiwi.hu-berlin.de/graphics/quantlogo.png) **LCARE_c_Simulation**


```yaml

Name of Quantlet: LCARE_c_Simulation

Published in: LCARE

Description: 'Simulates paths of a CARE model with fixed parameter vector.'

Keywords:
- simulation
- time-series
- process
- data
- basis
- model   

See also: 
- LCARE_b_Simulation

Author: Andrija Mihoci, Xiu Xu

Submitted:  Thu, November 12 2015 by Xiu Xu
```




```R

 
 
clear all; clc;
Th1_005                    = [-0.01514, -0.01034, -0.31360, -0.06366, 0.00005]';
Th1_001                    = [-0.02892, -0.00298, -0.14472, -0.00037, 0.00040]';
[y_t_005_Th1, y_t_001_Th1] = LCARE_2b_Simulation(Th1_005, Th1_001);
save('y_t_005_Th1', 'y_t_005_Th1', '-ascii');
save('y_t_001_Th1', 'y_t_001_Th1', '-ascii');
 
Th2_005                    = [-0.00998, -0.05234, -0.85700, 0.56274, 0.00005]';
Th2_001                    = [-0.02323, 0.10132, -2.43912, 2.63032, 0.00040]';
[y_t_005_Th2, y_t_001_Th2] = LCARE_2b_Simulation(Th2_005, Th2_001);
save('y_t_005_Th2', 'y_t_005_Th2', '-ascii');
save('y_t_001_Th2', 'y_t_001_Th2', '-ascii');
 
Th3_005                    = [0.00000, 0.12149, 0.00421, 0.17589, 0.00005]';
Th3_001                    = [0.00000, 0.12637, 0.00008, 0.03325, 0.00040]';
[y_t_005_Th3, y_t_001_Th3] = LCARE_2b_Simulation(Th3_005, Th3_001);
save('y_t_005_Th3', 'y_t_005_Th3', '-ascii');
save('y_t_001_Th3', 'y_t_001_Th3', '-ascii');
 