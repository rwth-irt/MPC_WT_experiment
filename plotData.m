
%% load data
expDataSet = readtable('ExperimentalData.csv');

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


