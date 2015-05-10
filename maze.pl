
mazeSize(5,9).
barrier(1,4).
barrier(1,7).
barrier(2,1).
barrier(2,4).
barrier(2,6).
barrier(2,7).
barrier(2,8).
barrier(3,3).
barrier(3,4).
barrier(3,6).
barrier(3,8).
barrier(4,3).
barrier(4,6).
barrier(5,1).
barrier(5,8).
barrier(5,9).



inMaze([Y|X]) :- 
	mazeSize(MY, MX),
	=<(X, MX),
	>(X,0),
	=<(Y,MY),
	>(Y,0).

%rubbish!!!!
adjacent([Y1|X1], [Y2|X2]) :-
	adjacent(Y1,Y2);
	adjacent(X1,X2).
	adjacent(A1,A2) :- A2 is A1 + 1. 
	adjacent(B1,B2) :- B2 is B1 - 1. 
	
	
	
	 

validMove(This,Next) :- 
	inMaze(Next),
	\+barrier(Next),
	adjacent(This, Next),


removeHead(T, [_|T]).


solve(From, To, Path) :-
	From = Path
	





printGrid([]).
printGrid(L) :- nl,
   divider,
   printBlock(L,L1),
   divider,
   printBlock(L1,L2),
   divider,
   printBlock(L2,_),
   divider.

printBlock(L,L3) :- 
   printRow(L,L1), nl,
   blankLine, 
   printRow(L1,L2), nl,
   blankLine, 
   printRow(L2,L3), nl.
 
printRow(L,L3) :-
   write('+ '),
   printTriplet(L,L1), write(' | '),
   printTriplet(L1,L2), write(' | '),
   printTriplet(L2,L3),
   write(' +').


blankLine :- 
   write('+         |         |         +'), nl.


% blankLine.

divider :-
   write('+---------+---------+---------+'), nl.

printTriplet(L,L3) :-
   printElement(L,L1), write('  '),
   printElement(L1,L2), write('  '),
   printElement(L2,L3).

printElement([X|L],L) :- var(X), !, write('.').
printElement([X|L],L) :- write(X).

:- printGrid([_,_,_,_,*,_,_,_,_,
        _,_,_,_,_,_,_,_,_, 
        _,_,_,_,_,_,_,_,_,
        _,_,_,_,_,_,_,_,_, 
        _,_,_,_,_,_,_,_,_, 
        _,_,_,_,_,_,_,_,_,
        _,_,_,_,_,_,_,_,_, 
        _,_,_,_,_,_,_,_,_, 
        _,_,_,_,_,_,_,_,_]).