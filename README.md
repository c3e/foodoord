#foodoord

Das Schließsystem läuft auf einem RaspberryPi mit der Erweiterungsplatine "PiFaceDigitalIO". 

##Schlüsselupdate
<pre><code>foodoor-update-keydb
</code></pre>
Aktualisiert die die Schlüssel auf der Tür und baut die *Authorized_Keys* für die User *open* und *close*. Keys die nicht dem OpenSSH-Format mit 4096 bit entsprechen, werden ignoriert. Wenn das Script von Hand aufgerufen wird, werden die betroffenen Keys angezeigt. Über einen Cronjob werden die Keys alle **5 Min aktualisiert**.
### Input:
* ssh-login
* Klingel
* Statustaster

### Output:
* Status LEDs
* Summer
* Keymatic
