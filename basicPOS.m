function [pg, pgVal] = basicPOS( func,D )
%[pg, pgVal] = basicPOS( func,D )
% func :  a string which is the name of fitness function
% D    :  the dimention of the fitness function
% pg   :  the best  point where fitness funtion gains its smallest value
% pgVal:  the smallest value of the function
 assignin('base','D',D);%assign the parameter to the  base workspace
 assignin('base','func',func);
 evalin('base','psoJJD')%run the pso kurnel in base work space because some subrutine uses use base
 pg=evalin('base','pg');%get the pg and pgVal from base
 pgVal=evalin('base','pgVal');
 %return% return the pg and pgVal now,
 %clear% the clear will clean pg and pgVal which makes it not able to return the val
 evalin('base','clear')% so use evalin to clear the memory in base
end

