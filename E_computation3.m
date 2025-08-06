function[E] = E_computation3(Abase, Atarget, wc_increase, wc_decrease)
% [E] = E_computation3(Abase, Atarget, wc_increase, wc_decrease)
% variant of E_computation which considers that effort scales differently
% when arousal needs to increase or when it needs to decrease.
%
% INPUTS
% Abase: numeric value or vector of arousal at baseline
%
% Atarget: numeric value or vector of target arousal to reach
%
% wc_increase: numeric value or vector indicating work capacity to increase
% arousal
%
% wc_decrease: numeric value or vector indicating work capacity to decrease
% arousal
%
% OUTPUTS
% E: numeric value of effort
% 

%% check inputs and define default values
% default wc
if ~exist('wc_increase','var') || isempty(wc_increase)
    wc_increase = 1;
end

%% compute E depending on whether arousal has to increase or decrease
if Atarget > Abase % increase in arousal
    E = (Atarget - Abase)./wc_increase;
else % decrease in arousal
    E = (Abase - Atarget)./wc_decrease;
end

end % function