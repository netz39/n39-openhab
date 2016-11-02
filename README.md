# n39-openhab
Dieses Repository beingaltet den "conf"-Ordner des openhab-Spiel-Test-Bastelknotens im Netz39. Auf diesem Knoten läuft die openHAB 2 Beta zum herumspielen und testen auf netz39-Kompatibilität.

## Bedienoberfläche
Endnutzer können im Netz39-WLAN können auf openhab über die Basic-UI zugreifen: (http://odroid64.n39.eu:8080/) 

## Mach mit! Einfache Konfiguration auch für Noobs!
### Items erstellen
Aktoren und Sensorwerte werden in openhab als [Items](https://github.com/openhab/openhab/wiki/Explanation-of-items) im items-Ordner abgelegt.
### Sitemaps
Sitemaps beschreiben die Anordnung der Items und Elemente in der UI.
### Rules
Rules bezeichnen Schaltregeln, die durch gewisse Ereignisse ausgelöst werden.

### Beispiele
#### Spacestatus Switch
Über folgende Definition in der *.items* File wird ein Switch-Item angelegt, dass den aktuellen SpaceStatus vom MQTT Server ausliest, und beim Umschalten einen entsprechenden HTTP Aufruf an wittgenstein stellt.

    Switch SpaceStatus "N39 SpaceStatus [%s]"	<switch>	{mqtt="<[helium:Netz39/SpaceAPI/isOpen:state:MAP(SpaceAPI.map)]", http=">[ON:POST:http://wittgenstein/open] >[OFF:POST:http://wittgenstein/close]"}
    
Diese Zeile erstellt einen Switch mit dem Identifier `SpaceStatus`, der Beschreibung `"N39 SpaceStatus"` und einem `<switch>`-Icon.

Über das mqtt Binding wird von helium der Wert von `Netz39/SpaceAPI/isOpen` abonniert. Die spitze Klammer gibt dabei die Lese-/Schreibrichtung an (`<` Empfangen, `>` Senden).      
Ein Switch ist ein Schalter mit den Zuständen: `ON` und `OFF`. Daher muss das in MQTT gepublish-te true and false noch umgemapped werden. Dies erfolgt mit dem MAP Bundle und einer Datei im *transform* Ordner:

Inhalt *transform/SpaceAPI.map*:

    true=ON
    false=OFF

Um die HTTP-Anfrage bei Statusänderung zu starten, definieren wir jeweils ein HTTP Aufruf bei Status ON `>[ON:POST:http://wittgenstein/open]`, sowie einen beim Status OFF `>[OFF:POST:http://wittgenstein/close]`.

Fertig ist der funktionale SpaceStatus Knopf. Dieser muss jetzt nurnoch in eine Sitemap an beliebiger Stelle eingefügt werden, um auch im UI angezeigt zu werden.


## TODO für stable Betrieb
Für einen langfristigen Betrieb müsste:
 * openhab auf einen dauerhaftem Server in Betrieb nehmen
 * ggf. Reverse Proxy vorschalten 
 * einfacheren Hostname 
