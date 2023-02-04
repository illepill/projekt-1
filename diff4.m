function d4=diff4(f,h)

% Written by Ken Mattsson 
% Course: Introduction to scientific computing 2023
%
% z=diff4(f,h)
% computes a second order accurate approximation of the 
% fourth derivative of f (here a vector)
%
% h : Specifies the grid spacing 
% (here assumed to be constant)
%  
% f : Specifies the function values.
% (here assumed equidistant with grid-spacing h)
% 
% For example: 
% xx=linspace(0,2,41); h=xx(2)-xx(1);
% ff=(0.5-xx).^2.*cos(pi*xx);
% dfd4=diff4(ff,h);
% 
% dfd4 is now a vector (same length as ff) 
% that approximates the 4th derivative of the funktion 
% f=(0.5-x)^2*cos(pi*x),
% in the intervall between x=0 and x=2. 
% To improve the aacuracy reduce grid-spacing (h).
%
% To find the largest absolute value of dfd4:
% [max_dfd4 pos]=max(abs(dfd4));
% xx(pos) is the x-value with largest (absolute value) 
% of the 4th derivative given by the value max_dfd4

n=length(f);
assert(n >= 6,'Not enough points (need at least 6)'); 
  h4=h^4;
  d4(1)=(3*f(1)-14*f(2)+26*f(3)-24*f(4)+11*f(5)-2*f(6))/h4;
  d4(2)=(2*f(1)-9*f(2)+16*f(3)-14*f(4)+6*f(5)-f(6))/h4;
  d4(3:n-2)=(f(5:n)-4*f(4:n-1)+6*f(3:n-2)-4*f(2:n-3)+f(1:n-4))/h4;
  d4(n-1)=(2*f(n)-9*f(n-1)+16*f(n-2)-14*f(n-3)+6*f(n-4)-f(n-5))/h4;
  d4(n)=(3*f(n)-14*f(n-1)+26*f(n-2)-24*f(n-3)+11*f(n-4)-2*f(n-5))/h4;
end
  
  
