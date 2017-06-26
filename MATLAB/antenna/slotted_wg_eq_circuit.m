%% waveguide slot equvalient circuit
% Leon yangli0534@yahoo.com
clc;
clear all;
close all;
format long;
%% constants
N = 18; %slot numbers
SLL = -35; % sidelobe level
u0 = 4*pi*1e-7;% permeability
e0 = 8.854187817e-12;% permittivity in free space
c = 1/sqrt(u0*e0);% light velocity in free space
%% parameters
f0 = 35e9;% frequency
l = c/f0*1e3; % lambda in free space
% a = 247.65; % width length in mm
% b = a/2 ;% height length in mm
%WR-284
% a = 20;
% b = 10;
 a = 5.69;
 b = 2.845;
%a = 7.112 ; %waveguide width
%b = 3.556 ; % waveguide height

t = 1 ;% thickness in mm
w = a*0.0625/0.9 ;% width of the slot in mm l/200 < w < l/10
lc = 2*a ; % cutoff lambda
lg = l/sqrt(1-(l/lc)^2); % waveguide wavelength

G_2_slot=1.0/N;
New_G1=2.09*(lg/l)*(a/b)*(cos(0.464*pi*l/lg)-cos(0.464*pi))^2;
New_Y=G_2_slot/New_G1;
Soff=(a/pi)*sqrt(abs(asin(New_Y)));% offset distance

Slot_wl=0.210324*G_2_slot^4-0.338065*G_2_slot^3+0.12712*G_2_slot^2+0.034433*G_2_slot+0.48253;
l_slot=l*Slot_wl;%slot length
w_slot=a*0.0625/0.9;%slot width
s_slot=lg/2 ; % space betwenn slots


d = linspace(0,a/2,1000)+1e-10;
%% stevenson ���õ�Ч���������ۺ͸��ֺ������Ƶ��˹�һ���絼
g = 2.09*a*lg/b/l*power(cos(pi/2*l/lg),2)*power(sin(pi/a*d),2);

%% H.Y.Yee���㷽�������г�񳤶���ƫ�ƾ���仯������
beta = 2*pi/lg; % TE10ģ�������� 
Y0 = beta/f0/2/pi/u0;%������������
%���Ƿ�϶Ӱ�죬�ѷ�϶����һ�η�֧����



% figure(1);
% plot(d,g,'k');
% grid on;
% grid minor;
% title('����ݷ�Ĺ�һ��г��絼��ƫ�����ı仯 ');
% xlabel('ƫ�þ���:mm');
% ylabel('��һ���絼')
% 



[BeamWidth, D, I]= dolph_chebyshev(N,SLL,0);
figure;
subplot(221);
plot(I,'-o');

title('Dolph-Chebyshev �ۺ�');
hold on;
[af,bw,gain] = radiation_pattern(I);
len = length(af);
angle = linspace(-90,90,len);
subplot(222);
plot(angle,af);
ylim([-60 0]);
grid on;
title('����ͼ')
text(20,5,bw);
g = I.^2/sum(I.^2);
g = I/sum(I);
% 
%figure;
subplot(223)
plot(g,'k*');
title('��Ч�絼')
hold on;
% % g = a/b*2.09*lg/l*power(cos(pi*l/lg/2),2)*power(sin(pi*x/a),2)
 x = a/pi*asin(sqrt(g/(2.09*a/b*lg/l*power(cos(pi/2*l/lg),2))));
%figure;
subplot(224)
plot(x,'r*');
title('��϶ƫ��')

%%
%Taylor one parameter
I= taylor_one_para(N,SLL);
figure;
subplot(221);
plot(I,'-o');

title('taylor�������ۺ�');
hold on;
[af,bw,gain] =  radiation_pattern(I);
len = length(af);
angle = linspace(-90,90,len);
subplot(222);
plot(angle,af);
ylim([-60 0]);
grid on;
title('����ͼ')
text(20,5,bw);
g = I.^2/sum(I.^2);
g = I/sum(I);
% 
%figure;
subplot(223)
plot(g,'k*');
title('��Ч�絼')
hold on;
% % g = a/b*2.09*lg/l*power(cos(pi*l/lg/2),2)*power(sin(pi*x/a),2)
 x = a/pi*asin(sqrt(g/(2.09*a/b*lg/l*power(cos(pi/2*l/lg),2))));
%figure;
subplot(224)
plot(x,'r*');
title('��϶ƫ��')

%%
%taylor line source
I= taylor_line(N,SLL);
figure;
subplot(221);
plot(I,'-o');

title('taylor��Դ�ۺ�');
hold on;
[af,bw,gain] =  radiation_pattern(I);
len = length(af);
angle = linspace(-90,90,len);
subplot(222);
plot(angle,af);
ylim([-60 0]);
grid on;
title('����ͼ')
text(20,5,bw);
g = I.^2/sum(I.^2);
g = I/sum(I);
% 
%figure;
subplot(223)
plot(g,'k*');
title('��Ч�絼')
hold on;
% % g = a/b*2.09*lg/l*power(cos(pi*l/lg/2),2)*power(sin(pi*x/a),2)
 x = a/pi*asin(sqrt(g/(2.09*a/b*lg/l*power(cos(pi/2*l/lg),2))));
%figure;
subplot(224)
plot(x,'r*');
title('��϶ƫ��')