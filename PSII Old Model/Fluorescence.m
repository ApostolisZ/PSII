function FvFm = Fluorescence(k,y0)


rng(1)
maxtime = 4999;
[concentrations, reactions] = ConcentrationsandReactions();

tspan = [0,4999];

Sol = ode23s(@(t,y) PSIIODES(t,y,k),tspan,y0);

[h,t] = light_profile(tspan);


% figure 
% subplot(2,3,1)
% hold on
% plot(Sol.x,Sol.y([1,2,4],:));
% % plot(t,h)
% legend('P680','P680*','P680+');
% title('P680');
% 
% 
% hold off
% 
% % figure
% subplot(2,3,2)
% 
% hold on
% plot(Sol.x,Sol.y([3,6],:));
% % plot(t,h)
% legend('Phe','Phe-');
% title('Pheophytin');
% 
% 
% % figure
% subplot(2,3,3)
% 
% hold on
% plot(Sol.x,Sol.y([7,8],:));
% % plot(t,h)
% legend('Q_A','Q_A-');
% title('Q_A');
% 
% % figure
% subplot(2,3,4)
% 
% hold on
% plot(Sol.x,Sol.y([9,10,12,13],:));
% % plot(t,h)
% legend('Q_B','Q_B^-','Q_BH-','QBH_2');
% title('Q_B');
% 
% 
% % figure
% subplot(2,3,5)
% 
% hold on
% plot(Sol.x,Sol.y([32,31],:));
% % plot(t,h)
% legend('PQ','PQH_2');
% title('PQ');
% % figure
% subplot(2,3,6)
% 
% hold on
% plot(Sol.x,Sol.y([21,19],:));
% % plot(t,h)
% legend('PC(Cu^{2+})','PC(Cu^{+})');
% title('Plastocyanin');
% 
% figure 
% subplot(2,3,1)
% 
% hold on 
% 
% plot(Sol.x,Sol.y([33,15,20],:));
% % plot(t,h)
% legend('P700','P700*','P700+');
% title('P700');
% 
% 
% % figure
% subplot(2,3,2)
% 
% hold on
% plot(Sol.x,Sol.y([16,17],:));
% % plot(t,h)
% legend('A_0','A_0^-');
% title('A_0');
% 
% % figure
% subplot(2,3,3)
% 
% hold on
% plot(Sol.x,Sol.y([18,22],:));
% % plot(t,h)
% legend('A_1','A_1^-');
% title('A_0');
% 
% 
% % figure
% subplot(2,3,4)
% 
% hold on
% plot(Sol.x,Sol.y([23,24],:));
% % plot(t,h)
% legend('Fd','Fd^-');
% title('Ferredoxin');
% 
% % figure 
% subplot(2,3,5)
% 
% hold on 
% 
% plot(Sol.x,Sol.y([25,26],:));
% % plot(t,h)
% legend('NADP+','NADPH');
% title('NADPH');
% 
% hold off 
% subplot(2,3,6)
% plot(Sol.x,Sol.y([27,28],:));
% legend('ADP','ATP');
% title('ATP');
% 
% figure
% subplot(2,2,1)
% plot(t,h)
% legend('light profile')
% 
% subplot(2,2,2)
% plot(Sol.x,Sol.y(29,:))
% legend('CO_2')
% 
% subplot(2,2,3)
% plot(Sol.x,Sol.y([11,30],:))
% legend('H^+_{stroma}','H^+_{lumen}')

to = 0:100:maxtime;
tm = 49:100:maxtime;


ys = deval(Sol,0:maxtime);
[sharedVals0,idcs0] = intersect(0:maxtime,to);
[sharedValsm,idcsm] = intersect(0:maxtime,tm);
Fo = k(19)*ys(2,idcs0) + k(19)*ys(35,idcs0);
Fm = k(19)*ys(2,idcsm) + k(19)*ys(35,idcsm);

FvFm = (abs(Fm)-abs(Fo))./abs(Fm);


% figure
% 
% 
% scatter(1:length(FvFm),FvFm)




function [h,t] = light_profile(tspan)
t = tspan(1):tspan(end);
h = zeros(length(t),1);
for i = 1:length(t)
if rem(t(i)/50,2) <1
    h(i) = 1;
else
    h(i) = 0;
end
end
end
end