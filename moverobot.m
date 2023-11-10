function [ifchange] = moverobot(step,v1)
% move robot

%   The arguments to the function are 
%     step: single step in char
%     v1: robot object 

s_size=10; %step size
ifchange=0;
if (step=='w')
    ifchange=1; 
    v1p=v1.Position;
    if ((v1.Position(1)+s_size) <= 220) 
     v1.Position=v1p+[s_size 0 0];
        
    end
end

if (step=='s')
     ifchange=1;
    v1p=v1.Position;
     if ((v1.Position(1)-s_size) >= 155) 
    v1.Position=v1p+[-s_size 0 0];
   
     end
end
if (step=='a')
    ifchange=1; 
    v1p=v1.Position;
     if ((v1.Position(2)+s_size) <= 230) 
    v1.Position=v1p+[0 s_size 0];
       
     end
end
if (step=='d')
    ifchange=1;
    v1p=v1.Position;
    if ((v1.Position(2)-s_size) >= 165) % 177.5
    v1.Position=v1p+[0 -s_size 0];
        
    end
end


step=0;


end


