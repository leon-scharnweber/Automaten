# Datenstrukturen

## Darstellung des DEA

Der DEA wird als 5 Tupel abbgebildet mit folgenden Werten:

1. Liste mit allen möglichen Zuständen
2. Liste mit allen möglichen Zeichen des Alphabets
3. 3 Tupel bestehendend aus Zustand zeichen und Nachfolgezustand, in dieser Reihenfolge
4. einen Anfangszustand
5. Ein Liste mit Endzuständen

Es wurde sich für ein Tupel entschieden, weil es immer die 5 fünf geben muss um einen DEA vollständig zu beschreiben. Zudem ist dies die Mathematische Darstellung wo durch diese aufjedenfall korekt ist

## Darstellung der Zustände

Die Zustände werden in einer Liste gespeichert, die Länge der Zustände ändert sich zwar nicht aber sie ist pro Automat unterschiedlich also kann man nicht zur Compile Zeit sagen wie viele es sein werden.

## Darstellung der Zeichen

Die Zeichen werden auch in einer Liste gespeichert, geleiche Begründung wie bei den Zuständen

## Darstellung aller der Zustandübergänge

Alle Zustandübergänge werden in einer Liste gespeichert, gleiche Begründung wie bei den Zustände.

## Darstellung eines Zustandsübergangs

Ein Konkreter Zustandsübergang wird ein einem 3 Tupel gespeichert, da es immer genau drei Werte beinhalten muss. Einmal der Ausgangszustand dann das Zeichen für den Übergang und dann noch der Nachfolgezustand bei dem Übergang. Da es immer drei sind kann man da die Länge zur Compile Zeit wissen und kann somit ein Tupel verwenden.

## Darstellung ded Anfangszustands

Der Anfangszustand wird einfach als einzelnes Zeichen oder Zeichenkette gespeichert, weil es nur einen geben darf

## Darstellung der Endzustände

Die Endzustände werden mit den Zustände zusammen gespeichert, indem in der Zustandsliste nicht eifach die Zustände gespeichert werden sondern Tupels, mit einmal den Zuständen und einem Wert der angibt ob dieser Zustand ein Endzustand ist oder nicht. Dadurch muss nicht jeder Zustand doppel gespeichert werden und die chance auf fehler ist verringert.
