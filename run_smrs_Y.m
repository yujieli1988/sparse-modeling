clear all;
load Ymul.mat
%Ynon=Ynon(:,1:11370);
alpha = 2;
r = 30;
verbose = true;
[ind, C] = smrs(Ymul, alpha, r, verbose);

%%

 save ('ind.mat','ind');