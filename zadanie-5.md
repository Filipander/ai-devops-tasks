Prompt 1:
+-------------+             +------------------+             +---------------+
|             |   Żądanie   |                  |   Zapytanie |               |
|   Klient    | ===========>| Serwer Aplikacji | ===========>|  Baza Danych  |
| (np. GUI,   | <===========| (Logika biznes.) | <===========| (Przechow.    |
| przeglądar.)|  Odpowiedź  |                  |    Wynik    |  danych)      |
+-------------+             +------------------+             +---------------+

Prompt 2:
+-------------------------------------------------------------+
|                           KLIENT                            |
|  (Przeglądarka internetowa, aplikacja mobilna, SPA/React)   |
+-------------------------------------------------------------+
         |                                     ^
         | 1. Żądanie HTTP                     | 4. Odpowiedź (np. JSON)
         | (np. GET /api/users/123)            | (np. Status: 200 OK)
         V                                     |
+-------------------------------------------------------------+
|                      SERWER APLIKACJI                       |
| (Node.js/Express, Python/Django, Java/Spring, PHP/Laravel)  |
|-------------------------------------------------------------|
| - Walidacja danych wejściowych od klienta                   |
| - Autoryzacja i uwierzytelnianie (np. sprawdzenie tokenu)   |
| - Przetwarzanie żądania i logika biznesowa                  |
+-------------------------------------------------------------+
         |                                     ^
         | 2. Zapytanie bazodanowe             | 3. Wynik zapytania
         | (np. SQL: SELECT * FROM users...)   | (Zwrócone rekordy/dane)
         V                                     |
+-------------------------------------------------------------+
|                        BAZA DANYCH                          |
|           (PostgreSQL, MySQL, MongoDB, Redis)               |
|-------------------------------------------------------------|
| - Trwałe przechowywanie informacji (persystencja danych)    |
| - Wykonywanie operacji CRUD (Create, Read, Update, Delete)  |
+-------------------------------------------------------------+