# Zadanie testowe
Sierpień 2021


## Opis zadania:
* Głównym celem jest pobranie danych z endpoint'u [https://reqres.in/api/users](https://reqres.in/api/users) i wyświetlenie ich w formie listy.
* Wybranie elementu z listy powoduje pokazanie ekranu z detalami.
* Zastosowano architekturę MVVM rozszerzoną o koordynator i dependency injection.
* Celowo zrezygnowano z korzystania z zewnętrznych rozwiązań - wszystkie cele zadania zostały zrealizowane samodzielnie.


## Realizacja zadania:
Projekt składa się z dwóch view kontrolerów, które obsługiwane są przez koordynator.

### 1. Ekran listy (*ListViewController*)
* *view* modułu składa się z dwóch elementów: *UITableView* i *UIActivityIndicatorView*
* po załadowaniu kontrolera następuje wywołanie z *viewModelu* metody pobierającej dane z *DataService*
* na czas pobierania danych tabela jest ukrywana i pokazywany jest wskaźnik pobierania
* jeśli proces pobierania danych zakończy się błędem, kontroler wysła informację do koordynatora, który wyświetla stosowny komunikat
* wskazanie elementu listy powoduje powiadomienie koordynatora o zdarzeniu, jednocześnie przekazywane są dane związane z wskazanym elementem tabeli

### 2. Ekran detali (*DetailsViewController*)
* jedynym zadaniem tego modułu jest prezentacja szczegółów danych wskazanych na ekranie listy
* dane, które mają zostać wyświetlone są przekazywane do *viewModelu* podczas jego inicjalizacji

## UI:
* wszystkiew elementy UI zostały utworzone w kodzie
* do ich poprawnego rozmieszczenia na ekranie zastosowano jedno z systemowych rozwiązań: *AutoLayout* realizowany poprzez ***NSLayoutConstraints***
* do nawigacji pomiędzy kontrolerami wykorzystano *UINavigationController*
* projekt wspiera **Dark Mode**, a kolory wykorzystywane w projekcie są definiowane w *ColorAssets.xcassets*, do których jest dostęp poprzez strukturę *AppColor*
* do ekranu detali dodano komponent prezentujący obrazek awatara, który podczas jego pobierania w tle (*URLSessionDownloadTask*) pokazuje placeholder

## Networking:
Za warstwę networkingu odpowiada prosty serwis *DataService* oparty o **URLSession**.
W projekcie dane pobierane są tylko z jednego endpoint’u i jednego typu zapytania, nie było więc potrzeby tworzenia bardziej rozbudowanego rozwiązania.

W typowych aplikacjach mobilnych, gdzie wysyłanych jest wiele różnych requestów, zastosowałbym bardziej złożone rozwiązanie, przy czym wspólnym elementem serwisów byłoby odwoływanie się do niego poprzez protokół.

## Error handling:
Podczas pobierania danych z endpointu może wydarzyć się wiele nieprzewidzianych zdarzeń, kończących się niepowodzeniem. Z tego powodu dodano customową obsługę błędów. Celem było:

* informowanie użytkownika o każdym problemie
* umożliwienie użytkownikowi powtórzenia akcji - powtórne wysłanie requestu

Pobieranie grafiki awatara nie ma obsługi błędu, gdyż nie jest kluczowe do prawidłowego działania aplikacji - w razie niepowodzenia użytkownik widzi placeholder. Informowanie o problemie można zrealizować na wiele różnych sposobów: przykładowo poprzez odpowiednią zmianę UI.