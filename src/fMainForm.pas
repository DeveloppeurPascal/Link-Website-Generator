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
/// File last update : 2025-02-26T20:37:34.000+01:00
/// Signature : d268dd6d894a34af5c68e49599cfd9eef1ad19e4
/// ***************************************************************************
/// </summary>

unit fMainForm;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  _MainFormAncestor,
  System.Actions,
  FMX.ActnList,
  FMX.Menus,
  uDocumentsAncestor;

type
  TMainForm = class(T__MainFormAncestor)
  private
  protected
    function GetNewDoc: TDocumentAncestor; override;
  public

  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}
{ TMainForm }

function TMainForm.GetNewDoc: TDocumentAncestor;
begin
  // TODO : replace by your document class
  result := TDocumentAncestor.Create;
end;

end.
