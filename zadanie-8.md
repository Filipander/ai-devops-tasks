Prompt 1:
Ten błąd oznacza jedną, bardzo konkretną rzecz: port 3000 na Twoim komputerze (hoście) jest już zajęty przez inny program.

Docker próbuje powiązać ten port z Twoim kontenerem, ale system operacyjny mu na to nie pozwala, ponieważ ktoś inny już go używa. Może to być lokalnie uruchomiony serwer Node.js, inna aplikacja, a czasami nawet "zawieszony" stary kontener Dockera.

Oto 3 sposoby na rozwiązanie tego problemu, od najczęstszego do najprostszego:

Rozwiązanie 1: Znajdź i "zabij" proces zajmujący port 3000
Jeśli chcesz koniecznie używać portu 3000, musisz zwolnić go na swoim komputerze.

Dla systemów Linux / macOS:

Sprawdź, jaki proces zajmuje port, wpisując w terminalu:

Bash
sudo lsof -i :3000
Zobaczysz tabelę. Zwróć uwagę na kolumnę PID (Identyfikator Procesu).

Ubij ten proces, podmieniając <PID> na numer z tabeli:

Bash
sudo kill -9 <PID>
Dla systemu Windows:

Otwórz Wiersz polecenia (CMD) jako administrator i wpisz:

DOS
netstat -ano | findstr :3000
Ostatnia kolumna po prawej stronie to numer PID.

Zabij proces za pomocą tego polecenia (podmień <PID>):

DOS
taskkill /PID <PID> /F
Rozwiązanie 2: Zmień port w konfiguracji Dockera
Jeśli nie obchodzi Cię, na jakim porcie zewnętrznym działa aplikacja, po prostu każ Dockerowi wystawić ją na innym, wolnym porcie (np. 3001).

Jeśli używasz docker-compose.yml:
Znajdź sekcję ports i zmień pierwszą wartość (port hosta), zostawiając drugą (port w kontenerze) bez zmian:

YAML
ports:
  - "3001:3000" # Zmieniono z 3000:3000
Jeśli używasz polecenia docker run w terminalu:
Zmień flagę -p:

Bash
docker run -p 3001:3000 nazwa_twojego_obrazu
Po tej zmianie Twoja aplikacja będzie dostępna w przeglądarce pod adresem http://localhost:3001.

Rozwiązanie 3: Restart Dockera (Zjawisko "Zombie")
Czasami zdarza się, że wyłączyłeś kontener, ale wbudowany w Dockera proces przekierowujący ruch (docker-proxy) zawiesił się w tle i nadal trzyma port.

Jeśli w kroku 1 na liście procesów widziałeś com.docker.backend lub docker-proxy, najszybszą opcją jest po prostu zrestartowanie samej usługi Dockera.

Linux: Wpisz sudo systemctl restart docker

Mac/Windows: Kliknij prawym przyciskiem myszy na ikonę Docker Desktop na pasku zadań i wybierz "Restart" lub "Quit Docker Desktop", a następnie uruchom go ponownie.

Prompt 2:
Wygląda na to, że zapomniałeś wkleić treść błędu do swojej wiadomości! 😊

W poprzednim kroku wyjaśniłem problem z zajętym portem 3000 (bind: address already in use). Jeśli napotkałeś teraz zupełnie nowy problem podczas budowania lub uruchamiania kontenera, skopiuj go i prześlij tutaj.

Jaki dokładnie komunikat błędu wyświetla Ci się tym razem w konsoli?