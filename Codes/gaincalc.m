function koef=gaincalc(sys,phasem)

my_desired_frequencies=linspace(1e-08,10,300000);
phasemargin=phasem;
[mag,phase,wout] = bode(sys,my_desired_frequencies);

for i=1:length(phase(1,1,:))
    phase1d(i)=phase(1,1,i);
    mag1d(i)=mag(1,1,i);
end

magiddb=20.*log10(mag1d);
wdes = interp1(phase1d,wout, (-180+phasemargin));
gaindiff = interp1(wout,magiddb, wdes);
koef=1/(10^(gaindiff/20));



end