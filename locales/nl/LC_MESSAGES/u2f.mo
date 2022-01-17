��    d      <              \     ]     y     �  3   �  7   �          9     R  	   r  5   |  G   �  �   �  ]   �  {   	     �	     �	     �	    �	  
   �
     �
            6   -  +   d  �   �  
   ,  �   7  b    �   q  �   :  A  �  �   (  �   �  �   <  �   �  N   �  i   #     �     �  �   �  �   Y     8     J     g     �  �   �  �   1  Z     �   w  D     )   R  �   |  �   >  P   �     :  �   F     2  )   ?  L   i  �   �  ;   C  ;     �   �  2   c  >   �    �  d   �   �   X!  �   �!  �  �"    Y$  Q   w%  �   �%  �   �&  �   j'  =  �'  �   0)  M   �)     D*     T*  /   t*  (   �*  :   �*     +  C   +  �   R+  &   ,  �   ?,  o   �,  �   `-  ~   �-  �   o.  -   �.  C  ,/  �   p0  �   K1    2  }   '3  �   �3  �  y4     S6     o6     �6  9   �6  9   �6     7     :7  '   V7  
   ~7  3   �7  R   �7  �   8  a   �8  �   09     �9     �9     �9  &  :     7;     C;     ^;     t;  6   �;  .   �;  �   �;     �<     �<  �  �=  �   #?  �   �?  5  �@  �   �B  �   �C  �   
D  �   �D  G   �E  V   F     bF  	   nF  �   xF  �   7G     H     0H     LH     jH  �   �H    I  ^   J  �   wJ  Y   4K  5   �K  �   �K  �   �L  T   XM     �M  �   �M  	   �N  4   �N  P   �N  �   FO  C   �O  B   1P  �   tP  *   6Q  H   aQ  E  �Q  x   �R  �   iS  �   $T  �  U  ;  �V  W   �W  �   TX  �   ,Y  �   
Z  h  �Z  �   \  `   �\     P]     c]  0   �]  '   �]  :   �]     ^  A   ^  �   `^  2   @_  �   s_  �   4`  �   �`  �   ba  �   �a  -   �b  :  �b  �    d  �   �d  !  �e  �   �f  �   vg   (Nitrokey FIDO U2F - Linux) (Nitrokey FIDO U2F - Windows) (Nitrokey FIDO U2F - macOS) 1. Create a backup user and give it root privileges 2. Set up the ``rules`` to recognize the Nitrokey FIDO2 3. Install ``libpam-u2f`` 4. Prepare the Directory 5. Generate the U2F config file 6. Backup 7. Modify the Pluggable Authentication Module ``PAM`` After copying the file, restart udev via ``sudo service udev restart``. After the PAM module modification, you will be able to test your configuration right away, but it is recommended to reboot your computer, and unplug/replug the Nitrokey FIDO2. Alternatively you can build ``libpam-u2f`` from `Git <https://github.com/phoeagon/pam-u2f>`_. Alternatively you can just modify the ``/etc/pam.d/sudo`` file if you wish to use FIDO U2F when using the ``sudo`` command. And add the following lines: And plug your Nitrokey FIDO2. And restart ``udev`` service By modifying ``/etc/pam.d/common-auth`` file, you will be able to use you Nitrokey FIDO for 2nd factor authentication for graphic login and ``sudo``. Note: ``common-auth`` should be modified by adding the additional configuration line at the end of the file. CLI method Choose your operating system: Click for more options Control flags Create ``.config/Nitrokey/`` under your home directory Desktop Login and Linux User Authentication For individual user configuration you should point to the home directory in the next step, or not include the ``authfile`` option in the PAM configuration. GUI method If ``required`` or ``requisite`` is set, the failure of U2F authentication will cause a failure of the overall authentication. Failure will occur when the configured Nitrokey FIDO is not plugged, lost or destroyed. If the Nitrokey is not accepted immediately, you may need to copy this file `41-nitrokey.rules <https://www.nitrokey.com/sites/default/files/41-nitrokey.rules>`_ to ``etc/udev/rules.d/``. In very rare cases, the system will need the `older version <https://raw.githubusercontent.com/Nitrokey/libnitrokey/master/data/41-nitrokey_old.rules>`_ of this file. If you need more information about Control Flags in the ``PAM`` configuration line, you may see the last section of this guide to understand the difference, and the implications of using each of them. If you often forget to insert the key, ``prompt`` option make ``pam_u2f`` print ``Insert your U2F device, then press ENTER.`` and give you a chance to insert the Nitrokey. If you want to login to you computer using `Nitrokey Pro 2, <https://shop.nitrokey.com/shop/product/nk-pro-2-nitrokey-pro-2-3>`_ `Nitrokey Storage 2 <https://shop.nitrokey.com/shop/product/nitrokey-storage-2-56>`_ and `Nitrokey Start <https://shop.nitrokey.com/shop/product/nk-sta-nitrokey-start-6>`_ you can visit the instructions for Windows available `here <https://www.nitrokey.com/documentation/applications#p:nitrokey-pro&a:computer-login&os:windows>`_, and for Linux `here <https://www.nitrokey.com/documentation/applications#p:nitrokey-pro&a:computer-login&os:linux>`_. If you wish to use FIDO U2F authentication solely for Gnome’s graphic login, you might prefer to modify the\ ``/etc/pam.d/gdm-password`` If you would like to be prompted to touch the Nitrokey, ``cue`` option will make ``pam_u2f`` print ``Please touch the device.`` message. In case you prefer to setup U2F for a single user, and are locked out of your user session, you would still be able to login with the ``<backup_user>``, and proceed with the maintenance. In step 7 we have used the ``sufficient`` control flag to determine the behavior of the PAM module when the Nitrokey is plugged or not. However it is possible to change this behavior by using the following control flags: In the left corner click on ``Unlock`` and that would prompt for your password In the lower left corner click on ``Show Applications`` and type settings in the search bar as following: Instructions Introduction It is recommended to first test the instructions with a single user. For this purpose the previous command takes the ``-u`` option, to specify a user, like in the example below: Log in to the website and enable two-factor authentication in your account settings. (In most cases you will find a link to the documentation of the supported web service at `dongleauth.com <https://www.dongleauth.com/>`_) Nitrokey FIDO U2F Nitrokey FIDO U2F with Linux Nitrokey FIDO U2F with Windows Nitrokey FIDO U2F with macOS Nitrokey FIDO2 configured following `these instructions <https://www.nitrokey.com/documentation/installation#p:nitrokey-fido-u2f&os:linux>`_. Note, the output will be much longer, but sensitive parts have been removed here. For better security, and once the config file generated, we will move the ``.config/Nitrokey`` directory under the ``etc/`` directory with this command: On Ubuntu 20.04 it is possible to download directly ``libpam-u2f`` from the official repos Once done with the preparation, we can start to configure the computer to use the Nitrokey FIDO2 for 2nd factor authentication at login and ``sudo``. Once we modified the ``common-auth``, we can save and exit the file. Once you finish Step 4 you should be done Once you have properly tested the instructions in this guide (and set up a backup), it is recommended to use either the ``required`` or the ``requisite`` control flag instead of ``sufficient``. Once you run the command above, you will need to touch the key while it flashes. Once done, ``pamu2fcfg`` will append its output the ``u2f_keys`` in the following format: Open one of the `websites that support FIDO U2F <https://www.dongleauth.com/>`_. PAM modules Register your Nitrokey FIDO U2F in the account settings by touching the button to activate the Nitrokey FIDO U2F. After you have successfully configured the device, you must activate the Nitrokey FIDO U2F this way each time you log in. Requirements Scroll down in the right bar to ``Users`` Select ``Administrator`` and enter the user name and password of your choice Since we are using Central Authentication Mapping, we need to tell ``pam_u2f`` the location of the file to use with the ``authfile`` option. The Nitrokey App can not be used for the Nitrokey FIDO U2F. The Nitrokey FIDO U2F can be used with any current browser. The Nitrokey FIDO U2F supports **two-factor authentication (2FA)**. With two-factor authentication (2FA), the Nitrokey FIDO U2F is checked in addition to the password. The Output should be something like the following: The file under ``.config/Nitrokey`` must be named ``u2f_keys`` The final step is configure the PAM module files under ``/etc/pam.d/``. In this guide we will modify the ``common-auth`` file as it handles the authentication settings which are common to all services, but other options are possible. You can modify the file with the following command: The first time you plug in the Nitrokey FIDO U2F Windows may need some time to configure the device. The flags ``required`` and ``requisite`` provide a tighter access control, and will make the Nitrokey FIDO2 necessary to login, and/or use the configured service. The following guide can potentially lock you out of your computer. You should be aware of these risks, as it is recommended to first use the instructions below on a secondary computer, or after a full backup. The secure access to such a central software is especially important and can now be realized with the Nitrokey. For this purpose, access is protected by two-factor authentication (2FA) and critical users are given a Nitrokey. From now on the Nitrokey will be checked during user login in addition to the user password. Phishing attacks are thus foiled and your critical company data is protected. The two-factor authentication can be carried out using one-time passwords (TOTP, RFC 6238) and FIDO U2F, thus enabling Nitrokey Pro, Nitrokey Storage and Nitrokey FIDO U2F to be used. It is also possible to configure authentication centrally and to activate it only for selected users. There are several PAM modules files that can be modified according to your needs: This guide will walk you through the configuration of Linux to use FIDO Universal 2nd Factor, i.e. FIDO U2F with ``libpam-u2f`` and `Nitrokey FIDO2 <https://shop.nitrokey.com/shop/product/nk-fi2-nitrokey-fido2-55>`_. This solution was developed together with our partner `initOS <https://www.initos.com/>`_, who are specialized in the development and customization of Odoo. If you are interested, please contact us. This step is optional, however it is advised to have a backup Nitrokey in the case of loss, theft or destruction of your Nitrokey FIDO. To generate the configuration file we will use the ``pamu2fcfg`` utility that comes with the ``libpam-u2f``. For convenience, we will directly write the output of the utility to the ``u2f_keys`` file under ``.config/Nitrokey``. First plug your Nitrokey FIDO2 (if you did not already), and enter the following command: To set up a backup key, repeat the procedure above, and use ``pamu2fcfg -n``. This will omit the ``<username>`` field, and the output can be appended to the line with your ``<username>`` like this: To verify that the library is properly installed enter the following command: Troubleshooting Two-Factor Authentication (2FA) Two-factor authentication for ERP software Odoo Ubuntu 20.04 with Gnome Display Manager. Under ``/etc/udev/rules.d`` download ``41-nitrokey.rules`` Usage Video: Two-Factor-Authentication with the Nitrokey FIDO U2F in Odoo You can also test your configuration by logging out of the user session and logging back. A similar screen should be displayed once you you unplug/replug yout Nitrokey FIDO2 and type your password: You can do so by using these commands: You can test the configuration by typing ``sudo ls`` in the terminal. You should be prompted the message ``Please touch the device.`` and have a similar output on the terminal: You might lose access to your data after configuring `PAM modules <http://www.linux-pam.org/Linux-PAM-html/>`_. You will also lose the ability to use ``sudo`` if you set up Central Authentication Mapping *and* used the ``required`` or ``requisite`` flags. You will lose access to your computer if you mis-configured the PAM module *and* used the ``required`` or ``requisite`` flags. `Checkout <https://www.nitrokey.com/documentation/applications#p:nitrokey-fido-u2f&os:all>`_ the various use cases and supported applications. `Contact <https://www.nitrokey.com/contact>`_ `Odoo <https://www.odoo.com/>`_ is a powerful ERP (Enterprise Resource Planning) software for companies of all sizes. Odoo is available as open source and contains modules for CRM, website/e-commerce, accounting, financial accounting, production, warehouse management, project management, document management, among others. ``optional``: The success or failure of this module is only important if it is the only module in the stack associated with this service+type. The ``optional`` flag is considered to be safe to use for testing purposes. ``required``: This is the most critical flag. The module result must be successful for authentication to continue. This flag can lock you out of your computer if you do not have access to the Nitrokey. ``requisite``: Similar to ``required`` however, in the case where a specific module returns a failure, control is directly returned to the application, or to the superior PAM stack. This flag can also lock you out of your computer if you do not have access to the Nitrokey. ``sufficient``: The module result is ignored if it fails. The ``sufficient`` flag considered to be safe for testing purposes. `nouserok` will ensure that you can still login using the username and password, you might want to remove this at some point once the setup is working and you don't want regular username & password based logins. Project-Id-Version: Nitrokey Documentation
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2022-01-17 14:16+0100
PO-Revision-Date: 2022-01-17 15:10+0000
Last-Translator: Anonymous <noreply@weblate.org>
Language: nl
Language-Team: Dutch <https://translate.nitrokey.com/projects/nitrokey-documentation/documentation-u2f/nl/>
Plural-Forms: nplurals=2; plural=n != 1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 (Nitrokey FIDO U2F - Linux) (Nitrokey FIDO U2F - Windows) (Nitrokey FIDO U2F - macOS) 1. Maak een backup gebruiker aan en geef hem root rechten 2. Stel de ``rules`` in om de Nitrokey FIDO2 te herkennen 3. Installeer ``libpam-u2f`` 4. Bereid de Directory voor 5. Genereer het U2F configuratiebestand 6. Back-up 7. Wijzig de Pluggable Authenticatie Module ``PAM`` Na het kopiëren van het bestand, herstart udev via ``sudo service udev restart``. Na de wijziging van de PAM-module kunt u uw configuratie meteen testen, maar het is aanbevolen om uw computer opnieuw op te starten en de Nitrokey FIDO2 los te koppelen/weer aan te sluiten. Als alternatief kunt u ``libpam-u2f`` bouwen vanuit `Git <https://github.com/phoeagon/pam-u2f>`_. U kunt ook gewoon het ``/etc/pam.d/sudo`` bestand wijzigen als u FIDO U2F wilt gebruiken wanneer u het ``sudo`` commando gebruikt. En voeg de volgende regels toe: En sluit uw Nitrokey FIDO2 aan. En herstart ``udev`` service Door het bestand ``/etc/pam.d/common-auth`` aan te passen, kunt u Nitrokey FIDO gebruiken voor authenticatie met de tweede factor voor grafische aanmelding en ``sudo``. Opmerking: ``common-auth`` moet worden gewijzigd door de extra configuratieregel aan het einde van het bestand toe te voegen. CLI-methode Kies uw besturingssysteem: Klik voor meer opties Controlevlaggen Maak ``.config/Nitrokey/`` aan onder uw home directory Desktop login en Linux gebruikersauthenticatie Voor individuele gebruikersconfiguratie moet u in de volgende stap naar de home directory wijzen, of de ``authfile`` optie niet opnemen in de PAM configuratie. GUI-methode Als ``required`` of ``requisite`` is ingesteld, zal het falen van de U2F-authenticatie leiden tot het falen van de algehele authenticatie. De mislukking zal zich voordoen wanneer de geconfigureerde Nitrokey FIDO niet is aangesloten, verloren of vernietigd. Als de Nitrokey niet onmiddellijk wordt geaccepteerd, kan het nodig zijn dit bestand `41-nitrokey.rules <https://www.nitrokey.com/sites/default/files/41-nitrokey.rules>`_ te kopiëren naar ``etc/udev/rules.d/``. In zeer zeldzame gevallen zal het systeem de ` oudere versie <https://raw.githubusercontent.com/Nitrokey/libnitrokey/master/data/41-nitrokey_old.rules>`_ van dit bestand nodig hebben. Indien u meer informatie wenst over Controle Vlaggen in de ``PAM`` configuratie lijn, kunt u de laatste sectie van deze gids raadplegen om het verschil te begrijpen, en de implicaties van het gebruik van elk van hen. Als u vaak vergeet de sleutel in te voeren, ``prompt`` optie maakt ``pam_u2f`` print ``Insert your U2F device, then press ENTER.`` en geeft u een kans om de Nitrokey te plaatsen. Als u op uw computer wilt inloggen met `Nitrokey Pro 2, <https://shop.nitrokey.com/shop/product/nk-pro-2-nitrokey-pro-2-3>`_ `Nitrokey Storage 2 <https://shop.nitrokey.com/shop/product/nitrokey-storage-2-56>`_ en `Nitrokey Start <https://shop.nitrokey.com/shop/product/nk-sta-nitrokey-start-6>`_ kunt u de instructies voor Windows `hier <https://www.nitrokey.com/documentation/applications#p:nitrokey-pro&a:computer-login&os:windows>`_ raadplegen, en voor Linux `hier <https://www.nitrokey.com/documentation/applications#p:nitrokey-pro&a:computer-login&os:linux>`_. Als u FIDO U2F-authenticatie alleen wilt gebruiken voor de grafische login van Gnome, kunt u misschien beter het volgende wijzigen ``/etc/pam.d/gdm-password`` Als u gevraagd wilt worden om de Nitrokey aan te raken, ``cue`` optie zal ``pam_u2f`` bericht afdrukken ``Please touch the device.``. In het geval dat u U2F voor een enkele gebruiker wilt instellen, en uit uw gebruikerssessie wordt vergrendeld, kunt u nog steeds inloggen met de ``<backup_user>``, en doorgaan met het onderhoud. In stap 7 hebben we de ``sufficient`` controle vlag gebruikt om het gedrag van de PAM module te bepalen wanneer de Nitrokey is aangesloten of niet. Het is echter mogelijk om dit gedrag te veranderen door de volgende controlevlaggen te gebruiken: In de linkerhoek klikt u op ``Unlock`` en dat vraagt u om uw wachtwoord Klik linksonder op ``Show Applications`` en typ instellingen in de zoekbalk als volgt: Instructies Inleiding Het wordt aanbevolen om de instructies eerst te testen met één gebruiker. Hiertoe neemt het vorige commando de ``-u`` optie, om een gebruiker op te geven, zoals in het voorbeeld hieronder: Log in op de website en schakel twee-factor authenticatie in uw accountinstellingen in. (In de meeste gevallen vindt u een link naar de documentatie van de ondersteunde webdienst op `dongleauth.com <https://www.dongleauth.com/>`_) Nitrokey FIDO U2F Nitrokey FIDO U2F met Linux Nitrokey FIDO U2F met Windows Nitrokey FIDO U2F met macOS Nitrokey FIDO2 geconfigureerd volgens `deze instructies <https://www.nitrokey.com/documentation/installation#p:nitrokey-fido-u2f&os:linux>`_. Merk op, de uitvoer zal veel langer zijn, maar gevoelige delen zijn hier verwijderd. Voor een betere beveiliging, en zodra het config bestand gegenereerd is, zullen we de ``.config/Nitrokey`` directory verplaatsen onder de ``etc/`` directory met dit commando: Op Ubuntu 20.04 is het mogelijk om direct ``libpam-u2f`` te downloaden van de officiële repos Als we klaar zijn met de voorbereidingen, kunnen we beginnen met het configureren van de computer om Nitrokey FIDO2 te gebruiken voor 2e factor authenticatie bij het aanmelden en ``sudo``. Zodra we de ``common-auth`` hebben aangepast, kunnen we het bestand opslaan en afsluiten. Zodra u klaar bent met stap 4 zou u klaar moeten zijn Zodra u de instructies in deze gids naar behoren hebt getest (en een back-up hebt gemaakt), is het aanbevolen om ofwel de ``required`` of de ``requisite`` controlevlag te gebruiken in plaats van ``sufficient``. Zodra u het bovenstaande commando uitvoert, moet u de toets aanraken terwijl het knippert. Eenmaal gedaan, zal ``pamu2fcfg`` zijn uitvoer toevoegen aan de ``u2f_keys`` in het volgende formaat: Open een van de `websites die FIDO U2F <https://www.dongleauth.com/>`_ ondersteunen. PAM modules Registreer uw Nitrokey FIDO U2F in de accountinstellingen door op de knop te drukken om de Nitrokey FIDO U2F te activeren. Nadat u het apparaat met succes hebt geconfigureerd, moet u de Nitrokey FIDO U2F elke keer dat u inlogt op deze manier activeren. Vereisten Scroll naar beneden in de rechterbalk naar ``Users`` Kies ``Administrator`` en voer de gebruikersnaam en het paswoord van uw keuze in Omdat we gebruik maken van Central Authentication Mapping, moeten we ``pam_u2f`` de locatie van het bestand opgeven dat we willen gebruiken met de ``authfile`` optie. De Nitrokey App kan niet gebruikt worden voor de Nitrokey FIDO U2F. De Nitrokey FIDO U2F kan met elke huidige browser worden gebruikt. De Nitrokey FIDO U2F ondersteunt **authenticatie met twee factoren (2FA)**. Bij authenticatie op basis van twee factoren (2FA) wordt naast het wachtwoord ook de Nitrokey FIDO U2F gecontroleerd. De output moet iets als het volgende zijn: Het bestand onder ``.config/Nitrokey`` moet de naam ``u2f_keys`` hebben. De laatste stap is het configureren van de PAM module bestanden onder ``/etc/pam.d/``. In deze handleiding zullen we het ``common-auth`` bestand aanpassen, omdat dit de authenticatie-instellingen afhandelt die voor alle services gelden, maar andere opties zijn mogelijk. U kunt het bestand wijzigen met het volgende commando: De eerste keer dat u de Nitrokey FIDO U2F aansluit, kan Windows enige tijd nodig hebben om het apparaat te configureren. De vlaggen ``required`` en ``requisite`` zorgen voor een strengere toegangscontrole, en maken de Nitrokey FIDO2 noodzakelijk om in te loggen en/of de geconfigureerde dienst te gebruiken. De volgende handleiding kan u mogelijk van uw computer afsluiten. U moet zich bewust zijn van deze risico's, want het is aanbevolen om de onderstaande instructies eerst op een tweede computer te gebruiken, of na een volledige back-up. De veilige toegang tot zo'n centrale software is bijzonder belangrijk en kan nu worden gerealiseerd met de Nitrokey. Daartoe wordt de toegang beveiligd met twee-factor authenticatie (2FA) en krijgen kritische gebruikers een Nitrokey. Voortaan wordt bij het inloggen van de gebruiker naast het gebruikerswachtwoord ook de Nitrokey gecontroleerd. Phishing-aanvallen worden zo verijdeld en uw bedrijfskritische gegevens zijn beschermd. De twee-factorauthenticatie kan worden uitgevoerd met eenmalige wachtwoorden (TOTP, RFC 6238) en FIDO U2F, waardoor Nitrokey Pro, Nitrokey Storage en Nitrokey FIDO U2F kunnen worden gebruikt. Het is ook mogelijk om de authenticatie centraal te configureren en deze alleen voor geselecteerde gebruikers te activeren. Er zijn verschillende PAM-modulebestanden die kunnen worden aangepast aan uw behoeften: Deze gids leidt u door de configuratie van Linux om FIDO Universal 2nd Factor te gebruiken, d.w.z. FIDO U2F met ``libpam-u2f`` en `Nitrokey FIDO2 <https://shop.nitrokey.com/shop/product/nk-fi2-nitrokey-fido2-55>`_>. Deze oplossing is ontwikkeld in samenwerking met onze partner `initOS <https://www.initos.com/>`_, die gespecialiseerd is in de ontwikkeling en aanpassing van Odoo. Als u geïnteresseerd bent, neem dan contact met ons op. Deze stap is optioneel, maar het wordt aangeraden om een backup Nitrokey te hebben in geval van verlies, diefstal of vernietiging van uw Nitrokey FIDO. Om het configuratiebestand te genereren gebruiken we het ``pamu2fcfg`` hulpprogramma dat wordt meegeleverd met de ``libpam-u2f``. Voor het gemak zullen we de uitvoer van het hulpprogramma direct wegschrijven naar het ``u2f_keys`` bestand onder ``.config/Nitrokey``. Sluit eerst uw Nitrokey FIDO2 aan (als u dat nog niet deed), en voer het volgende commando in: Om een backup sleutel in te stellen, herhaalt u de procedure hierboven, en gebruikt u ``pamu2fcfg -n``. Dit zal het ``<username>`` veld weglaten, en de uitvoer kan worden toegevoegd aan de regel met uw ``<username>`` zoals dit: Om te controleren of de bibliotheek correct is geïnstalleerd, voert u het volgende commando in: Problemen oplossen Twee-factorauthenticatie (2FA) Twee-factor authenticatie voor ERP-software Odoo Ubuntu 20.04 met Gnome Display Manager. Onder ``/etc/udev/rules.d`` download ``41-nitrokey.rules`` Gebruik Video: Twee-factor-authenticatie met de Nitrokey FIDO U2F in Odoo U kunt uw configuratie ook testen door uit te loggen uit de gebruikerssessie en weer in te loggen. Een gelijkaardig scherm zou moeten verschijnen wanneer u uw Nitrokey FIDO2 loskoppelt/weer aansluit en uw wachtwoord intypt: U kunt dit doen door deze commando's te gebruiken: U kunt de configuratie testen door ``sudo ls`` in de terminal te typen. U zou de melding ``Please touch the device.`` moeten krijgen en een vergelijkbare uitvoer op de terminal moeten krijgen: U zou de toegang tot uw gegevens kunnen verliezen na het configureren van `PAM-modules <http://www.linux-pam.org/Linux-PAM-html/>`_. U verliest ook de mogelijkheid om ``sudo`` te gebruiken als u Centrale Authenticatie Mapping hebt ingesteld *en* de ``required`` of ``requisite`` vlaggen hebt gebruikt. U zult de toegang tot uw computer verliezen als u de PAM-module verkeerd hebt geconfigureerd *en* de ``required`` of ``requisite`` vlaggen hebt gebruikt. `Kassa <https://www.nitrokey.com/documentation/applications#p:nitrokey-fido-u2f&os:all>`_ de verschillende gebruikssituaties en ondersteunde toepassingen. `Contact <https://www.nitrokey.com/contact>`_ `Odoo <https://www.odoo.com/>`_ is een krachtige ERP (Enterprise Resource Planning) software voor bedrijven van elke omvang. Odoo is beschikbaar als open source en bevat modules voor CRM, website/e-commerce, boekhouding, financiële boekhouding, productie, magazijnbeheer, projectbeheer, documentbeheer, enzovoort. ``optional``: Het succes of falen van deze module is alleen van belang als het de enige module in de stack is die bij dit service+type hoort. De vlag ``optional`` wordt als veilig beschouwd om voor testdoeleinden te gebruiken. ``required``: Dit is de meest kritische vlag. Het resultaat van de module moet succesvol zijn om de authenticatie te kunnen voortzetten. Deze vlag kan u van uw computer uitsluiten als u geen toegang tot de Nitrokey hebt. ``requisite``: Vergelijkbaar met ``required``, maar in het geval dat een specifieke module een fout teruggeeft, wordt de controle direct teruggegeven aan de toepassing, of aan de superieure PAM-stack. Deze vlag kan u ook van uw computer uitsluiten als u geen toegang tot de Nitrokey heeft. ``sufficient``: Het resultaat van de module wordt genegeerd als het mislukt. De vlag ``sufficient`` wordt als veilig beschouwd voor testdoeleinden. `nouserok` zorgt ervoor dat u nog steeds kunt inloggen met de gebruikersnaam en wachtwoord, u wilt dit misschien verwijderen zodra de setup werkt en u geen gewone gebruikersnaam & wachtwoord-gebaseerde logins meer wilt. 