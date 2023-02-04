%uppgift 1

% gränser
a = -5;
b = 5;

x = linspace(a, b, 200);
h = x(2) - x(1);

%täljare och nämnare i integrand
numerator = x.*(f_1(x) - f_2(x));
denominator = f_1(x) - f_2(x);

%plot a fjärdederivator
plot(diff4(numerator,h));
hold on;
plot(diff4(denominator,h));

d4num = diff4(numerator,h);
d4den = diff4(denominator,h);

%maximering av derivator (absolutvärden)
max_num = max(abs(d4num));
max_den = max(abs(d4den));

%angivna i uppg.
xp = 0.5*10^(-3);
k = 98/2847;
m = 7/25021;

%beräkningar av h_max
h_num = ((180.*xp/2.*1/k)/((b-a).*max_num))^(1/4);
h_den = ((180.*xp/2.*1/m)/((b-a).*max_den))^(1/4);

%beräkningar av N_min
N_num = ceil((b-a)/h_num);
N_den = ceil((b-a)/h_den);

%if-satser som kontrollerar att N är jämna tal
if rem(N_num,2) ~= 0
    N_num = N_num + 1;
end

if rem(N_den,2) ~= 0
    N_den = N_den + 1;
end

%def av linspaces för N, N/2 resp. 2N intervall
xx1 = linspace(a, b, N_num);
xx2 = linspace(a, b, N_den);
xx1halv = linspace(a, b, N_num/2);
xx2halv = linspace(a, b, N_den/2);
xx1dubbel = linspace(a, b, 2.*N_num);
xx2dubbel = linspace(a, b, 2.*N_den);

%trapetsmetoden för täljare resp. nämnare med N, N/2 och 2N
TN = trapz(xx1, Numerator(xx1));
TD = trapz(xx2, Denominator(xx2));
TNhalv = trapz(xx1halv, Numerator(xx1halv));
TDhalv = trapz(xx2halv, Denominator(xx2halv));
TNdubbel = trapz(xx1dubbel, Numerator(xx1dubbel));
TDdubbel = trapz(xx2dubbel, Denominator(xx2dubbel));


%integralen i täljare och nämnare
integral_numerator = TN + (TN-TNhalv)/3;
integral_denominator = TD + (TD-TDhalv)/3;

%integralen i täljare och nämnare för dubbla intervallen
int_num_double = TNdubbel + (TNdubbel-TN)/3;
int_den_double = TDdubbel + (TDdubbel-TD)/3;

%resultaten
resultat_simpson = integral_numerator/integral_denominator;
resultat_simpson_double = int_num_double/int_den_double;
resultat_real = integral(@Numerator,a,b)/integral(@Denominator,a,b);

%trunkeringsfel för N
trunk_T = k.*(b-a)/180.*((b-a)/(N_num))^4.*max_num;
trunk_N = m.*(b-a)/180.*((b-a)/(N_den))^4.*max_den;
trunk_tot = trunk_T + trunk_N

%trunkeringsfel 2N
dubtrunk_T = k.*(b-a)/180.*((b-a)/(2.*N_num))^4.*max_num;
dubtrunk_N = m.*(b-a)/180.*((b-a)/(2.*N_den))^4.*max_den;
dubtrunk_tot = dubtrunk_T + dubtrunk_N

%noggrannhetsordningen p
p = log2(trunk_tot/dubtrunk_tot)
