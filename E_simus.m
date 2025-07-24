% playing with the theoretical model

%% define max A for all conditions
Amax = 1;
Amin = 0;

%% E1: varying Atarget for different values of Abase
% low baseline
Abase1a = 0.2;
Atarget1a = 0:0.1:1;
[E1a] = E_computation(Abase1a, Atarget1a, Amax, Amin);
% medium baseline
Abase1b = 0.5;
Atarget1b = 0:0.1:1;
[E1b] = E_computation(Abase1b, Atarget1b, Amax, Amin);
% high baseline
Abase1c = 0.8;
Atarget1c = 0:0.1:1;
[E1c] = E_computation(Abase1c, Atarget1c, Amax, Amin);

% 3 colours for gradient
col1a = [231 225 239]./255;
col1b = [201 148 199]./255;
col1c = [221 28 119]./255;

%% E2: varying A baseline for different values of Atarget
% low target
Abase2a = 0:0.1:1;
Atarget2a = 0.2;
[E2a] = E_computation(Abase2a, Atarget2a, Amax, Amin);
% medium target
Abase2b = 0:0.1:1;
Atarget2b = 0.5;
[E2b] = E_computation(Abase2b, Atarget2b, Amax, Amin);
% high target
Abase2c = 0:0.1:1;
Atarget2c = 0.8;
[E2c] = E_computation(Abase2c, Atarget2c, Amax, Amin);

% 3 colours for gradient
col2a = [255 247 188]./255;
col2b = [254 196 79]./255;
col2c = [217 95 14]./255;

%% display figure
fig;

% graph for varying Atarget for a given Abaseline
subplot(1,2,1); hold on;
E1a_hdl = plot(Atarget1a, E1a);
E1b_hdl = plot(Atarget1b, E1b);
E1c_hdl = plot(Atarget1c, E1c);
fit_hdl_upgrade(E1a_hdl,col1a);
fit_hdl_upgrade(E1b_hdl,col1b);
fit_hdl_upgrade(E1c_hdl,col1c);
line([0 Amax],[0 0],'LineWidth',1,'Color','k','LineStyle','-'); % add E=0
% add threshold for each baseline
line([Abase1a, Abase1a],ylim(),'LineWidth',1','Color',col1a,'LineStyle','--');
line([Abase1b, Abase1b],ylim(),'LineWidth',1','Color',col1b,'LineStyle','--');
line([Abase1c, Abase1c],ylim(),'LineWidth',1','Color',col1c,'LineStyle','--');
xlabel('A target');
ylabel('E');
legend([E1a_hdl,E1b_hdl,E1c_hdl],...
    {['A baseline = ',num2str(Abase1a)],...
    ['A baseline = ',num2str(Abase1b)],...
    ['A baseline = ',num2str(Abase1c)]},...
    'Location','NorthWest');

% graph for varying Abaseline for a given Atarget
subplot(1,2,2); hold on;
E2a_hdl = plot(Abase2a, E2a);
E2b_hdl = plot(Abase2b, E2b);
E2c_hdl = plot(Abase2c, E2c);
fit_hdl_upgrade(E2a_hdl,col2a);
fit_hdl_upgrade(E2b_hdl,col2b);
fit_hdl_upgrade(E2c_hdl,col2c);
line([0 Amax],[0 0],'LineWidth',1,'Color','k','LineStyle','-'); % add E=0
% add threshold for each target
line([Atarget2a, Atarget2a],ylim(),'LineWidth',1','Color',col2a,'LineStyle','--');
line([Atarget2b, Atarget2b],ylim(),'LineWidth',1','Color',col2b,'LineStyle','--');
line([Atarget2c, Atarget2c],ylim(),'LineWidth',1','Color',col2c,'LineStyle','--');
xlabel('A baseline');
ylabel('E');
legend([E2a_hdl,E2b_hdl,E2c_hdl],...
    {['A target = ',num2str(Atarget2a)],...
    ['A target = ',num2str(Atarget2b)],...
    ['A target = ',num2str(Atarget2c)]},...
    'Location','northeast');