close all;clear all; 
 
disp('********************************************************'); 
disp('***********���������������϶פ���������***********'); 
disp('********************************************************'); 
 
f=input('��������Ƶ��(GHz):f='); 
er=input('�����ڽ�����Խ�糣����er='); 
lambda=300/f/sqrt(er);%������mm 
k=2*pi/lambda; 
a=input('������߳ߴ�(mm)��a='); 
b=input('����խ�߳ߴ�(mm)��b='); 
lambda_g=lambda/sqrt(1-(lambda/(2*a))^2);%�������� 
nn=input('�������϶��Ԫ��Ŀ��'); 
 
disp('�����뵥Ԫ�������ʷֲ����ͣ�'); 
disp('1.���ʵȷ�������2.�������ʷֲ�����.'); 
amp_type=input('');%�������ʷֲ����� 
 
% aa �ʹ����˹��� 
switch amp_type  %���ʷֲ����� 
    case 1 %�ȷ����� 
        aa=ones(1,nn); 
    case 2 %�����ֲ� 
        for n=1:nn 
            fprintf('������� %d ����Ԫ����Ĺ��ʣ�',n); 
            aa(n)=input(''); 
        end 
    otherwise 
        disp('WRONG SELECTION!!!'); 
        %break;  
end 
 
K=1/sum(aa); 
g=K.*aa;%ÿ����϶�ĵ絼 
g0=2.09*a*lambda_g/b/lambda*(cos(lambda*pi/2/lambda_g))^2; 
%DnΪÿ����϶�������ĵľ��� 
D=asin(sqrt(g./g0))*a/pi; 
 
ls=lambda_g/2; 
l1=lambda_g/4;%������϶����·���ĩ�˷�����Ϊlambda_g/4���ѷ�����λ��פ����ѹ�Ĳ���� 
l0=lambda/2; 
fprintf('��϶����(���ʲ������ʱ����ֵ��С��Ӧ����������ɿռ䲨�� %4.2fmm)��l0= %4.2fmm\n',300/f/2,l0); 
fprintf('��϶��ࣺls= %4.2fmm\n',ls); 
fprintf('���һ����϶���ľ��ն˶�·��ࣺl1= %4.2fmm\n',l1); 
 
for n=1:nn 
    fprintf('�� %d ����϶�����ļ�ࣺD(%d)=%4.3fmm\n',n,n,(-1)^(n+1)*D(n)); 
end 
 
fprintf('��϶���ȡΪlambda/40--lambda/20��%4.3fmm ---%4.3fmm\n',lambda/40,lambda/20); 
disp('���ڲ����ں�ʱ�������lambda_g���쳤�ͷ�϶�����ľ���'); 
 
bandwidth=0.5/nn;%�Բ���г������˵��פ��С��2�Ĺ�������ֻ�У�50%/nn 
fprintf('�ò���г����פ��С��2����Դ���Ϊ��%4.2f %%\n',bandwidth*100); 