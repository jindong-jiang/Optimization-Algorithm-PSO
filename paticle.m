classdef paticle   < handle  %without handle, the function in the method cannot get he input argument
    properties(SetAccess=private)
    Xposition
    Velocity
    pi
    fval
    end
    
   % events
   %     PiComparePg
   % end
    
    methods
        function PTCL=paticle(D)
            PTCL.Xposition=rand(D,1);
            PTCL.Velocity=rand(D,1);
            PTCL.pi=PTCL.Xposition;
            PTCL.fval=10000;
           % heartBird.MntrThs(PTCL);
        end
        function update(PTCL,pg)
            w=0.6;c1=0.7;c2=0.5;
            PTCL.Velocity=w*PTCL.Velocity+c1*rand*(PTCL.pi-PTCL.Xposition)+c2*rand*(pg-PTCL.Xposition);
            PTCL.Xposition=PTCL.Xposition+PTCL.Velocity;
            if PTCL.Xposition(1)<-10 || PTCL.Xposition(1)>10||PTCL.Xposition(2)>10||PTCL.Xposition(2)<-10
                PTCL.Velocity=-[1,1]';
            end
%             plot(PTCL.Xposition(1),PTCL.Xposition(2),'*')
%                 drawnow;
%                 hold on
        end
        function updtpi(PTCL,funcname)
            fnc=str2func(funcname);
             ffval=fnc(PTCL.Xposition);
            if ffval<PTCL.fval
                PTCL.pi=PTCL.Xposition;
                PTCL.fval=ffval;
             %   notify(PTCL,'PiComparePg')
                pgVal=evalin('base','pgVal');
                
                if ffval<pgVal
                    assignin('base','pgVal',ffval);
                    assignin('base','pg',PTCL.Xposition);
                    assignin('base','ipsilon',pgVal-ffval);
%                     plot(PTCL.Xposition(1),PTCL.Xposition(2),'*r')
%                     drawnow;
%                     hold on
                end
            end
        end% function
    end%methods
end%classdef