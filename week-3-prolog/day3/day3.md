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
