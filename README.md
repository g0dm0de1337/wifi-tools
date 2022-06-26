## wifi-tools
# All scrips and tools are cloned by github
this is my backup repo.. for bad times :D

## Airattackit - Automated Wireless Attack Framework

# Some Of Pre-installed Wireless Attack tools

<h4>How To Use it?<br/></h4>
<p><code>git clone https://github.com/JoyGhoshs/Airattackit/</code><br/>
  <code>cd Airattackit</code><br/>
  <code>chmod +x install.sh</code><br/>
  <code>./install.sh</code><br/>
  <b>Type airattack in Terminal</b><br/>
  <code>airattack</code><br/>
  <code>Input r to install Extra Tools<br/></code>
  <b>Tool Is Ready To Use</b>
</p>

________________________END



# piracy ⚓️


# Menu
* {1} Enable monitor mode
* {2} Capture wifi signal
* {3} Handshake capture (Besside-ng)
* {4} Handshake capture (Airodump-ng)
* {5} Cracking WPA2-PSK passwords (Aircrack-Ng)
* {6} Cracking WPA2-PSK passwords (Hashcat)
* {7} Disable monitor mode 

--------------------------------

> Installation 

 (run in root account)

     $ cd piracy
     
     $ chmod +x install.sh
	
     $ ./install.sh
   
     $ piracy
     
     
> uninstaller

     $ chmod +x uninstaller.sh

     $ ./uninstaller.sh

--------------------------------
________________________END



# Wifi-Crack

## The Wifi-Crack program has 6 attack modes.

###Handshake-Angriff
Der Handshake-Angriffsmodus, in dem wir einen gültigen Handshake erhalten können, mit dem wir später einen Brute-Force-Angriff anwenden können, um das Wi-Fi-Passwort zu erhalten.

###PKMID-Angriff
Der PKMID-Angriffsmodus ist für drahtlose Netzwerke ohne zugeordnete Clients und versucht, eine PMKID zu erhalten.

###Authentifizierungs-Denial-Of-Service
Dieser Denial-of-Service-Modus startet so viele Anfragen wie möglich und verfolgt die Antworten, die der AP sendet (MDK4). wobei mdk4 selbst Clients verfolgt und sogar gültige Datenpakete, die es aus dem Netzwerk abfängt, erneut einfügt, sodass ein AP möglicherweise nicht in der Lage ist, echte und gefälschte Clients zu unterscheiden, und legitime Clients löschen kann, um Speicherplatz freizugeben.

###Deauthentifizierungsangriff
Der Deauthentifizierungsangriff wird gegen drahtlose Verbindungen verwendet. Es ist wie ein Denial-of-Service, der Netzwerke abrupt vorübergehend inaktiv macht. In diesem Modus können Sie die Zeit definieren, bis Sie den Angriff ausführen möchten.

###Beacon Flooding-Angriff
Bei diesem Angriffsszenario geht es um die Konnektivitätsverwirrung eines WLAN-Clients. Wir werden unzählige gefälschte Beacon-Frames übertragen.

###Böser Zwillingsangriff
Bei diesem bösen Zwillingsangriff richten wir einen gefälschten Wi-Fi-Zugangspunkt ein, in der Hoffnung, dass Benutzer sich mit ihm verbinden, anstatt mit einem legitimen. Wenn sich Benutzer mit diesem Zugangspunkt verbinden, speichern wir alle Daten, die sie mit dem Netzwerk teilen, in einer Datei.

Installationen
Zuerst installieren wir die notwendigen Bibliotheken, um dieses Skript korrekt auszuführen, mit dem folgenden Befehl.

❯ pip3 install -r requirements.txt

> sudo python3 wifiCrack.py -n wlan0 -a handshake / PKMID / AAuth / DAuth / BFlood / ETwin

> sudo python3 wifiCrack.py -n 


________________________END



# WiBreak 

Tool zur Automatisierung von Angriffen, um Hanshake- und PKMID-Angriffe zu erhalten und Chaos im Netzwerk zu verursachen, sogar um ein DOS zu verursachen (MIT VORSICHT VERWENDEN)

Wir kommen in das Verzeichnis, weisen dem Tool Ausführungsberechtigungen zu

> cd WiBreak && chmod +x WiBreak.sh

Und wir führen WiBreak.sh aus

> ./WiBreak.sh

________________________END


<h2>Shellbullly</h2>

bash install.sh

bash airodump-ng.sh / shellbully.sh / wash.sh

bully

________________________END


# h4rpy


> # cd h4rpy
> # sudo bash config.sh
> # sudo chmod +x h4rpy

sudo ./h4rpy


________________________END


# AutoWPS-Skript

Einfaches Auto WPS Pixie Dust Attack-Skript zum Gehen (mit Wifite2)

Erforderliches Wifite2: https://github.com/derv82/wifite2

apt install wifite

bash autoWPS.sh


________________________END

# Lscript

### How to run it

(make sure you are a root user)

```
open terminal
type  "l"
press enter
```
**(Not even "lazy"!! Just "l"! The less you type , the better!)**

### How to uninstall
``` 
cd /root/lscript
./uninstall.sh
rmdir -r /root/lscript 
```

### How to update
``` 
Run the script
Type "update"
```

________________________END


# Lazyaircrack

# Lazyaircrack

## Installing and requirements
- aircrack-ng
- Linux or Unix-based system (Currently tested only on Kali Linux rolling)
- Root access

### Installing
+ **For Linux :**
```
~ ❯❯❯ git clone https://github.com/3xploitGuy/lazyaircrack.git

~ ❯❯❯ cd lazyaircrack

~/lazyaircrack ❯❯❯ chmod +x lazyaircrack.sh

~/lazyaircrack ❯❯❯ ./lazyaircrack.sh
```

## Basics

> BSSID: Basic service set identifiers, it recognizes the access point or router uniquely because it has address which creates the wireless network.

> Channel: As Wi-Fi data is digital, the signals are transmited and received on a certain frequency also known as channel.

___________________________END


# pmkid-strip
PMKID-Strip is a tool to strip the PMKID hash from a Wi-Fi CAP file for cracking with Hashcat

python pmkdid-strip <filename.cap> 


________________________END
