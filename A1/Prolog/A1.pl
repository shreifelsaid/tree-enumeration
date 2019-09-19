% CSC254 Fall2019 HomeworkA1
% Meiwen Zhou, Shreif Abdallah 
% NetID mzhou26, selsaid
% Thanks to hint provided by Louis Jenkin on Piazza 

% Base case tree(0) = ''
treeVal(0,'').

% Main function which reads number of nodes (N) and return a list of strings (T)
treeVal(N,T):-
    
    % Outer loop 0..N-1, functions as the outer loop that loops
    M is N-1,
    between(0,M,X),

    % Recurssively call treeVal function which generates left subtree with I nodes
    I is X,
    treeVal(I,LT),

    % Recurssively call treeVal function which generates right subtree with J nodes 
    J is N-I-1,
    treeVal(J,RT),

    % combine left-child subtree with right-child subtree in this order: T = ( T1 . T2 )
    atom_concat('(',LT,A),
    atom_concat(A,'.',B),
    atom_concat(B,RT,C),
    atom_concat(C,')',T).
