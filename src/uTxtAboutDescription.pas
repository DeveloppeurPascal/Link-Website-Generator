(* C2PP
  ***************************************************************************

  Link Website Generator

  Copyright 2025 Patrick Premartin under AGPL 3.0 license.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
  DEALINGS IN THE SOFTWARE.

  ***************************************************************************

  Author(s) :
  Patrick PREMARTIN

  Site :
  https://linkwebsitegenerator.olfsoftware.fr/

  Project site :
  https://github.com/DeveloppeurPascal/Link-Website-Generator

  ***************************************************************************
  File last update : 2025-07-16T14:42:16.000+02:00
  Signature : a7e05d88eff192c47eb9481390077ae30493d36a
  ***************************************************************************
*)

unit uTxtAboutDescription;

interface

function GetTxtAboutDescription(const Language: string;
  const Recursif: boolean = false): string;

implementation

// For the languages codes, please use 2 letters ISO codes
// https://en.wikipedia.org/wiki/List_of_ISO_3166_country_codes

uses
  System.SysUtils,
  uConsts;

const
  CTxtEN = '''
Link Website Generator is a program for generating websites containing mainly links, as offered by many sites with free offers and paid options.

If you already have a domain name or sub-domain and don't want to depend on a service provider for the rest of your life for just a few pages of links, you might as well create a static website and host it once and for all. It's always more ecological and sustainable.

If you prefer to use an online service provider who will offer you hosting as well as space to manage your site, you can try out the following: Linktree, Taplink, Linkpop, Koji, Milkshake, About and many others. But don't forget that if you go through them, you're dependent on them and won't be able to migrate elsewhere the day you want to regain your independence, or if they close down for one reason or another.

*****************
* Credits

This application was developed by Patrick Prémartin.

*****************
* Publisher info

This software is published by OLF SOFTWARE, a company registered in Paris (France) under the reference 439521725.

****************
* Personal data

This program is autonomous in its current version. It communicates nothing to the outside world. Your data are private !

We have no knowledge of what you do with it.

No information about you is transmitted to us or to any third party.

We use no cookies, no tracking, no stats on your use of the application.

***************
* User support

If you have any questions or require additional functionality, please leave us a message on the application's website or on its code repository.

To find out more, visit https://linkwebsitegenerator.olfsoftware.fr

''';
   CTxtFR = '''
Link Website Generator est un programme de génération de sites Internet contenant essentiellement des liens comme le proposent de nombreux sites avec des offres gratuites à options payantes.

Si vous avez déjà un nom de domaine ou un sous-domaine et ne voulez pas dépendre à vie d'un prestataire pour juste quelques pages de liens autant créer un site web statique et l'héberger une fois pour toutes. Ce sera toujours plus écologique et durable.

Si vous préférez passer par un prestataire en ligne qui vous proposera un hébergement en plus d'un espace de gestion de votre site vous pouvez testez ceux-ci : Linktree, Taplink, Linkpop, Koji, Milkshake, About ou plein d'autres. Mais n'oubliez pas que si vous passez par eux, vous dépendez d'eux et ne pourrez pas migrer ailleurs le jour où vous voudriez reprendre votre indépendance ou s'ils ferment pour une raison ou une autre.

*****************
* Remerciements

Cette application a été développée par Patrick Prémartin.

*****************
* Info éditeur

Ce logiciel est éditée par OLF SOFTWARE, société enregistrée à Paris (France) sous la référence 439521725.

****************
* Données personnelles

Ce programme est autonome dans sa version actuelle. Il ne communique rien au monde extérieur. Vos données sont privées !

Nous n'avons aucune connaissance de ce que vous faites avec lui.

Aucune information vous concernant n'est transmise à nous ou à des tiers.

Nous n'utilisons pas de cookies, pas de tracking, pas de statistiques sur votre utilisation de l'application.

***************
* Assistance aux utilisateurs

Si vous avez des questions ou si vous avez besoin de fonctionnalités supplémentaires, veuillez nous laisser un message sur le site web de l'application ou sur son dépôt de code.

Pour en savoir plus, visitez https://linkwebsitegenerator.olfsoftware.fr

''';
  // CTxtIT = '';
  // CTxtDE = '';
  // CTxtJP = '';
  // CTxtPT = '';
  // CTxtES = '';

function GetTxtAboutDescription(const Language: string;
  const Recursif: boolean): string;
var
  lng: string;
begin
  lng := Language.tolower;
  if (lng = 'en') then
    result := CTxtEN
  else if (lng = 'fr') then // France
    result := CTxtFR
  else if not Recursif then
    result := GetTxtAboutDescription(CDefaultLanguage, true)
  else
    raise Exception.Create('Unknow description for language "' +
      Language + '".');
end;

end.
