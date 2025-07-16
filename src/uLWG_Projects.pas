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
  File last update : 2025-07-16T17:55:32.000+02:00
  Signature : 613865ed26e80d300406205e0bf46d3fe2cb7331
  ***************************************************************************
*)

unit uLWG_Projects;

interface

uses
  uDocumentsAncestor,
  System.JSON;

type
  TWebsiteProject = class(TJSONDocumentAncestor)
  private const
    CWSPVersion = 1;

  var
    FAPI_Upload_Endpoint: string;
    FAPI_PrivKey: string;
    FAPI_URL: string;
    FAPI_PubKey: string;
    FAPI_Download_Endpoint: string;
    procedure SetAPI_Download_Endpoint(const Value: string);
    procedure SetAPI_PrivKey(const Value: string);
    procedure SetAPI_PubKey(const Value: string);
    procedure SetAPI_Upload_Endpoint(const Value: string);
    procedure SetAPI_URL(const Value: string);
  protected
  public
    property API_URL: string read FAPI_URL write SetAPI_URL;
    property API_Upload_Endpoint: string read FAPI_Upload_Endpoint
      write SetAPI_Upload_Endpoint;
    property API_Download_Endpoint: string read FAPI_Download_Endpoint
      write SetAPI_Download_Endpoint;
    property API_PubKey: string read FAPI_PubKey write SetAPI_PubKey;
    property API_PrivKey: string read FAPI_PrivKey write SetAPI_PrivKey;

    function AsJSON: TJSONObject; override;
    procedure LoadFromJSONObject(const JSO: TJSONObject); override;
    procedure Clear; override;
    constructor Create; override;
    function GetDocumentExtension: string; override;
    function GetDocumentGUID: string; override;
    function GetPrivateXORKey: TArray<Byte>; override;
  end;

implementation

uses
  System.SysUtils;

const
  CPrefix = 'WSP_';

  { TWebsiteProject }

function TWebsiteProject.AsJSON: TJSONObject;
begin
  result := inherited;
  result.AddPair(CPrefix + 'Version', CWSPVersion);
  result.AddPair(CPrefix + 'APIU', FAPI_URL);
  result.AddPair(CPrefix + 'APIUE', FAPI_Upload_Endpoint);
  result.AddPair(CPrefix + 'APIDE', FAPI_Download_Endpoint);
  result.AddPair(CPrefix + 'APIPuK', FAPI_PubKey);
  result.AddPair(CPrefix + 'APIPrK', FAPI_PrivKey);
end;

procedure TWebsiteProject.Clear;
begin
  inherited;
  FAPI_Upload_Endpoint := '';
  FAPI_PrivKey := '';
  FAPI_URL := '';
  FAPI_PubKey := '';
  FAPI_Download_Endpoint := '';
end;

constructor TWebsiteProject.Create;
begin
  inherited;
  FAPI_Upload_Endpoint := '';
  FAPI_PrivKey := '';
  FAPI_URL := '';
  FAPI_PubKey := '';
  FAPI_Download_Endpoint := '';
end;

function TWebsiteProject.GetDocumentExtension: string;
begin
  result := 'lwsg';
end;

function TWebsiteProject.GetDocumentGUID: string;
begin
  result := '31FC0E36-DCB3-41E6-BAC6-972AB1F71FD3';
end;

function TWebsiteProject.GetPrivateXORKey: TArray<Byte>;
begin
{$IF Defined(RELEASE)}
{$I '..\_PRIVATE\src\WebsiteProjectFileXORKey.inc'}
{$ELSE}
  result := [];
{$ENDIF}
end;

procedure TWebsiteProject.LoadFromJSONObject(const JSO: TJSONObject);
var
  VersionNum: integer;
begin
  inherited;

  // Check if the document file has a version number.
  if not JSO.TryGetValue<integer>(CPrefix + 'Version', VersionNum) then
    VersionNum := maxint;

  // Check if the program can open this document.
  if (VersionNum > CWSPVersion) then
    raise exception.Create
      ('Can''t open this file. Please update the program before trying again.');
  // TODO -oDeveloppeurPascal : à traduire

  if not JSO.TryGetValue<string>(CPrefix + 'APIU', FAPI_URL) then
    FAPI_URL := '';
  if not JSO.TryGetValue<string>(CPrefix + 'APIUE', FAPI_Upload_Endpoint) then
    FAPI_Upload_Endpoint := '';
  if not JSO.TryGetValue<string>(CPrefix + 'APIDE', FAPI_Download_Endpoint) then
    FAPI_Download_Endpoint := '';
  if not JSO.TryGetValue<string>(CPrefix + 'APIPuK', FAPI_PubKey) then
    FAPI_PubKey := '';
  if not JSO.TryGetValue<string>(CPrefix + 'APIPrK', FAPI_PrivKey) then
    FAPI_PrivKey := '';
end;

procedure TWebsiteProject.SetAPI_Download_Endpoint(const Value: string);
begin
  if (FAPI_Download_Endpoint <> Value) then
  begin
    FAPI_Download_Endpoint := Value;
    SetHasChanged(true);
  end;
end;

procedure TWebsiteProject.SetAPI_PrivKey(const Value: string);
begin
  if (FAPI_PrivKey <> Value) then
  begin
    FAPI_PrivKey := Value;
    SetHasChanged(true);
  end;
end;

procedure TWebsiteProject.SetAPI_PubKey(const Value: string);
begin
  if (FAPI_PubKey <> Value) then
  begin
    FAPI_PubKey := Value;
    SetHasChanged(true);
  end;
end;

procedure TWebsiteProject.SetAPI_Upload_Endpoint(const Value: string);
begin
  if (FAPI_Upload_Endpoint <> Value) then
  begin
    FAPI_Upload_Endpoint := Value;
    SetHasChanged(true);
  end;
end;

procedure TWebsiteProject.SetAPI_URL(const Value: string);
begin
  if (FAPI_URL <> Value) then
  begin
    FAPI_URL := Value;
    SetHasChanged(true);
  end;
end;

end.
