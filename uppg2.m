%uppgift 2

Text = load('Skulptur.txt');

%laddar in kolonnerna i vardera variabel
x = Text(:,1);
f1 = Text(:,2);
f2 = Text(:,3);

%gränser
a = -5;
b = 5;

%angivna i uppg.
k = 98/2847;
m = 7/25021;

%täljare, nämnare i integrand
numerator = x.*(f1-f2);
denominator = (f1-f2);

%täljare, nämnare i integrand fast med N/2 intervall
n = length(x);
num_halv = x(1:2:n).*(f1(1:2:n) - f2(1:2:n));
den_halv = (f1(1:2:n) - f2(1:2:n));

%trapetsmetoden för både N och N/2 intervall
TN = trapz(x, numerator);
DN = trapz(x, denominator);
TN_halv = trapz(x(1:2:n), num_halv);
DN_halv = trapz(x(1:2:n), den_halv);

%tredjedelsregeln för täljare resp. nämnare
delta_T = 1/3.*(TN-TN_halv)
delta_N = 1/3.*(DN-DN_halv)

%totala trunkeringsfelet
delta_xp = k.*delta_T + m.*delta_N


result_integral = TN/DN

