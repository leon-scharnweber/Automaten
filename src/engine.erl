-module(engine).

-export([check/2]).

%% Der Einstigspunkt der DEA Enginge, die die check Funktion wrappt damit nicht expliziet der Startate als CurrentState übergeben werden muss
check(Zeichenkette, {States, Alphabet, Transitions, StartState}) ->
    io:format("Starting for checking for String: ~p~n", [Zeichenkette]),
    check(Zeichenkette, StartState, {States, Alphabet, Transitions, StartState}).

%%
%% arg Zeichenkette: Die Zeichenkette die Überprüft werden soll
%% arg DEA die Automat welcher die Zeichenkette erkennen soll in folgender Schreibweise {Liste von States, Liste von möglichen Zeichen, Liste von Transitionen, Start Zustand}. Die States selber sind ein Tupel mit dem State selber und einem boolen der angibt ob es sich um ein Endstate handelt. Die Transitionen sind ein 3 Tupel mit folgendem Aufbau {State, char, nextstate}
%% return: true, falls er eraknnt wird, wenn nicht false.
check([], CurrentState, {States, _Alphabet, _Transitions, _StartState}) ->
    case endState(CurrentState, States) of
        true -> ok;
        false -> {error, "Ended in an not Endstate"}
    end;
check([NextChar | RestChar], CurrentState, {_States, _Alphabet, Transitions, StartState}) ->
    io:format("Next Char is: ~p~n", [NextChar]),
    NextState = moveToNextState(NextChar, CurrentState, Transitions),
    case NextState of
        {error, Message} -> {error, Message};
        _ -> check(RestChar, NextState, {_States, _Alphabet, Transitions, StartState})
    end.

%% Prüft ob der gegebene Zustand "CurrentState" ein Endzustand im DEA ist
%% return: true wenn er ein Endzustand ist, wenn nicht false. Falls es diesen Zustan gar nicht im DEA gibt wird das mit einem error wieder gegeben
endState(CurrentState, {CurrentState, IsEndState}) -> IsEndState;
endState(CurrentState, [_HStates | RestStates]) -> endState(CurrentState, RestStates).

%% Führt eine Transition von dem CurrentState mit dem gegeben NextChar aus. Nach den folgenden Zustandsübergägngen die übergeben wurden sind
%% return: den NextState nach den Regeln der Zustandübergängen, falls es keinen gibt wird ein error mit "Found no Transition" zurückgegeben.
moveToNextState(NextChar, CurrentState, [{CurrentState, NextChar, NextState} | RestTransitions]) ->
    io:format("NextState for this Character: ~p is ~p~n", [NextChar, NextState]),
    NextState;
moveToNextState(NextChar, CurrentState, [{FirstState, TransitionChar, NextState} | RestTransitions]) ->
    io:format("Not the Transition: ~p~n", [{FirstState, TransitionChar, NextState}]),
    NotNextChar = NextChar == TransitionChar,
    NotCurrentState = CurrentState == FirstState,
    io:format("~p == ~p: ~p~n", [NextChar, TransitionChar, NotNextChar]),
    io:format("~p == ~p: ~p~n", [CurrentState, FirstState, NotCurrentState]),
    moveToNextState(NextChar, CurrentState, RestTransitions);
moveToNextState(_NextChar, _CurrentState, []) ->
    {error, "Found no Transition"}.
