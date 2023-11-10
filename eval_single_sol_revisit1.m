function scores_indviz = eval_single_sol_revisit1(sol,scenario,v1,ul,ur,bl,br)
% evaluate fitness

%   The arguments to the function are 
%     sol: single solution string
%     scenario: floor plan scenerio
%     v1: robot object 
%     ul: upper left box object
%     ur: uper right box object
%     bl:bottom left box object 
%     br: bottom right box object

is_revisit=1; % enable restriction in revisitng

is_plain=1; % count score for ,1 for without restriction, 0 for with restriction

move_ratio=14;

v1.Position = [190  215 0 ]; % robot initial position
updatePlots(scenario);
moves=['w','a','s','d']; %1,2,3,4
visited=zeros(1,4);      % flags for visitedbox
visited_sequence=zeros(1,4); % sequence of visiting
no_of_moves=0;
revisit=0;                  %count of revisits
ifchange=0;
score=0;
fitness=0;
for i_s=1:length(sol)
    step=sol((i_s));
    
    ifchange=moverobot(step,v1);
%     v1.Position
%     v1.Position-ul.Position
    no_of_moves=no_of_moves+1; % increment each move
    
    if (sum(abs(v1.Position-ul.Position))==0 ) % box1
        if ( visited(1)==1 )
         revisit=revisit+1;
        end
        if ( visited(1)==0 || is_plain==1)
                  
        score=score+1 ;
        visited(1)=1;

        visited_sequence(1)=sum(visited);
        end
        
        
    end
    
     if( sum(abs(v1.Position-ur.Position))==0 ) %box2
          if ( visited(2)==1 )
            revisit=revisit+1;
          end
         if ( visited(2)==0 || is_plain==1) 
            
         
        score=score+1 ;
         visited(2)=1;
        visited_sequence(2)=sum(visited);
       
          end
        
     end
     
     if( sum(abs(v1.Position-br.Position))==0 ) %box3
         if ( visited(3)==1 )
         revisit=revisit+1;
        end
         if ( visited(3)==0 || is_plain==1) 
             
             
        score=score+1 ;
                visited(3)=1;

        visited_sequence(3)=sum(visited);
         end
        
     end
     
     if(  sum(abs(v1.Position-bl.Position))==0 ) %box4
         if ( visited(4)==1 )
         revisit=revisit+1;
        end
         if( visited(4)==0 || is_plain==1) 
             
              
        score=score+1;
                visited(4)=1;

        visited_sequence(4)=sum(visited);
         end
        
     end
   
    if(ifchange==1)
%           updatePlots(scenario);
          ifchange=0;
          step=0;
           
    end
    if sum(visited)==4 
        
        break;
    end
    
    
    %straigntess of path, close to goal etc, penalty on revist
    %% Socre With Moves
    fitness=-1*(2*score) +10*(no_of_moves/move_ratio);
    %fitness=-1*(2*score) + 5*(revisit*is_revisit) - (3*(14/no_of_moves));
    %fitness=-1*(2*score) +10*(no_of_moves/move_ratio);
    %% socre with moves and visit only once   
    
    fitness=-1*(2*score) + 5*(revisit*is_revisit) - (3*(14/no_of_moves));
    %(exp((no_of_moves/move_ratio)-1))^1.5  ;
    %2*exp(((no_of_moves-14)-2)/5);
     %% socre with sequence
    %fitness=-1*(20*sum(visited))+50*(revisit*is_revisit) - 0.1/(sum(abs(visited_sequence-[1 2 3 4]))+1)- (10*(14/no_of_moves));

        
   
end

scores_indviz=fitness;