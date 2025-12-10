# Scénario

## Hack
Un scenario est un fichier texte. On le place dans un sous répertoire de *&lt;orbiterBetaDir&gt;\\Scenarios*. Pour ce travail on crée *&lt;orbiterBetaDir&gt;\\Scenarios\\Hack*. Dans ce répertoire on ajoute un fichier Description.txt on y colle un texte de description entre les tags BEGIN_DESC et END_DESC. Ce texte est affiché pour le répertoire dans le launcher orbiter.

ATTENTION: La lecture des fichiers scn ci dessous, se base sur la lecture de fichiers de sauvegarde. Donc, il y a aussi des paramètres de vol qui peuvent davantage s'apparenter à de la sauvegarde. Il reste que c'est cependant un état de départ qui constitue bien un scénario. Mais c'est délicat d'interpréter des paramètres de vol, la mémoire d'un AGC, ou autre... Et encore plus délicat de vouloir les initialiser. Donc, pour les valeurs de certains paramètres il vaut mieux les copier depuis une sauvegarde marquant un état de vol. Pour une Saturn V initiale, par exemple, cela vaut il le coup de partir d'un autre état que sur la rampe de lancement?

On travaille dans des fichiers de version nnn.scn.

Scenario Editor: CTRL+F4

## Sections de scenario:
- **Description**: BEGIN_DESC, END_DESC contient un texte affiché dans le launcher orbiter.  
  Il est possible aussi d'utiliser du HTML dans une section BEGIN_HYPERDESC, END_HYPERDESC. Pas de tags html/body nécessaires. 
- **Environnement**: BEGIN_ENVIRONMENT, END_ENVIRONMENT. Contient les informations sur le monde environnant.  
  - **System**: Système solaire fichier cfg. Dans NASSP c'est un répertoire qu'il faut utiliser: *&lt;orbiterBetaDir&gt;\\beta\\Config\\ProjectApollo\\Sol_VirtualAGC*.  
  Donc: *System ProjectApollo\Sol_VirtualAGC*.  
  **NOTA BENE:** Pour avoir un VAB complet avec les échafaudages intérieurs, et plus globalement lorsqu'on est au sol. Il faut utiliser:  
  *System ProjectApollo\Sol*
  - **Date**: Date et heure de démarrage du scénario en MJD (Modified Julian Date). On trouve un calculateur Julian days calculation à qui il faut donner l'heure et la date en UTC. On garde 6 décimales.  
  NOTA: Sur le document Press Kit Apollo 11 (*files\doc\A11\a11-press-kit1.pdf*), page 18 (pdf 24/106), on a un résumé du compte à rebours depuis son démarrage. Ca commence à T-28h. Il est à noter que les piles à combustible ont été démarrées dans les 5 jours précédant ce compte à rebours. Documentation à propos des opérations sur le véhicule les jours précédents: *Apollo / saturn V Space Vehicle Countdown vol II/II* (*files\doc\A16\apollo-saturnV-space-vehicle-countdown-vol-2*).  
  Si on veut un début pour les opérations on peut choisir T-8h 30mn: Astronaut backup crew to spacecraft for prelaunch checks. L'équipage embarque à T-2h 40mn (arrivée au LC-39B à T-2h 55mn).  
  Dans [https://www.nasa.gov/history/afj/ap11fj/01launch.html](https://www.nasa.gov/history/afj/ap11fj/01launch.html) on apprend que pour Apollo 11, l'équipage a été réveillé à 04:15EDT (T-5h 17mn), petit déjeuner à T-3h 30mn). Ce qui donne des idées du déroulement des opérations avant lancement.  
  - **Help**: Visiblement, cette directive surcharge la description et fait apparaître une page d'aide dans le launcher. Le chemin vers cette page est relatif à *&lt;orbiterBetaDir&gt;\\Html\\Scenarios*. C'est une page HTML xxx.html et son sous répertoire xxx. On l'appelle par path\relatif\to\xxx sans préciser l'extension .html. Peut-être ca fonctionne avec d'autres formats.  
  - **Script**: Fichier de script Par exemple dans le scenario *Solar System* le script *solsys2016* correspond à ./beta/Script/solsys2016.lua.
- **Focus**: BEGIN_FOCUS, END_FOCUS contient une seule ligne.  
  - **Ship**: nom_de_vaisseau. Le nom de vaisseau doit correspondre à un des vaisseaux dans la section correspondante (vaisseaux). C'est le vaisseau qui a le focus au début du scénario (celui dans lequel on se trouve).  
- **Camera**: Définit la position initiale de la caméra en début de scénario. BEGIN_CAMERA, END_CAMERA. Ce sont les réglages qu'on retrouve dans la pop-up camera de orbiter.  
  - **TARGET**: Le vaisseau cible de la caméra. On doit prendre un nom de vaisseau valide. Correspond à l'onglet target de la popup camera.  
  - **MODE**: Cockpit ou Extern. Correspond au boutons Focus cockpit, ou focus extern dans la popup camera onglet target.
  - **POS**: Coordonnées de la caméra.  
  - **TRACKMODE**: TargetRelative, AbsoluteDirection ou GlobalFrame, peut être d'autres cf. popup camera onglet Track.
  - **FOV**: Field of vision en °, cf. Onglet FoV.  
Concernant les sections Focus et Camera, pour éditer un scénario, le plus simple est de fixer des sections Focus et Camera par défaut, puis démarrer le scénario et éditer la position que l'on souhaite avoir au démarrage depuis l'onglet Camera dans Orbiter. Ensuite, on sauvegarde, et on récupère les sections qu'on copie dans le scénario.  
- **Panel**: BEGIN_PANEL, END_PANEL, je ne sais pas à quoi ça sert.  
- **Ships**: Impossible de détailler la section exhaustivement ici. C'est taggué par BEGIN_SHIPS, END_SHIPS. C'est en général la dernière section du fichier scénario. Dans cette section on trouve tous les vaisseaux disponibles dans le scenario. On peut trouver cette liste dans orbiter popup ships, mais cette liste n'est pas complète, elle ne contient que les vaisseaux habitables. En réalité il y en a davantage, la liste exhaustive se trouve dans la popup function/scenario editor.  
  NOTA: Un ship n'est pas forcément un vaisseau, ca peut aussi être un bâtiment ou une structure fixe.  
  Chaque vaisseau commence par une ligne ainsi formée:  
  ```  
  Nom_de_vaisseau: type_de_vaisseau.  
  ```  
  La section ship se termine par END.  
  Les types de vaisseaux disponibles sont les fichiers dll disponibles dans *&lt;orbiterBetaDir&gt;\\Modules* et sous répertoires. On définit le type par le chemin relatif du fichier dll sans extension. Impossible de lister ici tous les items disponibles, il faut fouiller.  
  Il y a un certain nombre de paramètres génériques ou usuels pour chaque ship
  - **STATUS**: Ca peut être Orbiting ou Landed suivi du corps céleste concerné.
  - **POS**: Si le vaisseau est posé on a ses coordonnées.
  - **HEADING**: Si le vaisseau est posé on a son orientation..
  - **RPOS**: Si le vaisseau orbite sa position.
  - **RVEL**: Si le vaisseau orbite sa vitesse.

Ensuite chaque vaisseau a son paramétrage et les variables associées. Impossible de les lister.

## Vaisseaux
Il est important de saisir que les vaisseaux peuvent être créés en cours de route au gré des séparations. En particulier la Saturn V donne des étages, l'IMU le CSM, le LEM etc...  

Voici quelques vaisseaux et caractéristiques (paramètres) notables.

### ProjectApollo\Saturn5: 
Assemblage complet Saturn V.
- **STATUS**: Avant décollage=Landed Earth.
- **BASE**: Cape Canaveral:2. Fait référence au fichier *&lt;orbiterBetaDir&gt;\\Config\\ProjectApollo\\Earth\\Base\\Canaveral.cfg* je ne sais pas à quoi sert :2 à la fin. Mais: 
  1=Skylab 1
  2=Apollo 4, 6, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, Apollo Soyouz, Skylab 1, Skylab 2
  3=Apollo 2, 5, 7
- **POS**: Coordonnées au sol, -80.6041140 28.6082888=LP-B
- **HEADING**: Azimuth de position au sol (pour une fusée verticale, bof!) 270°.
- **ALT**: Altitude de je sais pas bien quel point, peut être le barycentre. LP-B=81.840.
- **AROT**: ??? Ca tourne? Il semblerait juste qu'ils'agisse de la rotation 3D de l'objet relativement à un repère local horizontal. Donc sur un axe (l'axe vertical) ça fait la même chose que HEADING.
- **PRPLEVEL**: Contenance de tous les réservoirs 1.0=MAX
- **STAGE**: Etat du lanceur (on est centré sur le CSM qui fait quasiment tout le voyage).   
  Fichier source: Orbitersdk/samples/ProjectApollo/src_sys/nasspdefs.h  
  - NULL_STAGE 0 ///< Non-existent; should never happen.  
  - ROLLOUT_STAGE 1 ///< Rolling out from the VAB to the pad.  
  - ONPAD_STAGE 3 ///< On the pad.  
  - PRELAUNCH_STAGE 5 ///< Getting ready to launch.  
  - LAUNCH_STAGE_ONE 11 ///< Stage one of the launch.  
  - LAUNCH_STAGE_TWO 12 ///< Stage two of the launch, prior to interstage jettison (if appropriate).  
  - LAUNCH_STAGE_TWO_ISTG_JET 13 ///< Stage two of the launch, after interstage jettison.  
  - LAUNCH_STAGE_SIVB 20 ///< SIVB burn during launch.  
  - STAGE_ORBIT_SIVB 21 ///< SIVB in orbit.  
  - CSM_LEM_STAGE 30 ///< CSM in space, optionally with LEM.  
  - CM_STAGE 40 ///< CM separated from SM.  
  - CM_ENTRY_STAGE 41 ///< CM in entry.  
  - CM_ENTRY_STAGE_TWO 42  
  - CM_ENTRY_STAGE_THREE 43  
  - CM_ENTRY_STAGE_FOUR 44  
  - CM_ENTRY_STAGE_FIVE 45  
  - CM_ENTRY_STAGE_SIX 46  
  - CM_ENTRY_STAGE_SEVEN 47  
  - CM_RECOVERY_STAGE 48 ///< CM in water waiting for recovery.  
- **VECHNO**: Vehicule number (?) example: 506=AS-506 de Apollo 11.
  The Saturn vehicle number: typically this will be in the 200s for a Saturn 1b, and 500s for a Saturn V. This is used to name the separated stages and components of the spacecraft.
- **APOLLONO**: Numéro de mission Apollo. Vus: 0, 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 1301, 14, 15, 16, 17. Apollo mission number. This is used to provide mission-specific systems and events such as mission audio or system failures. This has to be a numeric value and it will load the mission file from the Missions/ProjectApollo/ folder with the name "Apollo X.cfg", with X standing for the number after APOLLONO. If a non-numeric mission file is desired, use the MISSION parameter instead.  
  - 0= Missions fictives ou hors Apollo 2 à 17 (Apollo Soyouz, Skylab)  
  - 1301=Autre version de Apollo 13 mais laquelle?  
- **SATTYPE**: Type de Saturn.  
  - 1=Saturn V  
  - 2=Saturn 1b  
  - 4=Saturn INT-20  
- **PANEL_ID**: ??? Panneau de CSM affiché au début du scénario? 0=défaut.  
- **VIEWPOS**: Probablement la position de vue en cabine au démarrage.  
- **TCP**: Specifies the height of the rocket above the ground in meters prior to launch. This can be adjusted if the mission is flown from a different launch pad to the default for the spacecraft (e.g. the Skylab 'milk stool' for the Saturn 1b).  
- **MISSNTIME**: Nombre de secondes écoulées depuis GET 0 (négatif avant). Ca pourrait bien être la même chose que **TOUCHDOWNPOINTHEIGHT**.  
- **NMISSNTIME**: Peut-être un offset pour GET 0. Ou pour faire démarrer la mission à autre chose que GET 0.  
- **DLS**: Mettre à 1.  
  Set to 1 to delete the launch site when the spacecraft passes out of visible range. This can give a significant performance boost on slow machines.  
- **STAGESTATUS**: ??? 0  Il se peut que ce soit une surcharge de STAGE, mais c'est pas sûr.
- **MAINSTATE**: ???  
- **ATTACHSTATE**: bitmask de l'état du véhicule.  
  Specifies which 'things' are attached to the spacecraft. This is a bit-field, created by combining the following values as appropriate.  
  Defaults are generally safe to use, but you may need to specify the value in the scenario for unusual missions (e.g. Apollo 5 with no LES or CSM and a nosecap uses 93).  
  - 1 The interstage is attached.  
  - 2 The LES is attached.  
  - 4 There is a docking probe.  
  - 8 The Apex Cover is attached.  
  - 16 The parachutes are attached.  
  - 32 There is a CSM on the launcher.  
  - 64 If there is no CSM, there is a nosecap on the SLA panels.  
- **LIGHTSTATE**: Probablement une option d'éclairage au début du scénario.  
- **SIFUELMASS**: Specifies the mass in kilograms of the fuel in the first stage (S-IC or S-IB).  
- **SIIFUELMASS**: Specifies the mass in kilograms of the fuel in the second stage (S-IVB for Saturn 1B or S-II for Saturn V). This is not used for the INT-20.  
- **S4FUELMASS**: Specifies the mass in kilograms of the fuel in the S-IVB stage of Saturn V and derivatives.  
- **SIEMPTYMASS**: Specifies the empty mass in kilograms of the first stage (S-IC or S-IB).  
- **SIIEMPTYMASS**: Specifies the empty mass in kilograms of the second stage (S-IVB for Saturn 1B or S-II for Saturn V). This is not used for the INT-20.  
- **S4EMPTYMASS**: Non documenté mais évident.  
- **INTERSTAGE**: Probablement la masse de l'interstage.  
- **PRELAUNCHATC**: ??? 0  
- **SLASTATE**: Les SLA (Spacecraft Launch Adapter) sont les panneaux entre la SIVb et le CSM qui protègent le LM. Specifies the state of the SLA panels on the SIVB. Bit 8 should be set to 1 if the panels are hinged, or 0 if they separate from the SIVB. Bits 0-7 specify the angle to which they will open if hinged, defaulting to 45 degrees with an upper limit of 150 degrees; if they're not hinged, they currently always separate at 45 degrees.  
  In most cases the default will work fine (hinged to 45 degrees on Saturn 1b, not hinged on Saturn V), but special missions may require manually setting this state. For example for hinged panels opening to 150 degrees use "SLASTATE 150" in the scenario.  
- **SMFUELLOAD**: Sans doute la quantité de fuel du Service Module.  
- **SMMASS**: Sans doute la masse totale du Service Module (ou sans fuel?).  
- **CMFUELLOAD**: Sans doute la quantité de fuel dans le Command Module.  
- **CMMASS**: Sans doute la masse totale du Command Module (ou sans fuel?).  
- **LMPADCNT**: Nombre de lignes LMPAP à suivre.  
  Sets the number of LEM PAD entries. The LEM PAD is saved in a table until the LEM is created, so the DLL needs to know how large a table to create. Any values beyond this count will be ignored.
- **LMPAD**: Données de l'AGC LEM, tant que le vaisseau associé n'a pas été créé.  
  Set a Virtual AGC erasable memory location in the LM AGC to a specified value. Addresses and values are both specified in octal (base-8), so to set address 10 (decimal) to 17 (decimal) you would specify EMEM0012 21. If the scenario uses the C++ AGC rather than Virtual AGC, these values are ignored.  
  Note that the LEM PAD is loaded when the LEM is created, so setting these values when the LEM already exists in the scenario will have no effect.  
- **AEAPADCNT, AEAPAD**: Système analogue non identifié.  
- **AUTOSLOW**: 1 Met automatiquement la simulation en temps réel (arret accélération) quand nécessaire.  
  Set to 1 to slow to 1x time acceleration when 'something important' happens. For manned flights, this is typically when a piece of mission audio is played, for unmanned flights it is typically a stage separation, engine burn, etc
- **WIDESLA**: Use wide ELS-type SLA panels. ??? Il y aurait différents modèles de SLA? En général 0.  
- **CUSTOMPAYLOADMASS**: On doit pouvoir rajouter de la masse "custom" j'imagine.  
- **LANG**: Visiblement on peut changer la langue pour l'audio, le mieux est de laisser ça à English.  
  Set to the appropriate string for the audio language you want to use. Currently we only ship English audio, but if, say, you downloaded a French audio add-on you could set this to French instead and the French files would take precedence.  
- **PAYN**: Nom de la charge de la SIVb (du LEM).  
  Sets the payload vessel name (e.g. Eagle for the Apollo 11 LEM). This is the name the SIVB payload will be given when it is created; LEMN can be used as a synonym.  
- **LEMCHECK**: Checklist LEM, exemple: Doc\Project Apollo - NASSP\Checklists\Apollo 11 LM Checklists.xls  
- **LMDSCFUEL**: Masse de fuel dans l'étage de descente du LEM.  
- **LMASCFUEL**: Masse de fuel dans l'étage de montée du LEM.  
- **LMDSCEMPTY**: Masse à vide de l'étage de descente du LEM.  
- **LMASCEMPTY**: Masse à vide de l'étage de montée du LEM.  
- **COASENABLED**: Indique l'état du COAS (viseur d'acostage) on/off.  
- **ORDEALENABLED**: Indique si le ORDEAL est en fonction.  
- **OPTICSDSKYENABLED**: Sans doute si le DSKY est allumé ou non.  
- **HATCHPANEL600ENABLED**: Sans doute pour indiquer si les pannels 600, 601, 602 sont affichés ou non.  
- **PANEL382ENABLED**: Idem pannel 382  
- **FOVFIXED**: Sans doute une bride sur le field of vision mais pas compris.  
- **FOVSAVE**: Sans doute la valeur de field of vision sauvegardée.  
- **BUILDSTATUS**: Ce paramètre est à tester, mais il semble qu'il décrive l'état de contruction de la Saturn. 0=rien, 5=pret pour le déménagement vers le pas de tir. Il est intéressant de voir le code source:  
  files/src/NASSP-Orbiter2016/Orbitersdk/samples/ProjectApollo/src_saturn/sat5mesh.cpp:void SaturnV::ChangeSatVBuildState (int bstate)files/src/NASSP-Orbiter2016/Orbitersdk/samples/ProjectApollo/src_saturn/sat5mesh.cpp: void SaturnV::ChangeSatVBuildState (int bstate)  
  Dans le code source les buildstatus de 0 à 5 font évaluer le mesh. Il existe aussi un status 6 qui semble correspondre à une Saturn prête au décollage.  

T1V, I1S, I1V, SIENG, T2V, I2S, I2V, T3V, I3V, SIIENG, SIIIENG sont semble-t-il des paramètres de boost. Quand ils sont présents (pas toujours) ils contiennent toujours les même valeurs sauf pour A5, A7, et A8. On dirait que ces valeurs ont été calculées puis injectées dans le fichier de sauvegarde qui a créé le scénario.

Suivent une quantité de sections que je ne veux pas détailler.  
FAILURES_BEGIN, FAILURES_END  
INERTIAL_DATA_BEGIN, INERTIAL_DATA_END  
DSKY_BEGIN, DSKY_END: sans doute l'affichage DSKY en cours  
DSKY2_BEGIN, DSKY2_END: sans doute l'affichage DSKY LEM en cours  
AGC_BEGIN, AGC_END: AGC options are specified between AGC_BEGIN and AGC_END. Options outside those lines will be ignored. Notons ONAME Eagle dans cette section  
IMU_BEGIN, IMU_END  
... y'a tous les systèmes  
NOTE: LVDC_BEGIN and LVDC_END contient tout l'automatisme de lancement. Détaillé ici: https://nassp.space/index.php/Scenario_File_Options  
En particulier il y a une directive FILE qui pointe vers un fichier flight sequence spécifique à chaque vol.
PANELSWITCHES_BEGIN, PANELSWITCHES_END: état de tous les boutons (avec leur nom informatique c'est intéressant pour les checklists).  

Il y a une section &lt;checklist&gt;&lt;/checklist&gt; qui contient en particulier:  
- **FILE**: chemin relatif vers le fichier de checklist depuis *&lt;orbiterBetaDir&gt;*.  
- **COMPLETE**: ??
- **AUTO**: Mode automatique 0/1.
- **FLASHING**: Mode flash 0/1.
- **LASTITEMTIME**: ???
- **AUTOEXECUTESLOWDELAY**: ???
- **WAITFORCOMPLETION**: ???
Après il y a tout un bazar d'index item, sans doute l'état de l'affichage au démarrage. Des indications de temps aussi.  

Comme indiqué plus haut l'analyse ci dessus s'apparente plutôt à l'analyse d'une sauvegarde. Si on regarde un fichier scenario pur (lancement A11), on constate que:  
On a bien les paramètres environnement, focus, camera, pannel vide (sans doute défaut). Pour la saturn V, on a tout le début de configuration, inclus LMPAD, LVDC relativement élaboré. Une section CMPAD. Mais rien sur l'état du lanceur. FAILURE DSKY, IMU, etc.. Ni même la position des boutons. On est sans doute en configuration par défaut.

### ProjectApollo\Crawler
Le crawler qui permet le transport de la fusée du VAB au pas de tir. Ca se pilote!  

### ProjectApollo\ML
Mobile Launcher=tour de lancement mobile.  
Il y en a 3 ML-1 (rebaptisé plus tard MLP-3), ML-2 (rebaptisé plus tard MLP-2), ML-3 (rebaptisé plus tard MLP-1).  
Code source Orbiter qui contient la définition du ML: NASSP-Orbiter2016/Orbitersdk/samples/ProjectApollo/src_launch/ML.cpp.  
A04: ML-1, non spécifié=-86.677000000000  
A06: ML-2, non spécifié=-86.677000000000  
A08: ML-1, non spécifié=-86.677000000000  
A09: ML-2, non spécifié=-86.677000000000  
A10: ML-3, non spécifié=-86.677000000000  
A11: ML-1, non spécifié=-86.677000000000, scenario assembly -71.827, scenario rollout: -71.827  
A12: ML-2, non spécifié=-86.677000000000  
A13: ML-3  
A14: ML-2  
A15: ML-3  
A16: ML-3  
A17: ML-3  
Skylab 1: ML-2  
Skylab 2: ML-1  
Skylab 3: ML-1  
Skylab 4: ML-1  

- **ASTP**: ML-1  
- **STATUS**: Landed Earth  
- **POS**: Position. Il existe des positions particulières intéressantes.  
- **TOUCHDOWNPOINTHEIGHT**: Ce point est pas hyper clair. Il règle la position en hauteur du ship (ML) mais relativement à quoi? Mystère! Ca pourrait bien être la même chose que **TCP**.
Par défaut sa valeur est: -86.677000000000. Dans le VAB on trouve une valeur de -71.827. Idéalement c'est mieux de mettre: -71.440
- **LVNAME**: Nom du Launch Vehicule porté.
- **STATE**: Etat du launch module. Le code source dit:
  - STATE_VABBUILD -2
  - STATE_VABREADY -1
  - STATE_ROLLOUT 0
  - STATE_PRELAUNCH 1
  - STATE_CMARM1 2
  - STATE_CMARM2 3
  - STATE_TERMINAL_COUNT 4
  - STATE_SICINTERTANKARM 5
  - STATE_SICFORWARDARM 6
  - STATE_IGNITION_SEQUENCE 7
  - STATE_LIFTOFFSTREAM 8
  - STATE_LIFTOFF 9
  - STATE_POSTLIFTOFF 10
- **HOLD**
- **COMMIT**
On classe du haut vers le bas:
- **CRANEPROC**: Rotation horizontale de la grue sommitale (1/4 de tour max) de 0.0 à 1.0.
- **DAMPERARMPROC**: Amortisseur. 1-3 (plutôt 3 pourquoi?) 0.0 déplié, 1-3 1.0 replié dans la tour.
- **CMARMPROC**: Command Module Access Arm. 0.0 access, 1.0 retiré. Pivote horizontalement.
- **SWINGARMPROC**: Tous les bras qui se replient au dernier moment. 3 0.0 déplié, 3 1.0 replié dans la tour.
- **S2INTERPROC**: S-II Intermediate. 3 0.0 déplié, 3 1.0 replié dans la tour.
- **S2AFTARMPROC**: S-II Aft (preflight). 3 0.0 déplié, 3 1.0 replié dans la tour.

- **S1CINTERTANKARMPROC**: S-IC Intertank. Valeurs idem.
- **S1CFORWARDARMPROC**: S-IC Forward. Valeurs idem.
- **MASTPROC**: Allimentations à la base du lanceur. Valeurs idem.
- **MASTCOVERSPROC**: Quelque chose à la base du lanceur. Valeurs idem.

### ProjectApollo\VAB 
Le VAB.  
Il existe une bonne quantité de paramètres disponibles pour le VAB. Mais avant toute chose voyons avec précision sa localisation qui est erronée dans certains scénarios.
- **STATUS**: Landed Earth  
- **POS**: -80.6509830 28.5860480  
- **HEADING**: 75.04  
Il y a même une propriété ALT, mais il semble qu'elle soit calculée mécaniquement.
- **ALT**: -0.234
Spécifique:
- **CURRENTANIMCRANE**: Anmiation???? Mais pourquoi 2?
- **ADJUSTSATURNSTAGE1**: Paramètre d'animation?
- **CRANESTATUS**:
- **HIGHBAY1DOORSTATUS**:
- **HIGHBAY3DOORSTATUS**:
- **LVVISIBLE**:
- **CRANEPROC**:
- **SATURNSTAGE1PROC**:
- **HIGHBAY1DOORPROC**:
- **HIGHBAY3DOORPROC**:
- **PLATFORMPROC0**:
- **PLATFORMPROC1**:
- **PLATFORMPROC2**:
- **PLATFORMPROC3**:
- **PLATFORMPROC4**:
- **LVNAME**: Launch vehicule name.

### ProjectApollo\MSS
Mobile service structure.  
https://apollolaunchcontrol.com/v20test/http___www.apollolaunchcontrol.com_/Mobile_Service_Structure.html

### ProjectApollo\Floodlight 
Des éclairages du site.  

### ProjectApollo\MCC
Le MCC, Mission Contol Center à Houston (on peut y aller aussi comme dans un vaisseau)  


## Documentation: 
- Documentation pour développeurs: *files/sources/orbiter-main/Doc/Orbiter Developer Manual/SCENARIO.tex* (format LaTex, qu'on peut ouvrir avec MiKTeX).
- [OrbiterWiki - Scenarios](https://www.orbiterwiki.org/wiki/Scenarios)
- [Youtube - Tutorial: Scenario Editor (Orbiter 2016)](https://youtu.be/Oihdfc8sWSU?si=_m_mkWzqYDMyiXTJ)
- [NASSP - Scenario file options](https://nassp.space/index.php/Scenario_File_Options)
- [Dan's Orbiter Page - Gestion des points d'attache](http://orbiter.dansteph.com/forum/index.php?topic=13902.0): Cet échange évoque comment les vaisseaux sont liés, mais aussi l'emplacement des fichiers de configuration vaisseaux. Très intéressant!
