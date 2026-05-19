-module(engine).

-export([check/2]).

%% Der Einstigspunkt der DEA Enginge, die die check Funktion wrappt damit nicht expliziet der Startate als CurrentState übergeben werden muss
check(Zeichenkette, {States, Alphabet, Transitions, StartState}) ->
    io:format("Starting for checking for String: ~p~n", [Zeichenkette]),
    check(Zeichenkette, StartState, {States, Alphabet, Transitions, StartState}).

%%%%--------------------------------------------------------------------------------------------------------------------------------------------
%% arg Zeichenkette: Die Zeichenkette die Überprüft werden soll
%% arg DEA die Automat welcher die Zeichenkette erkennen soll in folgender Schreibweise {Liste von States, Liste von möglichen Zeichen, Liste von Transitionen, Start Zustand}. Die States selber sind ein Tupel mit dem State selber und einem boolen der angibt ob es sich um ein Endstate handelt. Die Transitionen sind ein 3 Tupel mit folgendem Aufbau {State, char, nextstate}
%% return: true, falls er eraknnt wird, wenn nicht false.

%% Es sind keine Zeichen mehr in der Zeichenkette übrigt, es muss jetzt nur noch geprüft werden ob der CurrentState ein EndState ist
check([], CurrentState, {States, _Alphabet, _Transitions, _StartState}) ->
    case endState(CurrentState, States) of
        true -> ok;
        false -> {error, "Ended in an not Endstate"}
    end;
%% Es wird der Übergang für das nächste Zeichen in der Zeichenkette gemacht und danach in die Rekursion für die restlichen Zeichenketten gegangen
%% Wenn aber für den derzeitge zeichen im CurrentState kein Übergang gefunden wurde, wird ein error zurück gegeben.
check(Zeichenkette, CurrentState, {_States, _Alphabet, Transitions, StartState}) ->
    {NextChar, RestChars} = strings:splitFirstChar(Zeichenkette),
    NextState = moveToNextState(NextChar, CurrentState, Transitions),
    case NextState of
        {error, Message} -> {error, Message};
        _ -> check(RestChars, NextState, {_States, _Alphabet, Transitions, StartState})
    end.

%%%%--------------------------------------------------------------------------------------------------------------------------------------------
%% Prüft ob der gegebene Zustand "CurrentState" ein Endzustand im DEA ist
%% return: true wenn er ein Endzustand ist, wenn nicht false. Falls es diesen Zustan gar nicht im DEA gibt wird das mit einem error wieder gegeben

%% Es wurde der Currentstate gefunden, ob es einer ist steht in IsEndState und der wird auch zurück gegeben.
endState(CurrentState, [{CurrentState, IsEndState} | _RestStates]) ->
    IsEndState;
%% Es wurde noch nicht der richtige State gefunden also wird mit den restlichen in die Rekursion reingegangen.
endState(CurrentState, [HState | RestStates]) ->
    io:format("CurrentState: ~p~n", [CurrentState]),
    io:format("HState: ~p~n", [HState]),
    endState(CurrentState, RestStates).

%%%%--------------------------------------------------------------------------------------------------------------------------------------------
%% Führt eine Transition von dem CurrentState mit dem gegeben NextChar aus. Nach den folgenden Zustandsübergägngen die übergeben wurden sind
%% return: den NextState nach den Regeln der Zustandübergängen, falls es keinen gibt wird ein error mit "Found no Transition" zurückgegeben.

%% Der Teil der überprüft wenn der richtiger Übergang gefunden wurde und der Next State zurückgegeben wird.
moveToNextState(NextChar, CurrentState, [{CurrentState, NextChar, NextState} | _RestTransitions]) ->
    io:format("NextState for this Character: ~p is ~p~n", [NextChar, NextState]),
    NextState;
%% Wenn noch nicht der richtige Übergang gefunden wurde, wird hier in die Rekursion rein gegangen mit den restlichen Übergängen
moveToNextState(NextChar, CurrentState, [{FirstState, TransitionChar, NextState} | RestTransitions]) ->
    io:format("Not the Transition: ~p~n", [{FirstState, TransitionChar, NextState}]),
    moveToNextState(NextChar, CurrentState, RestTransitions);
%% Wenn keine Übergänge mehr übrigt sind, wird hier ein Fehler geworfen das es keinen Übergang gibt
moveToNextState(_NextChar, _CurrentState, []) ->
    {error, "Found no Transition"}.
