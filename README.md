Authors: Andreas Klein, Thorben Wintermeyer‐Kallen, János Zierath, W2E Wind to Energy GmbH
Date of the experiment: December 13, 2023


How to plot:
unzip all "ExperimentalData_0X.zip".
run "plotData.m"

Data information:
"ExperimentalData.csv" contains the full experimental dataset of the R-MPC controlling an industrial 3 MW WT in norhtern Germany. The experiment was performend on the 13.12.2023.
We provide the units and descriptions of the data in "DescriptionUnits.xlsx".

Some general information:
"MPC_Active" is 1, when the R-MPC is active and controls the wind turbine.
"EKF_state_<>" contains the state vector estimated by the EKF.
"sensor_x_t_dtt" and "sensor_y_t_dtt" are accelerometer data before high-pass filtering.
The Matlab Script "plotData.m" imports the "ExperimentalData.csv" to matlab and plots the wind speed, rotational speed, electrical power, pitch angles and generator torque.
