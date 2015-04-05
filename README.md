#foodoord

Das Schließsystem läuft auf einem RaspberryPi mit der Erweiterungsplatine "PiFaceDigitalIO". 

##Software##

###Installation###
<code>apt-get install python-pifacedigitalio </code>

Um das Paket zu installieren muss die */etc/apt/sources.list* angepasst werden.

<code>deb http://archive.raspbian.org/raspbian wheezy main contrib non-free rpi
<br>
deb-src http://archive.raspbian.org/raspbian wheezy main contrib non-free rpi</code>

<code>wget http://archive.raspbian.org/raspbian.public.key -O - | sudo apt-key add -</code>



###Dateiliste###
Der Deamon besteht aus folgenden Dateien.

* foodoor
* foodoord
* foodoord.conf
* foodoord_initd
* foodoor-ssh-wrapper
* foodoor-update-keydb

##Schüssel

###Schlüsselupdate
<pre><code>foodoor-update-keydb
</code></pre>
Aktualisiert die die Schlüssel auf der Tür und baut die *Authorized_Keys* für die User *open* und *close*. Keys die nicht dem OpenSSH-Format mit 4096 bit entsprechen, werden ignoriert. Wenn das Script von Hand aufgerufen wird, werden die betroffenen Keys angezeigt. Über einen Cronjob werden die Keys alle **5 Min aktualisiert**.

###Schlüsselformate###
Der foodoord akzeptiert nur Pub-Keys im *OpenSSH2-Format*. Keys lassen sich unter anderem mit OpenSSH oder PuTTygen erzeugen.

###OpenSSH####

####Keys generieren####
* Mit <code>ssh-keygen -b 4096 </code> lassen sich Keys generieren.
* <code>ssh-add $Pfad_zum_Key</code> fügt den Key dem ssh-Agent hinzu. Die Option <code>ssh-add -l</code> zeigt geladene Keys an.
* <code>ssh-kegen -l -f $Pfad_zum_Key </code> gibt den Fingerprint und andere Informationen zurück.

####Keys konvertieren(PuTTy>OpenSSH):####
* <code>ssh-keygen -i $Pfad_zum_Key > $Pfad_neuer_Pfad.pub</code> liest ssh2-kompatible Keys(RFC 4716) ein und speichert diese im OpenSSH-Format.

###PuTTy###
Da die Tür nur Keys im OpenSSH-Format verträgt, dürfen auch mit Putty nur OpenSSH-Keys genutzt werden.

###Keys generieren (OpenSSH-Format mit PuttyGen):###
1. PuTTYgen öffnen
2. Unten "Number of Bits in a generated Key:" 4096 eintippen
3. "Generate" klicken um Key zu generieren
4. Nach dem generieren oben im Menu "Conversions" > "Export OpenSSH-Key"
5. Speichern

Es ist zu beachten, dass Putty den PrivateKey im Putty-Format benötigt! Das heißt, falls der generierte Key vor dem Export nicht gespeichert wurde, muss der private Key noch konvertiert werden, siehe nächster Punkt!

###Keys konvertieren(OpenSSH>PuTTy):###
1. PuTTYgen öffnen
2. "Load" drücken
3. OpenSSH-Key auswählen
4. "Save Private-Key" drücken
5. Speichern

##Hardware

### Input:
* ssh-login
* Klingel
* Statustaster

### Output:
* Status LEDs
* Summer
* Keymatic
