% Process model instantiation

s=tf('s');

Kp = -0.19411;
Tw = 7.0698;
Zeta = 0.33669;
Td = 21.131;

G_p2du = Kp / (1 + 2*Zeta*Tw*s + (Tw*s)^2) * exp(-Td*s)

[mag,ph,wout] = bode(G_p2du);
freq = wout/2/pi*1e8;
subplot(2,1,1)
loglog(freq,squeeze(mag))
subplot(2,1,2)
semilogx(freq,squeeze(ph))
