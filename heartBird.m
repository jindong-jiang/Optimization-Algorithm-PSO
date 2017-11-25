classdef heartBird
    properties(SetAccess=private)
    pg;
    pgVal;
    end
    
    methods
        function BH=heartBird()
            BH.pg=rand(2,1);
            BH.pgVal=10000;
        end
         function note(BH,PTCL)
             if  PTCL.fval<BH.pgVal
              BH.pg=PTCL.pi
              BH.pgVal=PTCL.fval
             end
         end
   % end
    
   % methods(Static)       
        function MntrThs(BH,PTCL)
            addlistener(PTCL, 'PiComparePg',@(src,evnt)BH.note(src));
        end
    end
end