services:

web:

image: nginx

ports:

- "80:80"

app:

build: .

ports

- "3000:3000"

depends_on:

- db

db:

image: postgres

environment:

POSTGRES_PASSWORD=password

Nie, ten plik nie jest w pełni poprawny. Zawiera dwa błędy składniowe (YAML), przez które Docker Compose odmówi jego uruchomienia i wyrzuci błąd parsera.

Oto co dokładnie wymaga poprawy:

1. Brakujący dwukropek w sekcji ports
W usłudze app brakuje dwukropka (:) po słowie ports. W języku YAML każdy klucz zawierający zagnieżdżone elementy (jak lista portów) musi kończyć się dwukropkiem.

2. Niepoprawny format zmiennych środowiskowych
W usłudze db w sekcji environment zapisałeś POSTGRES_PASSWORD=password jako zwykły ciąg znaków (string). Docker Compose oczekuje w tym miejscu albo listy (ze znakiem myślnika na początku), albo słownika (klucz: wartość).

Poprawiona wersja pliku
Oto gotowy, poprawny plik docker-compose.yml. Wybrałem format listy dla zmiennych środowiskowych, ponieważ jest najczęściej stosowany w plikach Compose:

YAML
services:
  web:
    image: nginx
    ports:
      - "80:80"
  app:
    build: .
    ports: # <-- DODANY DWUKROPEK
      - "3000:3000"
    depends_on:
      - db
  db:
    image: postgres
    environment:
      - POSTGRES_PASSWORD=password # <-- DODANY MYŚLNIK (format listy)
(Alternatywnie, sekcja environment mogłaby wyglądać tak w formacie słownika: POSTGRES_PASSWORD: password - ze spacją po dwukropku). Teraz plik jest w 100% poprawny i polecenie docker compose up bez problemu go odczyta.