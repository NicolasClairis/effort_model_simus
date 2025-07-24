function[E] = E_computation(Abase, Atarget, Amax)
% [E] = E_computation(Abase, Atarget, Amax)
%
% INPUTS
% Abase: numeric value or vector of A at baseline
%
% Atarget: numeric value or vector of target A to reach
%
% Amax: numeric value or vector of maximal A that one can attain
%
% OUTPUTS
% E: numeric value of E
% 

%% compute inputs for E
Wtarget = abs(Atarget - Abase); % if you consider that lowering A is also a process requiring E
% Wtarget = Atarget - Abase;
Wcapacity = Amax - Abase;

%% compute E
E = Wtarget./Wcapacity;

%% constraint E to be positive
E(E < 0) = 0;

end % function