function[E] = E_computation(Abase, Atarget, Amax, Amin)
% [E] = E_computation(Abase, Atarget, Amax, Amin)
%
% INPUTS
% Abase: numeric value or vector of A at baseline
%
% Atarget: numeric value or vector of target A to reach
%
% Amax: numeric value or vector of maximal A that one can attain (by
% default it will be set up to 1)
%
% Amin: numeric value or vector of minimal A that one can attain (by
% default it will be set up to 0, but this doesn't make sense in real
% conditions)
%
% OUTPUTS
% E: numeric value of E
% 

%% check inputs and define default values
% Amax
if ~exist('Amax','var') || isempty(Amax)
    Amax = 1;
end

% Amin
if ~exist('Amin','var') || isempty(Amin)
    Amin = 0;
end

%% compute inputs for E
Aincrease = Atarget > Abase; % increase in arousal
Adecrease = Atarget <= Abase; % decrease in arousal

Wtarget = abs(Atarget - Abase); % distance between Atarget and Abase
Wmax = (Amax - Abase).*Aincrease + (Abase - Amin).*Adecrease; % max possible work = increasing A to Amax (if arousal increase) or decreasing A to Amin (if arousal decrease)

%% compute E
E = Wtarget./Wmax;

% %% constraint E to be positive
% E(E < 0) = 0;

end % function