moves=['w','a','s','d']
no_of_moves=0;
ifchange=0;
visited=zeros(1,4);
visited_sequence=zeros(1,4);
no_of_moves=0;
all_visited=0;
revisit=0;
score=0;
v1.Position = [190  215 0 ];
updatePlots(scenario);
while (true)
%step=getkey;

prompt = "'Press a key w, a, s, d, or q to exit' ";
step = input(prompt,'s');


% disp(v1.Position)

if (step=='q')
   break  

else 
   ifchange=moverobot(step,v1);
if(ifchange==1)
  no_of_moves=no_of_moves+1
    if (sum(abs(v1.Position-ul.Position))==0 )
        if ( visited(1)==0 || is_plain==1)
            
        ul.PlotColor='blue';
        score=score+1 ;
        visited_sequence(1)=score;
        visited(1)=1;
        else
         revisit=revisit+1;
        end
        
    end
    
     if( sum(abs(v1.Position-ur.Position))==0 )
         if ( visited(2)==0 || is_plain==1) 
          ur.PlotColor='blue';
        score=score+1 ;
        visited_sequence(2)=score;
        visited(2)=1;
         else
             revisit=revisit+1;
         end
     end
     
     if( sum(abs(v1.Position-br.Position))==0 ) 
         if ( visited(3)==0 || is_plain==1) 
               br.PlotColor='blue';
        score=score+1 ;
        visited_sequence(3)=score;
        visited(3)=1;
         else
           revisit=revisit+1;  
         end
     end
     
     if(  sum(abs(v1.Position-bl.Position))==0 )
         if( visited(4)==0 || is_plain==1) 
               bl.PlotColor='blue';
        score=score+1;
        visited_sequence(4)=score;
        visited(4)=1;
         else
              revisit=revisit+1;  
         end
     end
   updatePlots(scenario);
   ifchange=0;
   step=0;
   
end

end

end
X = ['Score = ',num2str(score)];
disp(X)
sequence = ['Sequence = ',num2str(visited_sequence)];
disp(sequence)
nomoves = ['no. of moves = ',num2str(no_of_moves)];
disp(nomoves)