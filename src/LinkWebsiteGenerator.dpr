/// <summary>
/// ***************************************************************************
///
/// Link Website Generator
///
/// Copyright 2025 Patrick Premartin under AGPL 3.0 license.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
/// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
/// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
/// DEALINGS IN THE SOFTWARE.
///
/// ***************************************************************************
///
/// Author(s) :
/// Patrick PREMARTIN
///
/// Site :
/// https://linkwebsitegenerator.olfsoftware.fr/
///
/// Project site :
/// https://github.com/DeveloppeurPascal/Link-Website-Generator
///
/// ***************************************************************************
/// File last update : 2025-02-26T20:41:56.000+01:00
/// Signature : 97af8f17d7a82132321b5827e0a592e895087a27
/// ***************************************************************************
/// </summary>

program LinkWebsiteGenerator;

uses
  System.StartUpCopy,
  FMX.Forms,
  uConfig in '..\lib-externes\FMX-Tools-Starter-Kit\src\uConfig.pas',
  uConsts in 'uConsts.pas',
  uDMAboutBox in '..\lib-externes\FMX-Tools-Starter-Kit\src\uDMAboutBox.pas' {AboutBox: TDataModule},
  uDMAboutBoxLogoStorrage in 'uDMAboutBoxLogoStorrage.pas' {dmAboutBoxLogo: TDataModule},
  uTranslate in '..\lib-externes\FMX-Tools-Starter-Kit\src\uTranslate.pas',
  uTxtAboutDescription in 'uTxtAboutDescription.pas',
  uTxtAboutLicense in 'uTxtAboutLicense.pas',
  Olf.FMX.AboutDialog in '..\lib-externes\AboutDialog-Delphi-Component\src\Olf.FMX.AboutDialog.pas',
  Olf.FMX.AboutDialogForm in '..\lib-externes\AboutDialog-Delphi-Component\src\Olf.FMX.AboutDialogForm.pas' {OlfAboutDialogForm},
  Olf.FMX.SelectDirectory in '..\lib-externes\Delphi-FMXExtend-Library\src\Olf.FMX.SelectDirectory.pas',
  Olf.RTL.CryptDecrypt in '..\lib-externes\librairies\src\Olf.RTL.CryptDecrypt.pas',
  Olf.RTL.Language in '..\lib-externes\librairies\src\Olf.RTL.Language.pas',
  Olf.RTL.Params in '..\lib-externes\librairies\src\Olf.RTL.Params.pas',
  u_urlOpen in '..\lib-externes\librairies\src\u_urlOpen.pas',
  _TFrameAncestor in '..\lib-externes\FMX-Tools-Starter-Kit\src\_TFrameAncestor.pas' {__TFrameAncestor: TFrame},
  _TFormAncestor in '..\lib-externes\FMX-Tools-Starter-Kit\src\_TFormAncestor.pas' {__TFormAncestor},
  _MainFormAncestor in '..\lib-externes\FMX-Tools-Starter-Kit\src\_MainFormAncestor.pas' {__MainFormAncestor},
  uDocumentsAncestor in '..\lib-externes\FMX-Tools-Starter-Kit\src\uDocumentsAncestor.pas',
  Olf.RTL.Streams in '..\lib-externes\librairies\src\Olf.RTL.Streams.pas',
  Olf.RTL.Maths.Conversions in '..\lib-externes\librairies\src\Olf.RTL.Maths.Conversions.pas',
  uStyleManager in '..\lib-externes\FMX-Tools-Starter-Kit\src\uStyleManager.pas',
  _StyleContainerAncestor in '..\lib-externes\FMX-Tools-Starter-Kit\src\_StyleContainerAncestor.pas' {__StyleContainerAncestor: TDataModule},
  uStyleLightByDefault in '..\lib-externes\FMX-Tools-Starter-Kit\src\uStyleLightByDefault.pas' {StyleLightByDefault: TDataModule},
  uStyleDarkByDefault in '..\lib-externes\FMX-Tools-Starter-Kit\src\uStyleDarkByDefault.pas' {StyleDarkByDefault: TDataModule},
  Olf.RTL.SystemAppearance in '..\lib-externes\librairies\src\Olf.RTL.SystemAppearance.pas',
  fToolsStylesDialog in '..\lib-externes\FMX-Tools-Starter-Kit\src\fToolsStylesDialog.pas' {frmToolsStylesDialog},
  fToolsLanguagesDialog in '..\lib-externes\FMX-Tools-Starter-Kit\src\fToolsLanguagesDialog.pas' {frmToolsLanguagesDialog},
  Olf.CilTseg.ClientLib in '..\lib-externes\CilTseg4Delphi\src\Olf.CilTseg.ClientLib.pas',
  Olf.RTL.Checksum in '..\lib-externes\librairies\src\Olf.RTL.Checksum.pas',
  u_md5 in '..\lib-externes\librairies\src\u_md5.pas',
  fCiltsegRegisterOrShowLicense in '..\lib-externes\CilTseg4Delphi\src\FMX\fCiltsegRegisterOrShowLicense.pas' {frmCilTsegRegisterOrShowLicense},
  fMainForm in 'fMainForm.pas' {MainForm},
  uStyleImpressiveDark in '..\_PRIVATE\src\uStyleImpressiveDark.pas' {StyleImpressiveDark: TDataModule},
  uStyleImpressiveLight in '..\_PRIVATE\src\uStyleImpressiveLight.pas' {StyleImpressiveLight: TDataModule},
  uStylePolarDark in '..\_PRIVATE\src\uStylePolarDark.pas' {StylePolarDark: TDataModule},
  uStylePolarLight in '..\_PRIVATE\src\uStylePolarLight.pas' {StylePolarLight: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
