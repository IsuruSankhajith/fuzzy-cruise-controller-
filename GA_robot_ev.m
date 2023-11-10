
 clear
 close all 
 
% The Problem
% % Our goal is to visit each box once, if we will visit on clockwise manner the scores will be high
% can experiment with fitness functions
% GA in matlab Find minimum of function using genetic algorithm
% so we will multiply our fitness function with negative, as our fitness
% function is to maximize score, after multplying it with negative number
% it can be used in optimizers which find the minimum of the function

%% we generate a floor plan with boxes to visit
% Green boxes represent the anchors to visit
% red box is our robot 

scenario = drivingScenario('SampleTime',.1','StopTime',5); %scenario = drivingScenario;

b0=[190  225 0 ; 190 210 0 ;190 210 0; 190  165 0];
roadCenters=b0;
%our robot is v1
v1 = vehicle(scenario,'ClassID',2,'Position',[190  215 0 ],'Velocity',[0 0 0], 'Length',2.5,'Width',2.5,'Height',10,'PlotColor','red');
%for anchor boxes to visit
ul=vehicle(scenario,'ClassID',2,'Position',[210  215 0 ],'Velocity',[0 0 0], 'Length',5,'Width',5,'Height',3,'PlotColor','green');
ur=vehicle(scenario,'ClassID',2,'Position',[210  175 0 ],'Velocity',[0 0 0], 'Length',5,'Width',5,'Height',3,'PlotColor','green');
bl=vehicle(scenario,'ClassID',2,'Position',[170  215 0 ],'Velocity',[0 0 0], 'Length',5,'Width',5,'Height',3,'PlotColor','green');
br=vehicle(scenario,'ClassID',2,'Position',[170  175 0 ],'Velocity',[0 0 0], 'Length',5,'Width',5,'Height',3,'PlotColor','green');

road(scenario, roadCenters,50);%, 'lanes',lanespec([1 2])

plot(scenario);
title('Scenario');

%% Required Functions
% %% create_pop_char.m       
%to create random populations

%% crossover_pop.m
% The custom crossover function takes a cell array, the population, and
% returns a cell array, the children that result from the crossover.

%% mutate_pop_char.m
% The custom mutation function takes an individual, which is an ordered set
% of moves, and returns a mutated ordered set.

%% robot_fitness.m
% We also need a fitness function. The
% fitness of an individual is the total boxes visited in certian manner or
% in least moves

%%
% |ga| will call our fitness function with just one argument |x|, but our
% fitness function has multiple arguments:x,scenario,v1,ul,ur,bl,br . We can use an
% anonymous function to capture the values of the additional argument, the
% distances matrix. We create a function handle |FitnessFcn| to an
% anonymous function that takes one input |x|, but calls
% |traveling_salesman_fitness| with |x|, and distances. The variable,
% distances has a value when the function handle |FitnessFcn| is created,
% so these values are captured by the anonymous function.
%distances defined earlier
FitnessFcn = @(x) robot_fitness(x,scenario,v1,ul,ur,bl,br);

%% Genetic Algorithm Options Setup
% First, we will create an options container to indicate a custom data type
% and the population range.
options = optimoptions(@ga, 'PopulationType', 'custom','InitialPopulationRange', ...
                            [1;50]);

%% 'PlotFcn', my_plot, @mutate_pop
% We choose the custom creation, crossover, mutation, and plot functions
% that we have created, as well as setting some stopping conditions.
options = optimoptions(options,'CreationFcn',@create_pop_char, ...
                        'CrossoverFcn',@crossover_pop, ...
                        'CrossoverFraction',0.6,...
                        'MutationFcn', {@mutate_pop_char, 0.5}, ...
                        'MaxGenerations',800,'PopulationSize',200, ...
                        'MaxStallGenerations',100,'UseVectorized',true ...
                        %,'PlotFcn', {@gaplotbestf} ...  
                        );
  %,'Display',"iter" ...   
                                         
%%
% Finally, we call the genetic algorithm with our problem information.

numberOfVariables = 50;
[bestsol,fval,reason,output] = ...
    ga(FitnessFcn,numberOfVariables,[],[],[],[],[],[],[],options);


 %% running the best solution
 runsol_show(bestsol{1},scenario,v1,ul,ur,bl,br); 
 
