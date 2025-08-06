function[E] = E_computation(Abase, Atarget, wc)
% [E] = E_computation(Abase, Atarget, wc)
% E_computation computes effort based on Abase, Atarget and wc entered in
% inputs.
%
% INPUTS
% Abase: numeric value or vector of arousal at baseline
%
% Atarget: numeric value or vector of target arousal to reach
%
% wc: numeric value or vector indicating work capacity
%
% OUTPUTS
% E: numeric value of effort
% 

%% check inputs and define default values
% default wc
if ~exist('wc','var') || isempty(wc)
    wc = 1;
end

%% compute E
E = abs(Atarget - Abase)./wc;

end % function