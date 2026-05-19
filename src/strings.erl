-module(strings).

-export([isEmpty/1, splitFirstChar/1]).

isEmpty([]) -> true;
isEmpty(_Zeichenkette) -> false.

splitFirstChar([]) -> {error, "Empty String"};
splitFirstChar([FirstChar | RestChars]) -> {[FirstChar], RestChars}.
