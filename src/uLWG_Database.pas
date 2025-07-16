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
  File last update : 2025-07-16T19:39:16.000+02:00
  Signature : 67d6ec7f314dfcb3ef3ac9342598e16af2417eaf
  ***************************************************************************
*)

unit uLWG_Database;

interface

uses
  System.Generics.Collections,
  System.JSON;

type
  TLWGSettings = class
  private
    FDefaultLang: string;
    procedure SetDefaultLang(const Value: string);
  protected
  public
    property DefaultLang: string read FDefaultLang write SetDefaultLang;
    function AsJSON: TJSONObject; virtual;
    procedure LoadFromJSON(const JSo: TJSONObject); virtual;
    constructor Create; virtual;
  end;

  TLWGText = class
  private
    FIsPublic: boolean;
    FText: string;
    FLang: string;
    procedure SetIsPublic(const Value: boolean);
    procedure SetLang(const Value: string);
    procedure SetText(const Value: string);
  protected
  public
    property Lang: string read FLang write SetLang;
    property Text: string read FText write SetText;
    property IsPublic: boolean read FIsPublic write SetIsPublic;
    function AsJSON: TJSONObject; virtual;
    procedure LoadFromJSON(const JSo: TJSONObject); virtual;
    constructor Create; virtual;
  end;

  TLWGTexts = class(TObjectList<TLWGText>)
  private
  protected
  public
    function AsJSON: TJSONArray; virtual;
    procedure LoadFromJSON(const JSa: TJSONArray); virtual;
  end;

  TLWGPhoto = class
  private
    FDescription: TLWGTexts;
    FURL: string;
    procedure SetDescription(const Value: TLWGTexts);
    procedure SetURL(const Value: string);
  protected
  public
    property URL: string read FURL write SetURL;
    property Description: TLWGTexts read FDescription write SetDescription;
    function AsJSON: TJSONObject; virtual;
    procedure LoadFromJSON(const JSo: TJSONObject); virtual;
    constructor Create; virtual;
    destructor Destroy; override;
  end;

  TLWGLink = class(TLWGText)
  private
    FURLImage: string;
    FTitle: string;
    FURL: String;
    FURLPicto: string;
    procedure SetTitle(const Value: string);
    procedure SetURL(const Value: String);
    procedure SetURLImage(const Value: string);
    procedure SetURLPicto(const Value: string);
  protected
  public
    property Title: string read FTitle write SetTitle;
    property URL: String read FURL write SetURL;
    property URLImage: string read FURLImage write SetURLImage;
    property URLPicto: string read FURLPicto write SetURLPicto;
    procedure LoadFromJSON(const JSo: TJSONObject); override;
    function AsJSON: TJSONObject; override;
    constructor Create; override;
  end;

  TLWGLinks = class(TObjectList<TLWGLink>)
  private
  protected
  public
    function AsJSON: TJSONArray; virtual;
    procedure LoadFromJSON(const JSa: TJSONArray); virtual;
  end;

  TLWGPageLinks = class
  private
    FLinks: TLWGLinks;
    FBeforeLinks: TLWGTexts;
    FTitle: TLWGTexts;
    FAfterLinks: TLWGTexts;
    FPhoto: TLWGPhoto;
    procedure SetAfterLinks(const Value: TLWGTexts);
    procedure SetBeforeLinks(const Value: TLWGTexts);
    procedure SetLinks(const Value: TLWGLinks);
    procedure SetPhoto(const Value: TLWGPhoto);
    procedure SetTitle(const Value: TLWGTexts);
  protected
  public
    property Title: TLWGTexts read FTitle write SetTitle;
    property Photo: TLWGPhoto read FPhoto write SetPhoto;
    property BeforeLinks: TLWGTexts read FBeforeLinks write SetBeforeLinks;
    property Links: TLWGLinks read FLinks write SetLinks;
    property AfterLinks: TLWGTexts read FAfterLinks write SetAfterLinks;
    function AsJSON: TJSONObject; virtual;
    procedure LoadFromJSON(const JSo: TJSONObject); virtual;
    constructor Create; virtual;
    destructor Destroy; override;
  end;

  TLWGDoc = class(TLWGText)
  private
    FURILink: string;
    FURITitle: string;
    FTitle: string;
    procedure SetTitle(const Value: string);
    procedure SetURILink(const Value: string);
    procedure SetURITitle(const Value: string);
  protected
  public
    property Title: string read FTitle write SetTitle;
    property URITitle: string read FURITitle write SetURITitle;
    property URILink: string read FURILink write SetURILink;
    procedure LoadFromJSON(const JSo: TJSONObject); override;
    function AsJSON: TJSONObject; override;
    constructor Create; override;
  end;

  TLWGPageDocs = class(TObjectList<TLWGDoc>)
  private
  protected
  public
    function AsJSON: TJSONArray; virtual;
    procedure LoadFromJSON(const JSa: TJSONArray); virtual;
  end;

  TLWGLegal = class(TLWGDoc)
  private
    FBeforeText: string;
    FEditorText: string;
    FAfterText: string;
    FHosterText: string;
    FPublisherText: string;
    procedure SetAfterText(const Value: string);
    procedure SetBeforeText(const Value: string);
    procedure SetEditorText(const Value: string);
    procedure SetHosterText(const Value: string);
    procedure SetPublisherText(const Value: string);
  protected
  public
    property BeforeText: string read FBeforeText write SetBeforeText;
    property EditorText: string read FEditorText write SetEditorText;
    property PublisherText: string read FPublisherText write SetPublisherText;
    property HosterText: string read FHosterText write SetHosterText;
    property AfterText: string read FAfterText write SetAfterText;
    procedure LoadFromJSON(const JSo: TJSONObject); override;
    function AsJSON: TJSONObject; override;
    constructor Create; override;
  end;

  TLWGPageLegal = class(TObjectList<TLWGLegal>)
  private
  protected
  public
    function AsJSON: TJSONArray; virtual;
    procedure LoadFromJSON(const JSa: TJSONArray); virtual;
  end;

  TLWGPages = class
  private
    FLinks: TLWGPageLinks;
    FLegal: TLWGPageLegal;
    FDocs: TLWGPageDocs;
    procedure SetDocs(const Value: TLWGPageDocs);
    procedure SetLegal(const Value: TLWGPageLegal);
    procedure SetLinks(const Value: TLWGPageLinks);
  protected
  public
    property Links: TLWGPageLinks read FLinks write SetLinks;
    property Docs: TLWGPageDocs read FDocs write SetDocs;
    property Legal: TLWGPageLegal read FLegal write SetLegal;
    function AsJSON: TJSONObject; virtual;
    procedure LoadFromJSON(const JSo: TJSONObject); virtual;
    constructor Create; virtual;
    destructor Destroy; override;
  end;

  TLWGCopyLink = class
  private
    FIsPublic: boolean;
    FTitle: string;
    FURL: string;
    FLang: string;
    procedure SetIsPublic(const Value: boolean);
    procedure SetLang(const Value: string);
    procedure SetTitle(const Value: string);
    procedure SetURL(const Value: string);
  protected
  public
    property Lang: string read FLang write SetLang;
    property Title: string read FTitle write SetTitle;
    property URL: string read FURL write SetURL;
    property IsPublic: boolean read FIsPublic write SetIsPublic;
    function AsJSON: TJSONObject; virtual;
    procedure LoadFromJSON(const JSo: TJSONObject); virtual;
    constructor Create; virtual;
  end;

  TLWGCopyLinks = class(TObjectList<TLWGCopyLink>)
  private
  protected
  public
    function AsJSON: TJSONArray; virtual;
    procedure LoadFromJSON(const JSa: TJSONArray); virtual;
  end;

  TLWGEditor = class
  private
    FName: string;
    FIsPublic: boolean;
    FURL: string;
    FLang: string;
    procedure SetIsPublic(const Value: boolean);
    procedure SetLang(const Value: string);
    procedure SetName(const Value: string);
    procedure SetURL(const Value: string);
  protected
  public
    property Lang: string read FLang write SetLang;
    property Name: string read FName write SetName;
    property URL: string read FURL write SetURL;
    property IsPublic: boolean read FIsPublic write SetIsPublic;
    function AsJSON: TJSONObject; virtual;
    procedure LoadFromJSON(const JSo: TJSONObject); virtual;
    constructor Create; virtual;
  end;

  TLWGEditors = class(TObjectList<TLWGEditor>)
  private
  protected
  public
    function AsJSON: TJSONArray; virtual;
    procedure LoadFromJSON(const JSa: TJSONArray); virtual;
  end;

  TLWGCopyright = class
  private
    FYear: word;
    FLinks: TLWGCopyLinks;
    FEditor: TLWGEditors;
    FText: TLWGTexts;
    procedure SetEditor(const Value: TLWGEditors);
    procedure SetLinks(const Value: TLWGCopyLinks);
    procedure SetText(const Value: TLWGTexts);
    procedure SetYear(const Value: word);
  protected
  public
    property Links: TLWGCopyLinks read FLinks write SetLinks;
    property Year: word read FYear write SetYear;
    property Editor: TLWGEditors read FEditor write SetEditor;
    property Text: TLWGTexts read FText write SetText;
    function AsJSON: TJSONObject; virtual;
    procedure LoadFromJSON(const JSo: TJSONObject); virtual;
    constructor Create; virtual;
    destructor Destroy; override;
  end;

  TLWGHTMLMeta = class
  private
    FName: string;
    FIsPublic: boolean;
    FContent: string;
    FLang: string;
    procedure SetContent(const Value: string);
    procedure SetIsPublic(const Value: boolean);
    procedure SetLang(const Value: string);
    procedure SetName(const Value: string);
  protected
  public
    property Lang: string read FLang write SetLang;
    property Name: string read FName write SetName;
    property Content: string read FContent write SetContent;
    property IsPublic: boolean read FIsPublic write SetIsPublic;
    function AsJSON: TJSONObject; virtual;
    procedure LoadFromJSON(const JSo: TJSONObject); virtual;
    constructor Create; virtual;
  end;

  TLWGHTMLMetas = class(TObjectList<TLWGHTMLMeta>)
  private
  protected
  public
    function AsJSON: TJSONArray; virtual;
    procedure LoadFromJSON(const JSa: TJSONArray); virtual;
  end;

  TLWGHTMLLink = class
  private
    FIsPublic: boolean;
    FRel: string;
    FHREF: string;
    FLang: string;
    procedure SetHREF(const Value: string);
    procedure SetIsPublic(const Value: boolean);
    procedure SetLang(const Value: string);
    procedure SetRel(const Value: string);
  protected
  public
    property Lang: string read FLang write SetLang;
    property Rel: string read FRel write SetRel;
    property HREF: string read FHREF write SetHREF;
    property IsPublic: boolean read FIsPublic write SetIsPublic;
    function AsJSON: TJSONObject; virtual;
    procedure LoadFromJSON(const JSo: TJSONObject); virtual;
    constructor Create; virtual;
  end;

  TLWGHTMLLinks = class(TObjectList<TLWGHTMLLink>)
  private
  protected
  public
    function AsJSON: TJSONArray; virtual;
    procedure LoadFromJSON(const JSa: TJSONArray); virtual;
  end;

  TLWGHTMLHead = class
  private
    FLinks: TLWGHTMLLinks;
    FMetas: TLWGHTMLMetas;
    procedure SetLinks(const Value: TLWGHTMLLinks);
    procedure SetMetas(const Value: TLWGHTMLMetas);
  protected
  public
    property Metas: TLWGHTMLMetas read FMetas write SetMetas;
    property Links: TLWGHTMLLinks read FLinks write SetLinks;
    function AsJSON: TJSONObject; virtual;
    procedure LoadFromJSON(const JSo: TJSONObject); virtual;
    constructor Create; virtual;
    destructor Destroy; override;
  end;

  TLWGDB = class
  private
    FHead: TLWGHTMLHead;
    FSettings: TLWGSettings;
    FPages: TLWGPages;
    FCopyright: TLWGCopyright;
    procedure SetCopyright(const Value: TLWGCopyright);
    procedure SetHead(const Value: TLWGHTMLHead);
    procedure SetPages(const Value: TLWGPages);
    procedure SetSettings(const Value: TLWGSettings);
  protected
  public
    property Settings: TLWGSettings read FSettings write SetSettings;
    property Pages: TLWGPages read FPages write SetPages;
    property Copyright: TLWGCopyright read FCopyright write SetCopyright;
    property Head: TLWGHTMLHead read FHead write SetHead;
    function AsJSON: TJSONObject; virtual;
    procedure LoadFromJSON(const JSo: TJSONObject); virtual;
    procedure SaveToFile(const AFileName: string);
    procedure LoadFromFile(const AFileName: string);
    constructor Create; virtual;
    destructor Destroy; override;
  end;

implementation

{ TLWGSettings }

function TLWGSettings.AsJSON: TJSONObject;
begin
  // TODO : à compléter
end;

constructor TLWGSettings.Create;
begin
  inherited;
  FDefaultLang := '';
end;

procedure TLWGSettings.LoadFromJSON(const JSo: TJSONObject);
begin
  // TODO : à compléter
end;

procedure TLWGSettings.SetDefaultLang(const Value: string);
begin
  FDefaultLang := Value;
end;

{ TLWGText }

function TLWGText.AsJSON: TJSONObject;
begin
  // TODO : à compléter
end;

constructor TLWGText.Create;
begin
  inherited;
  FIsPublic := true;
  FText := '';
  FLang := '';
end;

procedure TLWGText.LoadFromJSON(const JSo: TJSONObject);
begin
  // TODO : à compléter
end;

procedure TLWGText.SetIsPublic(const Value: boolean);
begin
  FIsPublic := Value;
end;

procedure TLWGText.SetLang(const Value: string);
begin
  FLang := Value;
end;

procedure TLWGText.SetText(const Value: string);
begin
  FText := Value;
end;

{ TLWGTexts }

function TLWGTexts.AsJSON: TJSONArray;
begin
  result := TJSONArray.Create;
  for var Item in Self do
    result.add(Item.AsJSON);
end;

procedure TLWGTexts.LoadFromJSON(const JSa: TJSONArray);
var
  JSV: TJSONValue;
  Item: TLWGText;
begin
  Clear;
  if assigned(JSa) and (JSa.count > 0) then
    for JSV in JSa do
      if JSV is TJSONObject then
      begin
        Item := TLWGText.Create;
        Item.LoadFromJSON(JSV as TJSONObject);
        Self.add(Item);
      end;
end;

{ TLWGPhoto }

function TLWGPhoto.AsJSON: TJSONObject;
begin
  // TODO : à compléter
end;

constructor TLWGPhoto.Create;
begin
  inherited;
  FDescription := TLWGTexts.Create;
  FURL := '';
end;

destructor TLWGPhoto.Destroy;
begin
  FDescription.Free;
  inherited;
end;

procedure TLWGPhoto.LoadFromJSON(const JSo: TJSONObject);
begin
  // TODO : à compléter
end;

procedure TLWGPhoto.SetDescription(const Value: TLWGTexts);
begin
  FDescription := Value;
end;

procedure TLWGPhoto.SetURL(const Value: string);
begin
  FURL := Value;
end;

{ TLWGLink }

function TLWGLink.AsJSON: TJSONObject;
begin
  // TODO : à compléter
end;

constructor TLWGLink.Create;
begin
  inherited;
  FURLImage := '';
  FTitle := '';
  FURL := '';
  FURLPicto := '';
  FIsPublic := true;
  FText := '';
  FLang := '';
end;

procedure TLWGLink.LoadFromJSON(const JSo: TJSONObject);
begin
  inherited;
  // TODO : à compléter
end;

procedure TLWGLink.SetTitle(const Value: string);
begin
  FTitle := Value;
end;

procedure TLWGLink.SetURL(const Value: String);
begin
  FURL := Value;
end;

procedure TLWGLink.SetURLImage(const Value: string);
begin
  FURLImage := Value;
end;

procedure TLWGLink.SetURLPicto(const Value: string);
begin
  FURLPicto := Value;
end;

{ TLWGLinks }

function TLWGLinks.AsJSON: TJSONArray;
begin
  result := TJSONArray.Create;
  for var Item in Self do
    result.add(Item.AsJSON);
end;

procedure TLWGLinks.LoadFromJSON(const JSa: TJSONArray);
var
  JSV: TJSONValue;
  Item: TLWGLink;
begin
  Clear;
  if assigned(JSa) and (JSa.count > 0) then
    for JSV in JSa do
      if JSV is TJSONObject then
      begin
        Item := TLWGLink.Create;
        Item.LoadFromJSON(JSV as TJSONObject);
        Self.add(Item);
      end;
end;

{ TLWGPageLinks }

function TLWGPageLinks.AsJSON: TJSONObject;
begin
  // TODO : à compléter
end;

constructor TLWGPageLinks.Create;
begin
  inherited;
  FLinks := TLWGLinks.Create;
  FBeforeLinks := TLWGTexts.Create;
  FTitle := TLWGTexts.Create;
  FAfterLinks := TLWGTexts.Create;
  FPhoto := TLWGPhoto.Create;
end;

destructor TLWGPageLinks.Destroy;
begin
  FLinks.Free;
  FBeforeLinks.Free;
  FTitle.Free;
  FAfterLinks.Free;
  FPhoto.Free;
  inherited;
end;

procedure TLWGPageLinks.LoadFromJSON(const JSo: TJSONObject);
begin
  // TODO : à compléter
end;

procedure TLWGPageLinks.SetAfterLinks(const Value: TLWGTexts);
begin
  FAfterLinks := Value;
end;

procedure TLWGPageLinks.SetBeforeLinks(const Value: TLWGTexts);
begin
  FBeforeLinks := Value;
end;

procedure TLWGPageLinks.SetLinks(const Value: TLWGLinks);
begin
  FLinks := Value;
end;

procedure TLWGPageLinks.SetPhoto(const Value: TLWGPhoto);
begin
  FPhoto := Value;
end;

procedure TLWGPageLinks.SetTitle(const Value: TLWGTexts);
begin
  FTitle := Value;
end;

{ TLWGDoc }

function TLWGDoc.AsJSON: TJSONObject;
begin
  // TODO : à compléter
end;

constructor TLWGDoc.Create;
begin
  inherited;
  FURILink := '';
  FURITitle := '';
  FTitle := '';
end;

procedure TLWGDoc.LoadFromJSON(const JSo: TJSONObject);
begin
  inherited;
  // TODO : à compléter
end;

procedure TLWGDoc.SetTitle(const Value: string);
begin
  FTitle := Value;
end;

procedure TLWGDoc.SetURILink(const Value: string);
begin
  FURILink := Value;
end;

procedure TLWGDoc.SetURITitle(const Value: string);
begin
  FURITitle := Value;
end;

{ TLWGPageDocs }

function TLWGPageDocs.AsJSON: TJSONArray;
begin
  result := TJSONArray.Create;
  for var Item in Self do
    result.add(Item.AsJSON);
end;

procedure TLWGPageDocs.LoadFromJSON(const JSa: TJSONArray);
var
  JSV: TJSONValue;
  Item: TLWGDoc;
begin
  Clear;
  if assigned(JSa) and (JSa.count > 0) then
    for JSV in JSa do
      if JSV is TJSONObject then
      begin
        Item := TLWGDoc.Create;
        Item.LoadFromJSON(JSV as TJSONObject);
        Self.add(Item);
      end;
end;

{ TLWGPage }

function TLWGLegal.AsJSON: TJSONObject;
begin
  // TODO : à compléter
end;

constructor TLWGLegal.Create;
begin
  inherited;
  FBeforeText := '';
  FEditorText := '';
  FAfterText := '';
  FHosterText := '';
  FPublisherText := '';
end;

procedure TLWGLegal.LoadFromJSON(const JSo: TJSONObject);
begin
  inherited;
  // TODO : à compléter
end;

procedure TLWGLegal.SetAfterText(const Value: string);
begin
  FAfterText := Value;
end;

procedure TLWGLegal.SetBeforeText(const Value: string);
begin
  FBeforeText := Value;
end;

procedure TLWGLegal.SetEditorText(const Value: string);
begin
  FEditorText := Value;
end;

procedure TLWGLegal.SetHosterText(const Value: string);
begin
  FHosterText := Value;
end;

procedure TLWGLegal.SetPublisherText(const Value: string);
begin
  FPublisherText := Value;
end;

{ TLWGPageLegal }

function TLWGPageLegal.AsJSON: TJSONArray;
begin
  result := TJSONArray.Create;
  for var Item in Self do
    result.add(Item.AsJSON);
end;

procedure TLWGPageLegal.LoadFromJSON(const JSa: TJSONArray);
var
  JSV: TJSONValue;
  Item: TLWGLegal;
begin
  Clear;
  if assigned(JSa) and (JSa.count > 0) then
    for JSV in JSa do
      if JSV is TJSONObject then
      begin
        Item := TLWGLegal.Create;
        Item.LoadFromJSON(JSV as TJSONObject);
        Self.add(Item);
      end;
end;

{ TLWGPages }

function TLWGPages.AsJSON: TJSONObject;
begin
  // TODO : à compléter
end;

constructor TLWGPages.Create;
begin
  inherited;
  FLinks := TLWGPageLinks.Create;
  FLegal := TLWGPageLegal.Create;
  FDocs := TLWGPageDocs.Create;
end;

destructor TLWGPages.Destroy;
begin
  FLinks.Free;
  FLegal.Free;
  FDocs.Free;
  inherited;
end;

procedure TLWGPages.LoadFromJSON(const JSo: TJSONObject);
begin
  // TODO : à compléter
end;

procedure TLWGPages.SetDocs(const Value: TLWGPageDocs);
begin
  FDocs := Value;
end;

procedure TLWGPages.SetLegal(const Value: TLWGPageLegal);
begin
  FLegal := Value;
end;

procedure TLWGPages.SetLinks(const Value: TLWGPageLinks);
begin
  FLinks := Value;
end;

{ TLWGCopyLink }

function TLWGCopyLink.AsJSON: TJSONObject;
begin
  // TODO : à compléter
end;

constructor TLWGCopyLink.Create;
begin
  inherited;
  FIsPublic := true;
  FTitle := '';
  FURL := '';
  FLang := '';
end;

procedure TLWGCopyLink.LoadFromJSON(const JSo: TJSONObject);
begin
  // TODO : à compléter
end;

procedure TLWGCopyLink.SetIsPublic(const Value: boolean);
begin
  FIsPublic := Value;
end;

procedure TLWGCopyLink.SetLang(const Value: string);
begin
  FLang := Value;
end;

procedure TLWGCopyLink.SetTitle(const Value: string);
begin
  FTitle := Value;
end;

procedure TLWGCopyLink.SetURL(const Value: string);
begin
  FURL := Value;
end;

{ TLWGCopyLinks }

function TLWGCopyLinks.AsJSON: TJSONArray;
begin
  result := TJSONArray.Create;
  for var Item in Self do
    result.add(Item.AsJSON);
end;

procedure TLWGCopyLinks.LoadFromJSON(const JSa: TJSONArray);
var
  JSV: TJSONValue;
  Item: TLWGCopyLink;
begin
  Clear;
  if assigned(JSa) and (JSa.count > 0) then
    for JSV in JSa do
      if JSV is TJSONObject then
      begin
        Item := TLWGCopyLink.Create;
        Item.LoadFromJSON(JSV as TJSONObject);
        Self.add(Item);
      end;
end;

{ TLWGEditor }

function TLWGEditor.AsJSON: TJSONObject;
begin
  // TODO : à compléter
end;

constructor TLWGEditor.Create;
begin
  inherited;
  FName := '';
  FIsPublic := true;
  FURL := '';
  FLang := '';
end;

procedure TLWGEditor.LoadFromJSON(const JSo: TJSONObject);
begin
  // TODO : à compléter
end;

procedure TLWGEditor.SetIsPublic(const Value: boolean);
begin
  FIsPublic := Value;
end;

procedure TLWGEditor.SetLang(const Value: string);
begin
  FLang := Value;
end;

procedure TLWGEditor.SetName(const Value: string);
begin
  FName := Value;
end;

procedure TLWGEditor.SetURL(const Value: string);
begin
  FURL := Value;
end;

{ TLWGEditors }

function TLWGEditors.AsJSON: TJSONArray;
begin
  result := TJSONArray.Create;
  for var Item in Self do
    result.add(Item.AsJSON);
end;

procedure TLWGEditors.LoadFromJSON(const JSa: TJSONArray);
var
  JSV: TJSONValue;
  Item: TLWGEditor;
begin
  Clear;
  if assigned(JSa) and (JSa.count > 0) then
    for JSV in JSa do
      if JSV is TJSONObject then
      begin
        Item := TLWGEditor.Create;
        Item.LoadFromJSON(JSV as TJSONObject);
        Self.add(Item);
      end;
end;

{ TLWGCopyright }

function TLWGCopyright.AsJSON: TJSONObject;
begin
  // TODO : à compléter
end;

constructor TLWGCopyright.Create;
begin
  inherited;
  FYear := 0; // TODO : mettre l'année en cours par défaut
  FLinks := TLWGCopyLinks.Create;
  FEditor := TLWGEditors.Create;
  FText := TLWGTexts.Create;
end;

destructor TLWGCopyright.Destroy;
begin
  FLinks.Free;
  FEditor.Free;
  FText.Free;
  inherited;
end;

procedure TLWGCopyright.LoadFromJSON(const JSo: TJSONObject);
begin
  // TODO : à compléter
end;

procedure TLWGCopyright.SetEditor(const Value: TLWGEditors);
begin
  FEditor := Value;
end;

procedure TLWGCopyright.SetLinks(const Value: TLWGCopyLinks);
begin
  FLinks := Value;
end;

procedure TLWGCopyright.SetText(const Value: TLWGTexts);
begin
  FText := Value;
end;

procedure TLWGCopyright.SetYear(const Value: word);
begin
  FYear := Value;
end;

{ TLWGHTMLMeta }

function TLWGHTMLMeta.AsJSON: TJSONObject;
begin
  // TODO : à compléter
end;

constructor TLWGHTMLMeta.Create;
begin
  inherited;
  FName := '';
  FIsPublic := true;
  FContent := '';
  FLang := '';
end;

procedure TLWGHTMLMeta.LoadFromJSON(const JSo: TJSONObject);
begin
  // TODO : à compléter
end;

procedure TLWGHTMLMeta.SetContent(const Value: string);
begin
  FContent := Value;
end;

procedure TLWGHTMLMeta.SetIsPublic(const Value: boolean);
begin
  FIsPublic := Value;
end;

procedure TLWGHTMLMeta.SetLang(const Value: string);
begin
  FLang := Value;
end;

procedure TLWGHTMLMeta.SetName(const Value: string);
begin
  FName := Value;
end;

{ TLWGHTMLMetas }

function TLWGHTMLMetas.AsJSON: TJSONArray;
begin
  result := TJSONArray.Create;
  for var Item in Self do
    result.add(Item.AsJSON);
end;

procedure TLWGHTMLMetas.LoadFromJSON(const JSa: TJSONArray);
var
  JSV: TJSONValue;
  Item: TLWGHTMLMeta;
begin
  Clear;
  if assigned(JSa) and (JSa.count > 0) then
    for JSV in JSa do
      if JSV is TJSONObject then
      begin
        Item := TLWGHTMLMeta.Create;
        Item.LoadFromJSON(JSV as TJSONObject);
        Self.add(Item);
      end;
end;

{ TLWGHTMLLink }

function TLWGHTMLLink.AsJSON: TJSONObject;
begin
  // TODO : à compléter
end;

constructor TLWGHTMLLink.Create;
begin
  inherited;
  FIsPublic := true;
  FRel := '';
  FHREF := '';
  FLang := '';
end;

procedure TLWGHTMLLink.LoadFromJSON(const JSo: TJSONObject);
begin
  // TODO : à compléter
end;

procedure TLWGHTMLLink.SetHREF(const Value: string);
begin
  FHREF := Value;
end;

procedure TLWGHTMLLink.SetIsPublic(const Value: boolean);
begin
  FIsPublic := Value;
end;

procedure TLWGHTMLLink.SetLang(const Value: string);
begin
  FLang := Value;
end;

procedure TLWGHTMLLink.SetRel(const Value: string);
begin
  FRel := Value;
end;

{ TLWGHTMLLinks }

function TLWGHTMLLinks.AsJSON: TJSONArray;
begin
  result := TJSONArray.Create;
  for var Item in Self do
    result.add(Item.AsJSON);
end;

procedure TLWGHTMLLinks.LoadFromJSON(const JSa: TJSONArray);
var
  JSV: TJSONValue;
  Item: TLWGHTMLLink;
begin
  Clear;
  if assigned(JSa) and (JSa.count > 0) then
    for JSV in JSa do
      if JSV is TJSONObject then
      begin
        Item := TLWGHTMLLink.Create;
        Item.LoadFromJSON(JSV as TJSONObject);
        Self.add(Item);
      end;
end;

{ TLWGHTMLHead }

function TLWGHTMLHead.AsJSON: TJSONObject;
begin
  // TODO : à compléter
end;

constructor TLWGHTMLHead.Create;
begin
  inherited;
  FLinks := TLWGHTMLLinks.Create;
  FMetas := TLWGHTMLMetas.Create;
end;

destructor TLWGHTMLHead.Destroy;
begin
  FLinks.Free;
  FMetas.Free;
  inherited;
end;

procedure TLWGHTMLHead.LoadFromJSON(const JSo: TJSONObject);
begin
  // TODO : à compléter
end;

procedure TLWGHTMLHead.SetLinks(const Value: TLWGHTMLLinks);
begin
  FLinks := Value;
end;

procedure TLWGHTMLHead.SetMetas(const Value: TLWGHTMLMetas);
begin
  FMetas := Value;
end;

{ TLWGDB }

function TLWGDB.AsJSON: TJSONObject;
begin
  // TODO : à compléter
end;

constructor TLWGDB.Create;
begin
  inherited;
  FHead := TLWGHTMLHead.Create;
  FSettings := TLWGSettings.Create;
  FPages := TLWGPages.Create;
  FCopyright := TLWGCopyright.Create;
end;

destructor TLWGDB.Destroy;
begin
  FHead.Free;
  FSettings.Free;
  FPages.Free;
  FCopyright.Free;
  inherited;
end;

procedure TLWGDB.LoadFromFile(const AFileName: string);
begin
  // TODO : à compléter
end;

procedure TLWGDB.LoadFromJSON(const JSo: TJSONObject);
begin
  // TODO : à compléter
end;

procedure TLWGDB.SaveToFile(const AFileName: string);
begin
  // TODO : à compléter
end;

procedure TLWGDB.SetCopyright(const Value: TLWGCopyright);
begin
  FCopyright := Value;
end;

procedure TLWGDB.SetHead(const Value: TLWGHTMLHead);
begin
  FHead := Value;
end;

procedure TLWGDB.SetPages(const Value: TLWGPages);
begin
  FPages := Value;
end;

procedure TLWGDB.SetSettings(const Value: TLWGSettings);
begin
  FSettings := Value;
end;

end.
