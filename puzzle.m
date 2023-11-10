scenario = drivingScenario('SampleTime',.1','StopTime',5); %scenario = drivingScenario;

b0=[190  225 0 ; 190 210 0 ;190 210 0; 190  165 0];



roadCenters=b0;%cat(1,b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11);%,b5,b6,b7,b8,b9,b10,b11)
v1 = vehicle(scenario,'ClassID',2,'Position',[190  215 0 ],'Velocity',[0 0 0], 'Length',2.5,'Width',2.5,'Height',10,'PlotColor','red');
ul=vehicle(scenario,'ClassID',2,'Position',[210  215 0 ],'Velocity',[0 0 0], 'Length',5,'Width',5,'Height',3,'PlotColor','green');
ur=vehicle(scenario,'ClassID',2,'Position',[210  175 0 ],'Velocity',[0 0 0], 'Length',5,'Width',5,'Height',3,'PlotColor','green');
bl=vehicle(scenario,'ClassID',2,'Position',[170  215 0 ],'Velocity',[0 0 0], 'Length',5,'Width',5,'Height',3,'PlotColor','green');
br=vehicle(scenario,'ClassID',2,'Position',[170  175 0 ],'Velocity',[0 0 0], 'Length',5,'Width',5,'Height',3,'PlotColor','green');

road(scenario, roadCenters,50);%, 'lanes',lanespec([1 2])

plot(scenario);
title('Scenario');
