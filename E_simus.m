% playing with the theoretical model of E_computation2.m

%% define default work capacity
wc = 1;

%% E1: varying Atarget for different values of Abase
% vary Atarget
Atarget1 = 0:0.1:1;

% low baseline
Abase1a = 0.2;
[E1a] = E_computation(Abase1a, Atarget1, wc);
% medium baseline
Abase1b = 0.5;
[E1b] = E_computation(Abase1b, Atarget1, wc);
% high baseline
Abase1c = 0.8;
[E1c] = E_computation(Abase1c, Atarget1, wc);

% 3 colours for gradient
col1a = [231 225 239]./255;
col1b = [201 148 199]./255;
col1c = [221 28 119]./255;

%% E2: varying A baseline for different values of Atarget
% vary Abase
Abase2 = 0:0.1:1;

% low target
Atarget2a = 0.2;
[E2a] = E_computation(Abase2, Atarget2a, wc);
% medium target
Atarget2b = 0.5;
[E2b] = E_computation(Abase2, Atarget2b, wc);
% high target
Atarget2c = 0.8;
[E2c] = E_computation(Abase2, Atarget2c, wc);

% 3 colours for gradient
col2a = [255 247 188]./255;
col2b = [254 196 79]./255;
col2c = [217 95 14]./255;

%% E3: varying wc for different values of Atarget and Abase
% vary work capacity
wc3 = 0.1:0.1:1.5;

% need to increase arousal (delta 0.2)
Abase3a = 0.4;
Atarget3a = 0.6;
[E3a] = E_computation(Abase3a, Atarget3a, wc3);

% need to increase arousal (delta 0.4)
Abase3b = 0.2;
Atarget3b = 0.6;
[E3b] = E_computation(Abase3b, Atarget3b, wc3);

% need to increase arousal (delta 0.6)
Abase3c = 0.2;
Atarget3c = 0.8;
[E3c] = E_computation(Abase3c, Atarget3c, wc3);

% 3 colours for gradient
col3a = [224 243 219]./255;
col3b = [168 221 181]./255;
col3c = [67 162 202]./255;

%% display corresponding figures
fig;

% graph for varying Atarget for a given Abaseline
subplot(1,3,1); hold on;
E1a_hdl = plot(Atarget1, E1a);
E1b_hdl = plot(Atarget1, E1b);
E1c_hdl = plot(Atarget1, E1c);
fit_hdl_upgrade(E1a_hdl,col1a);
fit_hdl_upgrade(E1b_hdl,col1b);
fit_hdl_upgrade(E1c_hdl,col1c);
line([0 1],[0 0],'LineWidth',1,'Color','k','LineStyle','-'); % add E=0
% add threshold for each baseline
line([Abase1a, Abase1a],ylim(),'LineWidth',1','Color',col1a,'LineStyle','--');
line([Abase1b, Abase1b],ylim(),'LineWidth',1','Color',col1b,'LineStyle','--');
line([Abase1c, Abase1c],ylim(),'LineWidth',1','Color',col1c,'LineStyle','--');
xlabel('A target');
ylabel('Effort');
legend([E1a_hdl,E1b_hdl,E1c_hdl],...
    {['A_b_a_s_e_l_i_n_e = ',num2str(Abase1a)],...
    ['A_b_a_s_e_l_i_n_e = ',num2str(Abase1b)],...
    ['A_b_a_s_e_l_i_n_e = ',num2str(Abase1c)]},...
    'Location','NorthWest','FontSize',18);

% graph for varying Abaseline for a given Atarget
subplot(1,3,2); hold on;
E2a_hdl = plot(Abase2, E2a);
E2b_hdl = plot(Abase2, E2b);
E2c_hdl = plot(Abase2, E2c);
fit_hdl_upgrade(E2a_hdl,col2a);
fit_hdl_upgrade(E2b_hdl,col2b);
fit_hdl_upgrade(E2c_hdl,col2c);
line([0 1],[0 0],'LineWidth',1,'Color','k','LineStyle','-'); % add E=0
% add threshold for each target
line([Atarget2a, Atarget2a],ylim(),'LineWidth',1','Color',col2a,'LineStyle','--');
line([Atarget2b, Atarget2b],ylim(),'LineWidth',1','Color',col2b,'LineStyle','--');
line([Atarget2c, Atarget2c],ylim(),'LineWidth',1','Color',col2c,'LineStyle','--');
xlabel('A baseline');
ylabel('Effort');
legend([E2a_hdl,E2b_hdl,E2c_hdl],...
    {['A_t_a_r_g_e_t = ',num2str(Atarget2a)],...
    ['A_t_a_r_g_e_t = ',num2str(Atarget2b)],...
    ['A_t_a_r_g_e_t = ',num2str(Atarget2c)]},...
    'Location','northeast','FontSize',18);

% graph for varying wc for a given Atarget and Abase
subplot(1,3,3); hold on;
E3a_hdl = plot(wc3, E3a);
E3b_hdl = plot(wc3, E3b);
E3c_hdl = plot(wc3, E3c);
fit_hdl_upgrade(E3a_hdl,col3a);
fit_hdl_upgrade(E3b_hdl,col3b);
fit_hdl_upgrade(E3c_hdl,col3c);
line([0 max(wc3)],[0 0],'LineWidth',1,'Color','k','LineStyle','-'); % add E=0
xlabel('wc');
ylabel('Effort');
legend([E3a_hdl,E3b_hdl,E3c_hdl],...
    {['A_t_a_r_g_e_t-A_b_a_s_e = ',num2str(Atarget3a),'-',num2str(Abase3a),' = ',num2str(Atarget3a-Abase3a)],...
    ['A_t_a_r_g_e_t-A_b_a_s_e = ',num2str(Atarget3b),'-',num2str(Abase3b),' = ',num2str(Atarget3b-Abase3b)],...
    ['A_t_a_r_g_e_t-A_b_a_s_e = ',num2str(Atarget3c),'-',num2str(Abase3c),' = ',num2str(Atarget3c-Abase3c)]},...
    'Location','northeast','FontSize',18);
