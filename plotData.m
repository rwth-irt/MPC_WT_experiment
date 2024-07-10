

%% unzip
if ~isfile('ExperimentalData_01.csv')
    unzip('ExperimentalData_01.zip');
end
if ~isfile('ExperimentalData_02.csv')
    unzip('ExperimentalData_02.zip');
end
if ~isfile('ExperimentalData_03.csv')
    unzip('ExperimentalData_03.zip');
end
if ~isfile('ExperimentalData_04.csv')
    unzip('ExperimentalData_04.zip');
end
if ~isfile('ExperimentalData_05.csv')
    unzip('ExperimentalData_05.zip');
end
if ~isfile('ExperimentalData_06.csv')
    unzip('ExperimentalData_06.zip');
end

%% load data
expDataSet_01 = readtable('ExperimentalData_01.csv');
expDataSet_02 = readtable('ExperimentalData_02.csv');
expDataSet_03 = readtable('ExperimentalData_03.csv');
expDataSet_04 = readtable('ExperimentalData_04.csv');
expDataSet_05 = readtable('ExperimentalData_05.csv');
expDataSet_06 = readtable('ExperimentalData_06.csv');

expDataSet = [expDataSet_01; expDataSet_02; expDataSet_03; expDataSet_04; expDataSet_05; expDataSet_06];
clear expDataSet_01 expDataSet_02 expDataSet_03 expDataSet_04 expDataSet_05 expDataSet_06

% -- rated values of rotational speed and power
omega_rated = 431; % / rpm
P_rated = 3e6; % / W

%% plot
figure
subplot(5,1,1)
hold on
plot(expDataSet.TimeStamps, expDataSet.sensor_windSpeed);
plot(expDataSet.TimeStamps, expDataSet.EKF_state_v_windeff);
hold off
grid on
xlabel('time')
ylabel('v / m/s')
legend('v_h', 'v_{w_eff}')
subplot(5,1,2)
hold on
plot(expDataSet.TimeStamps, expDataSet.sensor_omega_g);
plot([expDataSet.TimeStamps(1), expDataSet.TimeStamps(end)], [omega_rated, omega_rated]);
hold off
grid on
xlabel('time')
ylabel('omega_g / rpm')
legend('R-MPC', 'rated')
subplot(5,1,3)
hold on
plot(expDataSet.TimeStamps, expDataSet.sensor_P_g*1e3);
plot([expDataSet.TimeStamps(1), expDataSet.TimeStamps(end)], [P_rated, P_rated]);
hold off
grid on
xlabel('time')
ylabel('P_g / W')
subplot(5,1,4)
hold on
plot(expDataSet.TimeStamps, expDataSet.sensor_theta_1);
plot(expDataSet.TimeStamps, expDataSet.sensor_theta_2);
plot(expDataSet.TimeStamps, expDataSet.sensor_theta_3);
hold off
grid on
xlabel('time')
ylabel('theta / deg')
legend('theta_1', 'theta_2', 'theta_3')
subplot(5,1,5)
plot(expDataSet.TimeStamps, expDataSet.sensor_T_g);
grid on
xlabel('time')
ylabel('T_g / N m')


