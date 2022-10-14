%Régulation de Température d'un procédé Thermique

%Caractéristique statique du système pour une vitesse du ventilateur de 6V

V0_vent = 6;
Uo_vent = 5;
Yo_vent = 3.2;

%Fonction de Transfert
ts = 2;
s = tf('s');
z = tf('z', ts);
k1 = 0.6;
k2 = -0.25;
tau = 5;

H = 1/(1+tau*s)^2

%Compensation Pôles/Zéros:  dans ce méthode il faut égaliser le numérateur du correcteur avec le dénominateur de la fonction de transfert. On trouve: 
Ti = 2*tau;
Td = (tau^2)/Ti;
%Donc sans tenir compte de la perturbation, on peut trouve comme Boucle Fermé:

%Nous savons aussi qui le temp désiré est tdes = 3*tau, et tau = Ti/(kp*ki), donc:
kp = 4;
alfa = 100*Td
C = kp*( 1 + 1/(Ti*s) + (Td*s)/(1+(Td/alfa)*s) )

Discretization 
H2 = 1/(1+tau*s)^2
H1 = tf([1], [tau^2 2*tau 1])
Hd = c2d(H1,ts,'zoh')

%G = ((1 - exp(-ts*(1/tau))*(1 + ts*(1/tau)))*z + exp(-ts*(1/tau))*(ts*(1/tau) - 1 + exp(-ts*(1/tau))))/(z - exp(-ts*(1/tau)))^2
%Hpiv = tf(Kpv) + tf(Kiv, [1 0]);