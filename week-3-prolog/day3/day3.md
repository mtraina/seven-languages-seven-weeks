<h1>Sudoku</h1>
To solve the Sudoku we don't need to give it the algorithm to how to do it, but teach it the rules of the game.

GNU Prolog has a predicate to express the possible values
```prolog
fd_domain(List, LowerBound, UpperBound)
```
Where the predicate is true if all the values of List are between LowerBound and UpperBound inclusive.

So we define the structure of the board and the domain as a rule
```prolog
sudoku(Puzzle, Solution) :-
        Solution = Puzzle,
        % structure
        Puzzle = [S11, S12, S13, S14,
                  S21, S22, S23, S24,
                  S31, S32, S33, S34,
                  S41, S42, S43, S44],
        % domain
        fd_domain(Puzzle, 1, 4).
```
Then we describe rows, columns and squares
```prolog
Row1 = [S11, S12, S13, S14],
Row2 = [S21, S22, S23, S24],
Row3 = [S31, S32, S33, S34],
Row4 = [S41, S42, S43, S44],

Col1 = [S11, S21, S31, S41],
Col2 = [S12, S22, S32, S42],
Col3 = [S13, S23, S33, S43],
Col4 = [S14, S24, S34, S44],

Square1 = [S11, S12, S21, S22],
Square2 = [S13, S14, S23, S24],
Square3 = [S31, S32, S41, S42],
Square4 = [S33, S34, S43, S44].
```
We build a rule for check id the board is valid: this means that all rows, columns and squares contain different elements.
```prolog
valid([]).
valid([Head|Tail]) :-
    fd_all_different(Head),
    valid(Tail).

valid([Row1, Row2, Row3, Row4,
       Col1, Col2, Col3, Col4,
       Square1, Square2, Square3, Square4])
```
Now we can solve the sudoku with the following commands
```prolog
['sudoku4.pl'].

sudoku([_, _, 2, 3,
        _, _, _, _,
        _, _, _, _,
        3, 4, _, _],
        Solution).
```

<h1>Eight queens</h1>
Each <b>queen</b> can be expressed as a tuple (Row,Col) and a <b>board</b> as a list of tuples.

The rules of the game are:
* there are 8 queens in a board
* each queen has a row
* no queens can share the same row
* no queens can share the same column
* no queens can share the same diagonals

Let's validate the queens
```prolog
valid_queen((Row, Col)) :-
  Range = [1,2,3,4,5,6,7,8],
  member(Row, Range), member(Col, Range).

valid_board([]).
valid_board([Head|Tail]) :- valid_queen(Head), valid_board(Tail).
```

Then we add the implementation of the fact that no queens can share the same row, column or diagonal.
```prolog
rows([], []).
rows([(Row, _)|QueensTail], [Row|RowsTail]) :-
  rows(QueensTail, RowsTail).

cols([], []).
cols([(_, Col)|QueensTail], [Col|ColsTail]) :-
  cols(QueensTail, ColsTail).

diags1([], []).
diags1([(Row, Col)|QueensTail], [Diagonal|DiagonalsTail]) :-
  Diagonal is Col - Row,
  diags1(QueensTail, DiagonalsTail).

diags2([], []).
diags2([(Row, Col)|QueensTail], [Diagonal|DiagonalsTail]) :-
  Diagonal is Col + Row,
  diags2(QueensTail, DiagonalsTail).
```

At this point we can solve the game with the next commands
```prolog
['queens.pl'].

eight_queens([(1, A), (2, B), (3, C), (4, D), (5, E), (6, F), (7, G), (8, H)]).
```
