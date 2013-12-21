function [Individual] = DErandToBest(Pop, j, bestInd, lambda)

global F Cr NP bounds D;


% 1. wylosowanie osobnik�w do mutacji; r1, r2, r3 oznaczaj� indeksy osobnik�w w Pop
r1 = randi([1 NP]);
r2 = randi([1 NP]);

while( r1 == r2 || r1 == j || r2 == j)
    r1 = randi([1 NP]);
    r2 = randi([1 NP]);
end

% 2. utworzenie wektora v (�mutacja�)
v = zeros([1 D]);
for i = 1 : D
    v(i) = lambda * Pop(j).x(i) + F * ( bestInd.x(i) - Pop(j).x(i))  + F * (Pop(r1).x(i) - Pop(r2).x(i));
end


% 3. utworzenie wektora u (krzy�owanie)
j_rand = randi([1 D]);
u = v;
for w = 1 : D
    if(j_rand <= Cr || w == j_rand)
        u(w) = v(w);
    else
        u(w) = Pop(j).x(w);
    end
end

% 4. sprawdzenie, czy wsp�rz�ne osobnika po krzy�owaniu mieszcz� si� 
% 		w zadanym przedziale
u = checkBounds(u);



Individual.x = u;


