P = 40;
D = 7;
dutyCicle = 42.5;
w0 = 2 * pi / P;
N = 50;
pas = P / 100;  
t = -2 * P : pas : 2 * P;


coeficienti = zeros(1,N); % vector de coeficineti SFC
A = zeros(1,N); % vector de coeficienti SFA

Semnal_Dreptunghiular = square( w0 * t, dutyCicle); % aici se implementeaza semnalul initial care e cel ideal

Semnal_Initial = @(t,k) square( w0 * t, dutyCicle).*exp( -1j * k * w0 * t); % semnal inifial descompus in SFC
Semnal_Reconstruit = 0;

componenta_continua = (1 / P) * integral(@(t) Semnal_Initial(t,0),0,P); % se implementeaza componenta continua a semnalului

for k = 1:1:50
    coeficienti(k) = (1 / P) * integral(@(t) Semnal_Initial(t,k - 25 ),0,P);
    Semnal_Reconstruit = Semnal_Reconstruit + coeficienti(k) * exp( 1j * (k - 25) * w0 * t);
end

% se calculeaza coeficientii SFC
% se insumeaza fiecare termen pentru a reface semnalul
A(1) = abs(componenta_continua);

for k = 1:N
      A(k+1) = 2 * abs(coeficienti(k)); 
      
      % se calculeaza coeficientii SFA
end

figure(1);
plot(t, Semnal_Reconstruit, t, Semnal_Dreptunghiular);

figure(2);
stem([0:N] * w0, A), title('Spectrul semnalului Dreptunghiular');
% se reprezinta A