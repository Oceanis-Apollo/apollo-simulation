# Notes

## Installer Orbiter
Sur le document NASSP 8 Installation Guide, on peut lire que NASSP 8 ne fonctionne qu'avec Orbiter beta r 90 (r90 pour révision 90 dans SVN). Or, pour faire fonctionner *Orbiter beta* on a besoin des textures d'un Orbiter standard (on va dire *Orbiter raw*).  
**NOTE:** D'autres semblent indiquer qu'installer la dernière version téléchargeable d'Orbiter (donc Orbiter raw) peut suffire.

### Installer Orbiter raw
Sur la page de téléchargement du projet Orbiter 2016, télécharger le ZIP Installer (fichier *Orbiter2016.zip*). Choisir un répertoire d’installation qu’on désigne ensuite dans cette documentation par *&lt;orbiterRawDir&gt;* (par exemple: *P:\orbiter\raw*). Éviter d’avoir des espaces ou caractères spéciaux dans le chemin de ce répertoire. Dézipper *Orbiter2016.zip* comme racine de ce répertoire.

### Installer Orbiter beta
Comme indiqué sur la page Orbiter - Beta installation, il est conseillé d'utiliser le client graphique SVN, Tortoise. On installe donc Tortoise, et on effectue un checkout de *svn://svn.orbiter-forum.com/orbiter* dans le répertoire qu'on désigne *&lt;orbiterBetaDir&gt;* (par exemple: P:\orbiter\beta). On prend garde à bien récupérer la version 90+ (HEAD).

Alternative: Il existe un zip de cette version sur Orbiter Forum - Orbiter Beta 90.

Copier le répertoire *&lt;orbiterRawDir&gt;\\Textures\\* sur *&lt;orbiterBetaDir&gt;\\Textures\\* et accepter toutes les surcharges. Le répertoire *&lt;orbiterRawDir&gt;*; devient obsolète et peut donc être effacé.

On vérifie que l’installation est correcte en démarrant Orbiter beta: dans *&lt;orbiterBetaDir&gt;*, le fichier orbiter.exe (pas orbiter_ng.exe), et en sélectionnant un scénario, par exemple *2016 Edition/Solar System*. C’est l’opportunité de profiter une première fois du spectacle que peut offrir Orbiter en terme de rendu en visitant le système solaire.
NOTE: La première fois ça peut crasher. Il peut être nécessaire de relancer plusieurs fois. Les crashs sont d'ailleurs courants en général, il faut bien l'admettre.

## Installer les textures haute résolution
Afin d’obtenir une simulation réaliste, on installe des textures haute résolution. Ce sont de très très gros fichiers, mais qui donnent un rendu bien meilleur. L’idée ici, est de n’installer que les textures dont nous avons besoin; la Terre et la Lune. Encore que pour la Terre ce paraisse presque optionnel, car on décolle de Cap Canaveral qui est assez bien rendu par défaut, et ensuite on reste en orbite assez peu de temps. Mais on veut faire les choses correctement, on installe aussi les textures terrestres.

On se rend sur la page *Orbiter – Textures*. On télécharge Earth complete et Moon complete.
On déplace les fichiers de texture de la lune (Moon) qu’on a téléchargés: *Elev.tree*, *Label.tree*, et *Surf.tree*, dans *&lt;orbiterBetaDir&gt;\\Textures\\Moon\\Archive*. Cela conduit à écraser les fichiers basse résolution *Elev.tree* et *Surf.tree*.
Pour la Terre, on l’a dit, l’installation des textures haute résolution peut être optionnelle. Si on l’effectue. on installe les fichiers de la Terre (Earth): *Cloud.tree*, *Elev.tree*, *Label.tree*, *Elev_mod.tree*, *Mask.tree*, et *Surf.tree* dans le répertoire *&lt;orbiterBetaDir&gt;\\Textures\\Earth\\Archive*. On écrase là aussi les fichiers basse résolution.
Pour tester que tout est OK, on ouvre un scénario. Par exemple le *Delta Glider/Brighton Beach* qui est sur la lune.

## Installer D3D9Client
Le logiciel Orbiter qu’on vient d’installer dispose d’un moteur de rendu graphique embarqué. Cependant, il existe un moteur graphique de bien meilleure qualité appelé *D3D9*. Il est indispensable de l’installer.

On le télécharge sur la page Orbiter Forum - D3D9 for Orbiter Beta 30.7. Prendre garde de bien prendre la version pour Orbiter 2016 Beta r90 (D3D9ClientBeta30.7-forBETA r90(r1436)) qu'on dézippe en racine de *&lt;orbiterBetaDir&gt;*.
On démarre cette fois-ci *Orbiter Server* (icône bleue) en lançant le fichier *orbiter_ng.exe* dans *&lt;orbiterBetaDir&gt;*.

Il faut modifier la configuration:
```
Video/Advanced (configuration de D3D9)
    Graphic options/Enable absolute animation handling: coché.
    Reflections and custom camera settings/Reflection mode: Full scene
    Appuyer sur le bouton Create symbolic links. Si ça ne fonctionne pas avec le bouton, on crée manuellement un lien <orbiterBetaDir>\Modules\Server\Config\Config vers <orbiterBetaDir>\Config (ça a l'air de fonctionner). PAS SUR!
```

Dans l’écran de démarrage on va dans l’onglet *Modules* et on active *Graphic Engines/D3D9Client*.
On vérifie aussi la résolution dans l’onglet *Vidéo*. Soit on se place en mode Window en définissant la résolution de son choix. Soit on passe en *Full Screen*, et là encore il faut choisir une résolution convenable.
On lance un scénario pour vérifier que tout fonctionne correctement.

## Installer les micro textures
Pour considérablement améliorer la texture du sol lunaire, et la rendre réaliste lorsqu’on est proche du sol, on utilise un add-on qui va produire des textures procédurales. Il s’agit du MicroTexture pack. Disponible sur Orbiter Forum - D3D9 MicroTexture Pack. qu'on dézippe en racine de *&lt;orbiterBetaDir&gt;*.

NOTE: On trouve la configuration des micro textures dans *Video/Advanced* (configuration de D3D9). On peut garder la configuration par défaut.

On vérifie la présence des micro textures en observant que le sol lunaire est bien granuleux sur le scénario *Delta Glider/Brighton Beach*. ATTENTION: les micro textures ne sont présentes qu'avec D3D9 (*orbiter_ng.exe*).

## Installer Apollo Landing Sites for Orbiter 2016
On télécharge une version détaillée des sites d’atterrissage des missions Apollo sur la page Apollo Landing Sites for Orbiter 2016. On dézippe les archives en racine de *&lt;orbiterBetaDir&gt;*.

Pour obtenir le meilleur résultat avec ces versions détaillées des sites, il faut aussi agir sur la configuration.
```
Visual Effects
    Surface elevation using: linear interpolation.
    Max resolution level: 18
    Video/Advanced: Terrain resolution/Mesh resolution: 64
```
Dans les fichiers Moon.cfg (il peut y en avoir un peu partout *&lt;orbiterBetaDir&gt;\\Config\\Moon.cfg*, *&lt;orbiterBetaDir&gt;\\Config\\ProjectApollo\\Moon.cfg*, *&lt;orbiterBetaDir&gt;\\Config\\AMSO\\Moon.cfg*...) il faut vérifier qu'on a bien les deux lignes:
```
ElevationResolution = 0.5
MaxPatchResolution = 18
```

## Installer XRSound
NOTE: Orbiter Sound a été porté pour Orbiter 2016 beta. Donc on peut l'installer aussi... Mais NASSP dispose d'une configuration spéciale pour XRSound.

L'installation de XRSound consiste à dézipper l'archive *Orbiter Forum - XRSound Official 2.0* en racine de *&lt;orbiterBetaDir&gt;*. Ne pas oublier d'activer le module dans le launcher.

## Installer NASSP
Prendre la dernière release disponible sur *Github - orbiternassp / NASSP*. Installer cette archive en racine de *&lt;orbiterBetaDir&gt;*. Et on fait pareil avec le fichier d'archive *NASSP-XRSound-Config-V8.0-Beta-Orbiter2016-nnnn.zip* qui se trouve sur la même page.

## Installer Mission Timer MFD
Télécharger *Mtimer.zip* et l'installer en racine de *&lt;orbiterBetaDir&gt;*.

## Installer Absolute killrot MFD
Télécharger *AbsoluteKillrot v.1.2* et l'installer en racine de *&lt;orbiterBetaDir&gt;*.

## Installer HUDdataMFD
Télécharger *HUDdataMFD v1.2*. Copier *HUDdataMFD.dll* et *HUDdataMFD.cfg* dans *&lt;orbiterBetaDir&gt;\\Modules\\Plugin\\*. On peut retoucher le fichier *HUDdataMFD.cfg*.

## Installer Interplanetary MFD 5.7
Télécharger *Interplanetary MFD 5.7* et l'installer en racine de *&lt;orbiterBetaDir&gt;*.

## Installer LunarTransfer MFD (LTMFD) 1.6
Télécharger *LunarTransfer MFD (LTMFD) 1.6* et l'installer en racine de *&lt;orbiterBetaDir&gt;*.

## installer Multistage2015 - for Orbiter 2016
Télécharger *Multistage2015 - for Orbiter 2016* et compléter la configuration
```
Parameters
    Realism
        Complex flight model: coché.
        Limited fuel: coché.
        Tout le reste décoché.
    Perturbations
        Nonspherical gravity sources: coché.
        Tout le reste décoché.
Visual effects
    Planetary effects
        Surface elevation using: linear interpolation (vu plus haut, double check).
        Max resolution: 18 (vu plus haut, double check).
    General effects: Tout coché.
        Ambiant light level: 120.
Extra
    Vessel configuration / Project Apollo configuration / Miscelaneous
        Maw time acceleration: 20.
Modules
    D3D9client
    MtimerMFD
    AbsoluteKillrot
    HUDdataMFD
    InterMFD57
    LunarTransferMFD
    Multistage2015_MFD
    XRSound
    ProjectApolloMFD
    ApolloRTCCMFD
    CustomMFD
    ScnEditor
```

## Création de scénarios
### Fichiers de travail
- *&lt;orbiterBetaDir&gt;\\Scénarios\\Hack*
- *&lt;orbiterBetaDir&gt;\\Script\\Hack*

## Liens
- [Project Apollo - NASSP](https://nassp.space/index.php/Main_Page)
- [Orbiter Forum - Project Apollo - NASSP](https://www.orbiter-forum.com/forums/project-apollo-nassp.40/)
- [Github - Project Apollo - NASSP](https://github.com/orbiternassp)
- [Orbiter Apollo 11 Tutorial](https://cdn.orbithangar.com/OrbiterApollo11Tutorial.pdf)
- [NASSP 8 Installation Guide](https://www.orbiter-forum.com/threads/nassp-8-installation-guide.36801/)
- [Youtube - Saturn V Simulator (Orbiter NASSP) Installation Instructions](https://www.youtube.com/watch?v=GcjpasvFPP4)
- [Youtube - TurryBoeing](https://www.youtube.com/@TurryBoeing/playlists)
- [Discord - Spaceflight Server]()
- [Youtube - How To Install Orbiter Beta](https://www.youtube.com/watch?v=Um-LUaK5Y6c)
- [Orbiter - Beta installation](http://orbit.medphys.ucl.ac.uk/betainstall.html)
- [https://orbiter-mods.com/](https://orbiter-mods.com/)
- [Youtube - How to install NASSP 8 beta in Orbiter Space Flight Simulator](https://youtu.be/rYDqZ9jBGaQ?si=_cyhn9TYHJp4NXy8)
