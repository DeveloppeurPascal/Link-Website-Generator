# Link Website Generator

Générateur de sites de quelques pages pour afficher des liens, par exemples vers des réseaux sociaux, sites de dons et contacts pour les créateurs de contenus et streameurs en remplacement des couteux services en ligne proposant ce type de site en les hébergeant à vie.

Le programme génère des données dans le format utilisé par le serveur de blocs.

Un modèle de site correspondant aux données générées par ce logiciel devra être créé sur le dépôt de code du serveur de blocs.

La version Windows, Mac et Linux du logiciel sera distribuée en shareware. Elle permettra la gestion de sites locaux sans enregistrement de licence. Pour prendre en charge des sites distants l'utilisateur devra enregistrer et activer une licence valide.

La version iOS et Android du logiciel pourra être utilisée uniquement pour gérer des sites à distance par l'intermédiaire de leur API. Elle sera commercialisée sur les magasins d'applications et accessible uniquement par leur intermédiaire.

## Fonctionnalités du logiciel

* gestion d'une liste de sites (générés localement ou accessibles par leur API) : ajout, modification, suppression d'un site de la liste et passage en édition du site
* pour chaque site on prend en charge les paramètres globaux, la liste de pages et chaque page
* dans le cas de la génération locale du site, la base de données est modifiée en direct sur l'arborescence du site
* dans le cas de la manipulation d'un site distant via API, la base de données est une archive temporaire du site (les pages sont récupérées à la demande et envoyées lorsqu'elles sont validées, une connexion web est nécessaire)
* en option on peut envisager un mode hors ligne pour les utilisant leur API avec un cache local et uns synchronisation des modifications  la demande de l'utilisateur (settings + pages modifiées après comparaison de la liste de page locale et celle du serveur)
* paramétrage du logiciel
* paramétrage du site en cours d'édition
* paramétrage de la liste des pages du site en cours d'édition (ajout, modification, suppression d'une page)
* modification d'une page du site en cours d'édition

## Les options du logiciel

Le logiciel propose des options de configuration pour le logiciel lui-même mais aussi en prérenseignement des sites à créer. Ca peut inclure des options de configuration de chaque site comme des pages créées par défaut.

### Utilisés par le logiciel

* enregistrement de la licence d'utilisation du logiciel via CilTseg
* choix du look du logiciel (styles FMX)
* choix de la langue d'utilisation du logiciel
* choix de l'API de traduction à utiliser (par défaut DeepL)
* paramètres de l'API de traduction à utiliser (pour DeepL, la clé d'API)

### Utilisés lors de la création d'un site ou de la génération de sa base de données

#### Pour tous les utilisateurs

* choix de la liste de langues à proposer en création de chaque site à partir d'une liste de langues/pays "complète" associée à des drapeaux (prévoir une API pour alimenter la liste globale automatiquement une fois le logiciel en production, cf "ASSCG Admin"). Si un système de traduction est utilisé, cette liste pourrait être prérenseignée à la liste de langues prises en charge.
* choix des informations de copyright à utiliser par défaut (texte, éditeurs)
* possibilité d'ajouter des pages à la création de sites : index par défaut, page d'erreur 404, page d'erreur 403, page de mentions légales (proposer un prérenseignement de ces pages à travers une API pour mettre à jour les informations à la demande de l'utilisateur mais faire attention à ne pas écraser des pages qui auraient été modifiées localement)
* permettre la saisie d'une série de METAs à utiliser en prérenseignement pour les METAs globaux de chaque site
* permettre la saisie d'une série de LINKs à utiliser en prérenseignement pour les LINKs globaux de chaque site

#### Pour les utilisateurs ayant enregistré une licence

* proposer un import et un export des paramètres du logiciel liés à la création de sites
* choix du texte du META GENERATOR ajouté aux METAs de chaque site créé ou édité par le logiciel
* possibilité de désactiver le META GENERATOR ce qui autoriserai sa suppression de la liste des METAs de chaque site existant et ne l'ajouterai plus par défaut aux nouveaux

## Les options d'un site (paramètres globaux)

Les sites ont des options de configuration mises en dur au niveau de fichiers PHP liés à leur arborescence physique. Elles ne sont pas modifiables depuis le logiciel.

D'autres données peuvent être modifiées par les utilisateurs :

* la liste des langues à utiliser sur le site et la langue par défaut vers laquelle rediriger si celle du visiteur est inconnue
* le statut de référencement par défaut des pages du site (META ROBOTS)
* la liste de METAs à ajouter dans le HEAD de chaque page du site
* la liste de LINKs à ajouter dans le HEAD de chaque page du site
* le chemin relatif ou absolu vers l'image utilisée en favicon du site (par défaut "favicon.ico")
* les informations de l'image à utiliser par défaut dans l'entête de chaque page du site et pour les partages sur les réseaux sociaux
* la liste de pages à mettre en menu pour l'entête de page
* la liste de pages à mettre en menu pour le pied de page
* les informations de copyright du site
* l'ID AppStore d'une application mobile pour iOS et macOS
* l'ID et le token à utiliser pour les logiciels utilisant l'API CilTseg

## Les pages d'un site

Les pages de sites ont des informations communes. Elles sont organisées en bloc pour fonctionner avec le serveur et un modèle de pages prédéfini.

Les blocs présents dans une page générée par ce logiciel sont :
* une image (facultative) qui serait utilisée en remplacement de l'image par défaut en haut de la page
* un texte (facultatif) avec mise en forme possible (donc généré comme source HTML)
* une liste de liens

Les informations en saisie pour une page sont :
* son titre (multilingue)
* son nom de page (= nom du fichier à utiliser dans les URLs)
* sa liste de blocs : image, texte, lien(s)
* l'ID AppStore d'une application mobile pour iOS et macOS qui remplacerait les infos par défaut
* l'ID et le token à utiliser pour les logiciels utilisant l'API CilTseg qui remplacerait les infos par défaut
* le fait que la page soit publique ou privée (donc non visible en ligne)
* le statut de référencement de la page : rien (par défaut), texte (en remplacement du paramétrage du site)

Dans les versions enregistrées du logiciel on a aussi :
* la saisie des METAs à prendre en compte pour cette page
* la saisie des LINKs à prendre en compte pour cette page
* le nom du fichier de thème à utiliser pour cette page

## Gestion des sites traités par le logiciel

Lors de l'ajout d'un site à la liste de sites du logiciel, on choisit d'en ouvrir un localement ou via son API, ou on en crée un localement.

Pour des raisons de sécurité un mot de passe peut être demandé lors de l'accès à un site géré par API. Une solution de 2FA faisant intervenir le site pourra aussi être envisagée.

Les sites locaux n'ont aucune raison de demander un mot de passe puisque la personne accédant au logiciel a aussi accès aux fichiers du site.

### Pour les sites gérés localement

Les paramètres à stocker pour un site local sont :
* son nom (à utiliser dans le logiciel)
* son URL finale
* son URL locale (pour tests avec XAMPP, WAMP, EasyPHP ou un autre serveur local)
* le dossier de stockage des fichiers du site (qui sera l'image des fichiers à transférer en FTP ou autre sur le serveur réel)

Lors de la création de l'espace de stockage du site, les fichiers du serveur (moteur d'affichage et gestion) seront dupliqués depuis sa dernière release (via CilTseg et GestDL) ou son dépôt de code.

Lors de la création de l'arborescence on va aussi générer les fichiers "__common_settings-localhost.inc.php" et "__common_settings-web.inc.php" à partir du chemin de stockage local et de l'URL finale du site. Les deux URL doivent être en saisie lors de la création et de la mise à jour d'un site local. On en profite pour renommer les dossiers de gestion du site et stocker ces données dans le fichier PHP créé.

Une option de mise à jour sera proposée. Elle fonctionnera comme la création pour mettre à jour le moteur d'affichage. Les fichiers provenant du dépôt d'origine seront écrasés même s'ils ont été modifiés localement.

Lors de l'ouverture du site le logiciel détectera le dossier de la base de données en interprétant le contenu du fichier "__common_settings-localhost.inc.php" s'il existe, sinon le contenu du fichier "__common_settings-web.inc.php" s'il existe et à défaut utilisera le dossier par défaut de stockage des fichiers de la base de données "_db-xxxxxxx" qui n'aurait pas été renommé.

### Pour les sites gérés à distance par API

La gestion de sites par API ne sera mise à disposition que des utilisateurs ayant enregistré une licence du logiciel. Cette fonctionnalité sera développée ultérieurement.
