%clc
clear all
close all
temp=[1];
data=thingSpeakRead(694999,'Fields',[1,2,3],'NumPoints',3)
%temp1=input('Enter 3 sets of time, temp and vibration: ')
temp=[temp,data(1,:),data(2,:),data(3,:)];
mu=[ 0.00000   748.26144    25.56968     6.59512   748.86267    25.58138     6.50509   749.46592    25.55290     5.22228];

sigma=[ 1.0000   563.4031     2.8603    27.8814   563.4005     2.8642    26.9376   563.4014     2.8667    21.5439];

%temp =[1   27   24    2   27   25    3   28   26    3]
%Input to the regressor.
temp=(temp-mu)./sigma;%TEMP IS THE INPUT VARIABLE WITH 9 CONTINOUS READING AND 1 OR A 2 IMPOSED IN THE BEGNING
theta=[ 1.276633;
 	0.237515;
 	-0.160136;
 	-0.019371;
 	0.237511;
 	-0.143820;
 	0.008394;
 	0.237500;
 -	0.144295;
 	0.025481]
  
  predicted=temp*theta
fprintf("Predicted State    \n%f",predicted);
if (predicted<.5)&& (predicted>=0)
    fprintf("Working fine")
elseif (predicted<.7)&& (predicted>=.5)
    fprintf("Health deteriorating")
elseif (predicted<.1)&& (predicted>=.7)
    fprintf("Critical, needs servicing")
else
    fprintf("Pop up on app that there is some anomaly is detected")
end