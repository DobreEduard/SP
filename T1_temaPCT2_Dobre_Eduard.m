function[]=T1_temaPCT2_Dobre_Eduard(t,nr)

width = 0.5;


%se inmulteste t cu 1/6 pentru a "lati" semnalul astfel incat panta sa devina +1
%V/s
s=(1+width)*sawtooth(t*2*1/6*pi, width) - width;
figure(nr)
plot(t,s,'-r.'),title('Semnal triunghiular'),xlabel('Timp [s]'),ylabel('A [V]'),grid
end