% Algorytm ewolucji ró¿nicowej (*differential evolution*)
% – zadanie minimalizacji funkcji wielu zmiennych
function [ fitness ] = de () 
clear all;
close all;

global F Cr NP D bounds;

GEN = 200;      % liczba pokoleñ
NP = 30;        % liczba osobników

F = 0.5;        %
Cr = 0.8;       %

funNum = 5;                % numer optymalizowanej funkcji
f = @(x)fun(x, funNum);    % function handle do wybranej funkcji

[bounds, D] = getGlobals('fun.m', funNum);


% inicjalizacja i ewaluacja populacji pocz¹tkowej
% + zapamiêtanie najlepszego odobnika bestInd

lambda = [0.2 0.5 0.7 1];
color = [ 'b', 'g', 'r', 'y'];

for s = 1 : 4
bestInd = struct('x',[],'fitness',inf);

Pop(NP) = struct('x',[],'fitness',0);


bestAcrossGenerations = zeros([GEN 1]);

for i = 1 : NP
	
	Individual.x = randval(bounds(1), bounds(2), D);
    Individual.fitness = f(Individual.x);
    if(Individual.fitness < bestInd.fitness)
        bestInd = Individual;
    end
    
    Pop(i) = Individual;
    
end



% ewolucja
for g = 1 : GEN
    
    for i = 1 : NP
	
        newInd = DErand1(Pop, i, lambda(s));
        %newInd = DErand2(Pop, i);
        %newInd = DEbest1(Pop, i, bestInd);
        %newInd = DEbest2(Pop, i, bestInd);
        %newInd = DErandToBest(Pop, i, bestInd, lambda(s));
        
        % ewaluacja nowo utworzonego osobnika
        newInd.fitness = f(newInd.x);
        
        % selekcja
        if(newInd.fitness <= Pop(i).fitness)
            Pop(i) = newInd;
        end
        
        % uaktualnienie osobnika bestInd
        if(Pop(i).fitness <= bestInd.fitness)
            bestInd = Pop(i);
        end
        
    end
    
    bestAcrossGenerations(g) = bestInd.fitness;
    
end


% wyœwietlenie najlepszego rozwi¹zania w konsoli
%fitness = bestInd.fitness;
%end
% wykres zmiany przystosowania najlepszego osobnika w funkcji pokoleñ
 figure(1);
 hold on;
 plot([1 : GEN], bestAcrossGenerations, color(s));
 xlabel('NP');
 ylabel('Fitness');
end
legend('Lambda = 0.2', 'Lambda = 0.5', 'Lambda = 0.7', 'Lambda = 1');
title('DErand1/Matyas/Lambda');
hold off;