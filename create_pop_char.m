function pop = create_pop_char(NVARS,FitnessFcn,options) %FitnessFcn,)
%CREATE_PERMUTATIONS Creates a population of permutations.
%   POP = CREATE_PERMUTATION(NVARS,FITNESSFCN,OPTIONS) creates a population
%  of permutations POP each with a length of NVARS. 
%
%   The arguments to the function are 
%     NVARS: Number of variables 
%     FITNESSFCN: Fitness function 
%     OPTIONS: Options structure used by the GA
moves=['w','a','s','d'];
totalPopulationSize = sum(options.PopulationSize);

n = NVARS;
tmp=zeros(1,n);
pop = cell(totalPopulationSize,1);
for i = 1:totalPopulationSize
    for j=1:n
      tmp(1,j)  = moves( randi(4));
    end
    pop{i} = char(tmp); 
end
