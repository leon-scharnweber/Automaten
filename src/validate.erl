-module(validate).
-export([validate/1]).

validate({States, Alphabet, Transitions, StartState}) -> validateAlphabet(Alphabet).

validateAlphabet(Alphabet) -> validateAlphabet(Alphabet, []).

validateAlphabet([], _Seen) ->
    ok;
validateAlphabet([CurChar | RestChar], Seen) ->
    case lists:member(CurChar, Seen) of
        false -> validateAlphabet(RestChar, [CurChar | Seen]);
        true -> {error, CurChar}
    end.
