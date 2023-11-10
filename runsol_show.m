function  runsol_show(sol,scenario,v1,ul,ur,bl,br)

% run solution

%   The arguments to the function are 
%     sol: single solution string
%     scenario: floor plan scenerio
%     v1: robot object 
%     ul: upper left box object
%     ur: uper right box object
%     bl:bottom left box object 
%     br: bottom right box object

v1.Position = [190  215 0 ];
ul.PlotColor='green';
ur.PlotColor='green';
bl.PlotColor='green';
br.PlotColor='green';
updatePlots(scenario);
moves=['w','a','s','d']; %1,2,3,4
visited=zeros(1,4);
revisit=0;
visited_sequence=zeros(1,4);
no_of_moves=0;
all_visited=0;
ifchange=0;
score=0;
fitness=0;
for i_s=1:length(sol)
    step=sol((i_s));
    
    ifchange=moverobot(step,v1);
%     v1.Position
%     v1.Position-ul.Position
    no_of_moves=no_of_moves+1;
    if (sum(abs(v1.Position-ul.Position))==0 )
        ul.PlotColor='blue';

        if ( visited(1)==1 )
         revisit=revisit+1;
        end
        
            
       
        score=score+1 ;
        visited_sequence(1)=score;
        visited(1)=1;
       
        
        
    end
    
     if( sum(abs(v1.Position-ur.Position))==0 )
         ur.PlotColor='blue';

          if ( visited(2)==1 )
         revisit=revisit+1;
        end
        
            
         
        score=score+1 ;
        visited_sequence(2)=score;
        visited(2)=1;
         
        
     end
     
     if( sum(abs(v1.Position-br.Position))==0 ) 
         br.PlotColor='blue';

         if ( visited(3)==1 )
         revisit=revisit+1;
        end
        
             
        score=score+1 ;
        visited_sequence(3)=score;
        visited(3)=1;
       
        
     end
     
     if(  sum(abs(v1.Position-bl.Position))==0 )
         bl.PlotColor='blue';
         if ( visited(4)==1 )
         revisit=revisit+1;
        end
       
        score=score+1;
        visited_sequence(4)=score;
        visited(4)=1;
        
     end
   
    if(ifchange==1)
           updatePlots(scenario);
          ifchange=0;
          step=0;
           
    end
    if sum(visited)==4 
        
        break;
    end
     fitness=-1*(score-no_of_moves/40);
    
     pause(.5)
        
   
end
X = ['Score = ',num2str(score)];
disp(X)
sequence = ['Sequence = ',num2str(visited_sequence)];
disp(sequence)
nomoves = ['no. of moves = ',num2str(no_of_moves)];
disp(nomoves)
revisitd = ['revisits = ',num2str(revisit)];
disp(revisitd)
scores_indviz=fitness;