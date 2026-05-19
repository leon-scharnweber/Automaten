-module(einfacherDEATest_SUITE).
-export([all/0, init_per_suite/1, end_per_suite/1]).
-export([
    tf01/1,
    tf02/1,
    tf03/1,
    tf04/1,
    tf05/1,
    tf06/1,
    tf07/1,
    tf08/1,
    tf09/1,
    tf10/1
]).

-define(value(Key, Config), proplists:get_value(Key, Config)).

all() ->
    [tf01, tf02, tf03, tf04, tf05, tf06, tf07, tf08, tf09, tf10].

init_per_suite(Config) ->
    DEA01 = {
        % Zustände und ob sie end Zustände sind
        [{a, true}, {b, true}, {c, false}],
        % Alpabet
        ["a", "b", "c"],
        % Zustandsübergänge
        [
            {a, "a", a},
            {a, "b", b},
            {a, "c", c},
            {b, "a", a},
            {b, "b", b},
            {b, "c", c},
            {c, "a", a},
            {c, "b", b},
            {c, "c", c}
        ],
        % Startzustand
        a
    },
    DEA02 = {
        % Zustände und ob sie end Zustände sind
        [{a, true}],
        % Alpabet
        ["a"],
        % Zustandsübergänge
        [
            {a, "a", a}
        ],
        % Startzustand
        a
    },
    DEA03 = {
        % Zustände und ob sie end Zustände sind
        [],
        % Alpabet
        ["a"],
        [],
        % Startzustand
        []
    },
    DEA04 = {
        % Zustände und ob sie end Zustände sind
        [{a, false}, {b, false}],
        % Alpabet
        ["a", "b", "c"],
        % Zustandsübergänge
        [
            {a, "a", a},
            {a, "b", b},
            {a, "c", a},
            {c, "a", a},
            {c, "b", b},
            {c, "c", a}
        ],
        % Startzustand
        a
    },
    DEA05 = {
        % Zustände und ob sie end Zustände sind
        [{a, false}, {b, true}],
        % Alpabet
        [],
        % Zustandsübergänge
        [],
        % Startzustand
        a
    },
    DEA06 = {
        % Zustände und ob sie end Zustände sind
        [{a, false}, {b, true}, {c, false}],
        % Alpabet
        ["a", "b", "c"],
        % Zustandsübergänge
        [
            {a, "a", a},
            {a, "b", b},
            {a, "c", c},
            {b, "a", a},
            {b, "b", b},
            {b, "c", c},
            {c, "a", a},
            {c, "b", b},
            {c, "c", c}
        ],
        % Startzustand
        []
    },
    DEA07 = {
        % Zustände und ob sie end Zustände sind
        [{a, false}, {b, true}, {c, false}],
        % Alpabet
        ["a", "b", "c"],
        % Zustandsübergänge
        [
            {a, "a", a},
            {a, "b", b},
            {a, "c", c},
            {b, "a", a},
            {b, "b", b},
            {b, "c", c},
            {c, "a", a},
            {c, "b", b},
            {c, "c", c}
        ],
        % Startzustand
        [a, b]
    },
    DEA08 = {
        % Zustände und ob sie end Zustände sind
        [{a, false}, {b, true}, {c, false}],
        % Alpabet
        ["a", "b", "c"],
        % Zustandsübergänge
        [
            {a, "b", b},
            {a, "c", c},
            {b, "a", a},
            {b, "b", b},
            {b, "c", c},
            {c, "a", a}
        ],
        % Startzustand
        a
    },
    DEA09 = {
        % Zustände und ob sie end Zustände sind
        [{a, false}, {b, true}, {c, false}],
        % Alpabet
        ["a", "b", "c"],
        % Zustandsübergänge
        [
            {a, "b", b},
            {a, "c", c},
            {b, "a", a},
            {b, "b", b},
            {b, "c", c},
            {c, "b", b}
        ],
        % Startzustand
        a
    },
    DEA10 = {
        % Zustände und ob sie end Zustände sind
        [{a, false}, {b, true}, {c, false}],
        % Alpabet
        ["a", "b", "c"],
        % Zustandsübergänge
        [
            {a, "a", a},
            {a, "b", c},
            {a, "c", c},
            {b, "a", a},
            {b, "b", b},
            {b, "c", c},
            {c, "a", a},
            {c, "b", a},
            {c, "c", c}
        ],
        % Startzustand
        a
    },
    String01 = "abbab",
    String02 = "",
    String03 = "abbab",
    String04 = "abbab",
    String05 = "abbab",
    String06 = "abbab",
    String07 = "abbab",
    String08 = "bbab",
    String09 = "abbab",
    String10 = "abcbcab",
    [
        {dea01, DEA01},
        {dea02, DEA02},
        {dea03, DEA03},
        {dea04, DEA04},
        {dea05, DEA05},
        {dea06, DEA06},
        {dea07, DEA07},
        {dea08, DEA08},
        {dea09, DEA09},
        {dea10, DEA10},
        {string01, String01},
        {string02, String02},
        {string03, String03},
        {string04, String04},
        {string05, String05},
        {string06, String06},
        {string07, String07},
        {string08, String08},
        {string09, String09},
        {string10, String10}
        | Config
    ].

end_per_suite(_Config) -> ok.

tf01(ConfigData) ->
    DEA = ?value(dea01, ConfigData),
    Zeichenkette = ?value(string01, ConfigData),
    ok = engine:check(Zeichenkette, DEA).
tf02(ConfigData) ->
    DEA = ?value(dea02, ConfigData),
    Zeichenkette = ?value(string02, ConfigData),
    ok = engine:check(Zeichenkette, DEA).
tf03(ConfigData) ->
    DEA = ?value(dea03, ConfigData),
    Zeichenkette = ?value(string03, ConfigData),
    {error} = engine:check(Zeichenkette, DEA).
tf04(ConfigData) ->
    DEA = ?value(dea04, ConfigData),
    Zeichenkette = ?value(string04, ConfigData),
    {error} = engine:check(Zeichenkette, DEA).
tf05(ConfigData) ->
    DEA = ?value(dea05, ConfigData),
    Zeichenkette = ?value(string05, ConfigData),
    {error} = engine:check(Zeichenkette, DEA).
tf06(ConfigData) ->
    DEA = ?value(dea07, ConfigData),
    Zeichenkette = ?value(string07, ConfigData),
    {error} = engine:check(Zeichenkette, DEA).
tf07(ConfigData) ->
    DEA = ?value(dea07, ConfigData),
    Zeichenkette = ?value(string07, ConfigData),
    {error} = engine:check(Zeichenkette, DEA).
tf08(ConfigData) ->
    DEA = ?value(dea08, ConfigData),
    Zeichenkette = ?value(string08, ConfigData),
    ok = engine:check(Zeichenkette, DEA).
tf09(ConfigData) ->
    DEA = ?value(dea09, ConfigData),
    Zeichenkette = ?value(string09, ConfigData),
    {error, "Found no Transition"} = engine:check(Zeichenkette, DEA).
tf10(ConfigData) ->
    DEA = ?value(dea10, ConfigData),
    Zeichenkette = ?value(string10, ConfigData),
    {error, "Ended in an not Endstate"} = engine:check(Zeichenkette, DEA).
