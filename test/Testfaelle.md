## Äquivalenzklassen

| Parameter             | Äquivalenzklassen                                                                                                                               | Repräsentant                                                                                                                  |
| :-------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------- | :---------------------------------------------------------------------------------------------------------------------------- |
| **Zeichenkette**      | gÄK1: leere Zeichenkette<br>gÄK2: beliebige Länge                                                                                               | ""<br>"abbab"                                                                                                                 |
| **Zustände**          | gÄk1: keine Zustände<br>gÄk2: einen Zustand<br>gÄk3: beliebig viele Zustände                                                                    | []<br>[a]<br>[a, b, c]                                                                                                        |
| **Endzustände**       | gÄk1: einen Endzustand<br>gÄk2: beliebige Endzustände<br>uÄk1: keinen Endzustand                                                                | [b]<br>[a, b]<br>[]                                                                                                           |
| **Alphabet**          | gÄk1: ein Zeichen<br>gÄk2: beliebig viele Zeichen<br>uÄk1: kein Zeichen                                                                         | ["a"]<br>["a, b, c"]<br>[]                                                                                                    |
| **Zustandsübergänge** | gÄk1: vollständige Übergänge<br>uÄk1: Übergänge, die zu einem Endzustand führen können<br>uÄk2: Übergänge, die nicht zu einem Endzustand führen | [\{a, a, a\}, \{a, b, b\}, \{b, a, a\}, \{b, b, b\}]<br>[\{a, b, b\}, \{b, a, a\}]<br>[\{a, a, a\}, \{a, b, a\}, \{b, a, a\}] |
| **Startzustände**     | gÄk1: einen Startzustand<br>uÄk1: keinen Startzustand<br>uÄk2: mehr als einen Startzustand                                                      | [a]<br>[]<br>[a, b]                                                                                                           |

## Testfälle

| ID       | Zeichenkette | Zustände / Start / End          | Alphabet    | Übergänge           | Erwartet                           |
| :------- | :----------- | :------------------------------ | :---------- | :------------------ | :--------------------------------- |
| **TF01** | "abbab"      | Q: [a, b, c], S: [a], F: [a, b] | ["a, b, c"] | Vollständig         | Pass (Normal)                      |
| **TF02** | ""           | Q: [a], S: [a], F: [b]          | ["a"]       | Vollständig         | Pass (Grenze)                      |
| **TF03** | "abbab"      | Q: [], S: [], F: []             | ["a"]       | Vollständig         | Fehler (Keine Zustände)            |
| **TF04** | "abbab"      | Q: [a, b], S: [a], F: []        | ["a, b, c"] | Vollständig         | Fehler (Kein Endzustand)           |
| **TF05** | "abbab"      | Q: [a, b], S: [a], F: [b]       | []          | Vollständig         | Fehler (Leeres Alphabet)           |
| **TF06** | "abbab"      | Q: [a, b, c], S: [], F: [b]     | ["a, b, c"] | Vollständig         | Fehler (Kein Startzustand)         |
| **TF07** | "abbab"      | Q: [a, b, c], S: [a, b], F: [b] | ["a, b, c"] | Vollständig         | Fehler (Mehrere Startz.)           |
| **TF08** | "bbab"       | Q: [a, b, c], S: [a], F: [b]    | ["a, b, c"] | Nur zu Endzustand   | Pass (Unvollständig)               |
| **TF09** | "abbab"      | Q: [a, b, c], S: [a], F: [b]    | ["a, b, c"] | Nur zu Endzustand   | Fehler (darf nicht mit a anfangen) |
| **TF10** | "abcbcab"    | Q: [a, b, c], S: [a], F: [b]    | ["a, b, c"] | Nicht zu Endzustand | Fehler (Unvollständig)             |
