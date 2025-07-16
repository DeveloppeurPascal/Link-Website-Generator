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
  File last update : 2025-07-16T18:12:06.000+02:00
  Signature : 7fb6cf9872f94f7e61e7e1640b1b734afe1bcf61
  ***************************************************************************
*)

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
    function GetNewDoc(const FileName: string = ''): TDocumentAncestor;
      override;
  public

  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}

uses
  System.IOUtils,
  uLWG_Projects;

function TMainForm.GetNewDoc(const FileName: string): TDocumentAncestor;
begin
  if (not FileName.trim.IsEmpty) then
  begin
    if (comparetext(tpath.GetExtension(FileName),
      '.' + result.GetDocumentExtension) = 0) and TFile.Exists(FileName) then
    begin
      result := TWebsiteProject.Create;
      result.LoadFromFile(FileName);
    end
    else
      raise Exception.Create('Can''t open this file !');
    // TODO : traduire texte
  end
  else
    result := TWebsiteProject.Create;
end;

end.
