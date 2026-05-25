#!/bin/bash

# 1. Sprawdzenie, czy skrypt został uruchomiony z uprawnieniami administratora
if [ "$EUID" -ne 0 ]; then
  echo "Błąd: Uruchomienie usługi wymaga uprawnień administratora."
  echo "Użyj: sudo $0"
  exit 1
fi

echo "Sprawdzanie statusu usługi Docker..."

# 2. Weryfikacja, czy Docker jest aktywny
if systemctl is-active --quiet docker; then
    echo "✅ Usługa Docker działa poprawnie."
else
    echo "⚠️ Usługa Docker nie działa. Próbuję ją uruchomić..."
    
    # 3. Próba uruchomienia usługi
    systemctl start docker
    
    # 4. Ponowne sprawdzenie, czy uruchomienie się powiodło
    if systemctl is-active --quiet docker; then
        echo "✅ Sukces: Usługa Docker została pomyślnie uruchomiona."
    else
        echo "❌ Błąd: Nie udało się uruchomić usługi Docker."
        echo "Wskazówka: Sprawdź logi systemowe, wpisując: journalctl -u docker.service"
        exit 1
    fi
fi