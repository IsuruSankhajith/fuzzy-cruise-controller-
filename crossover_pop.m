function xoverKids  = crossover_pop(parents,options,NVARS, ...
    FitnessFcn,thisScore,thisPopulation)
%   CROSSOVER_PERMUTATION Custom crossover function for traveling salesman.
%   XOVERKIDS = CROSSOVER_PERMUTATION(PARENTS,OPTIONS,NVARS, ...
%   FITNESSFCN,THISSCORE,THISPOPULATION) crossovers PARENTS to produce
%   the children XOVERKIDS.
%
%   The arguments to the function are 
%     PARENTS: Parents chosen by the selection function
%     OPTIONS: Options created from OPTIMOPTIONS
%     NVARS: Number of variables 
%     FITNESSFCN: Fitness function 
%     STATE: State structure used by the GA solver 
%     THISSCORE: Vector of scores of the current population 
%     THISPOPULATION: Matrix of individuals in the current population


nKids = length(parents)/2;
xoverKids = cell(nKids,1); % Normally zeros(nKids,NVARS);
poses=[2:1:NVARS-1];
index = 1;
kid_ind=1;

for i=1:nKids/2
    % here is where the special knowledge that the population is a cell
    % array is used. Normally, this would be thisPopulation(parents(index),:);
    parent = thisPopulation{parents(index)};
    index = index + 1;
    parent2 = thisPopulation{parents(index)};
    index = index + 1;
    rand_pos=randsample(poses,1);
    xoverKids{kid_ind}=cat(2,parent(1:rand_pos),parent2(rand_pos+1:end));
    kid_ind=kid_ind+1;
    xoverKids{kid_ind}=cat(2,parent2(1:rand_pos),parent(rand_pos+1:end));
    kid_ind=kid_ind+1;
       
end
