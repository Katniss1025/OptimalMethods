% X = G';
% n = 11;
X = history2.x; % to do
n = 9; % to do
X_after = strings(n,1);
for i = 1:n
    s1 = num2str(X(i,1));
    s2 = num2str(X(i,2));
    X_after(i) =  "(" + s1 + "," + s2 + ")";
end
