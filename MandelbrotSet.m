% MANDELBROT SET
%conto il tempo che il programma impiega
tic
clc
clear
close all

%imposto i parametri iniziali
precisione=0.001; xa=-1.5; xb=.5; ya=-1; yb=1;
k=1; j=1; p=1;
%inizializzo matrici vuore
mat=zeros((length(xa:precisione:xb)+3), (length(ya:precisione:yb))+3);

for re=xa:precisione:xb
    j=1;
    for im=ya:precisione:yb
        c=re+1i*im;
        z(1)=0;
        
        for n=1:40
            z(n+1)=(z(n))^2+c;
        end
        if any(abs(z>2))==1
            zz=0;
            n=0;
            while abs(zz)<1000
                zz=zz^2+c;
                n=n+1;
            end
            mat(j,p)=n;
            
        end
        j=j+1;
    end
    p=p+1;
end

%plotto il risultato
mat=mat*10;
figure
imagesc(mat)
title('Mandelbrot set')
xlabel('Re')
ylabel('Im')
toc