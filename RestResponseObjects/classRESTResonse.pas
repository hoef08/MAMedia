unit classRESTResonse;

// *************************************************
// Generated By: JsonToDelphiClass - 0.65
// Project link: https://github.com/PKGeorgiev/Delphi-JsonToDelphiClass
// Generated On: 2016-11-20 12:33:31
// *************************************************
// Created By  : Petar Georgiev - 2014
// WebSite     : http://pgeorgiev.com
// *************************************************

interface

uses Generics.Collections, Rest.Json,
  classGetIndexes, classGetMusicDirectory, classGetGenres;

type

  TErrorClass = class
  private
    FCode: Extended;
    FMessage: string;
  public
    property code: Extended read FCode write FCode;
    property message: string read FMessage write FMessage;
    function ToJsonString: string;
    class function FromJsonString(AJsonString: string): TErrorClass;
  end;

  TRestClass = class
  private
    FType: string;
    FVersion: string;
  public
    property &type: string read FType write FType;
    property version: string read FVersion write FVersion;
    function ToJsonString: string;
    class function FromJsonString(AJsonString: string): TRestClass;
  end;

  TApiClass = class
  private
    FRest: TArray<TRestClass>;
  public
    property Rest: TArray<TRestClass> read FRest write FRest;
    destructor Destroy; override;
    function ToJsonString: string;
    class function FromJsonString(AJsonString: string): TApiClass;
  end;

  TMusicFolderClass = class
  private
    FId: Extended;
    FName: string;
  public
    property id: Extended read FId write FId;
    property name: string read FName write FName;
    function ToJsonString: string;
    class function FromJsonString(AJsonString: string): TMusicFolderClass;
  end;

  TMusicFoldersClass = class
  private
    FMusicFolder: TArray<TMusicFolderClass>;
    FAPIMethodName: string;
  protected
    procedure SetMethod(p_MethodName: string);
  public
    property musicFolder: TArray<TMusicFolderClass> read FMusicFolder
      write FMusicFolder;
    function Count: integer;
    property APIMethod: string read FAPIMethodName write SetMethod;

    destructor Destroy; override;
    function ToJsonString: string;
    class function FromJsonString(AJsonString: string): TMusicFoldersClass;

  end;

  TMadsonicresponseClass = class
  private
    FError: TErrorClass;
    FMusicFolders: TMusicFoldersClass;
    FApi: TApiClass;
    FIndexes: TIndexesClass;
    FDirectory: TDirectoryClass;
    FGenres: TGenresClass;
    FArtistGenres: TArtistGenresClass;
    FStatus: string;
    FType: string;
    FVersion: string;
  public
    property directory: TDirectoryClass read FDirectory write FDirectory;
    property indexes: TIndexesClass read FIndexes write FIndexes;
    property genres: TGenresClass read FGenres write FGenres;
    property artistgenres: TArtistGenresClass read FArtistGenres
      write FArtistGenres;
    property error: TErrorClass read FError write FError;
    property musicFolders: TMusicFoldersClass read FMusicFolders
      write FMusicFolders;
    property status: string read FStatus write FStatus;
    property &type: string read FType write FType;
    property version: string read FVersion write FVersion;
    constructor Create;
    destructor Destroy; override;
    function ToJsonString: string;
    class function FromJsonString(AJsonString: string): TMadsonicresponseClass;
  end;

  TGetAPIClass = class
  private
    FMadsonicresponse: TMadsonicresponseClass;
  public
    property madsonicresponse: TMadsonicresponseClass read FMadsonicresponse
      write FMadsonicresponse;
    constructor Create;
    destructor Destroy; override;
    function ToJsonString: string;
    class function FromJsonString(AJsonString: string): TGetAPIClass;
  end;

implementation

{ TRestClass }

function TRestClass.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TRestClass.FromJsonString(AJsonString: string): TRestClass;
begin
  result := TJson.JsonToObject<TRestClass>(AJsonString)
end;

{ TApiClass }

destructor TApiClass.Destroy;
var
  LrestItem: TRestClass;
begin

  for LrestItem in FRest do
    LrestItem.free;

  inherited;
end;

function TApiClass.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TApiClass.FromJsonString(AJsonString: string): TApiClass;
begin
  result := TJson.JsonToObject<TApiClass>(AJsonString)
end;

{ TErrorClass }

function TErrorClass.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TErrorClass.FromJsonString(AJsonString: string): TErrorClass;
begin
  result := TJson.JsonToObject<TErrorClass>(AJsonString)
end;

{ TMusicFolderClass }

function TMusicFolderClass.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TMusicFolderClass.FromJsonString(AJsonString: string)
  : TMusicFolderClass;
begin
  result := TJson.JsonToObject<TMusicFolderClass>(AJsonString)
end;

{ TMusicFoldersClass }

destructor TMusicFoldersClass.Destroy;
var
  LmusicFolderItem: TMusicFolderClass;
begin

  for LmusicFolderItem in FMusicFolder do
    LmusicFolderItem.free;

  inherited;
end;

procedure TMusicFoldersClass.SetMethod(p_MethodName: string);
begin
  FAPIMethodName := p_MethodName;
end;

function TMusicFoldersClass.Count: integer;
begin
  result := Length(self.musicFolder)
end;

function TMusicFoldersClass.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TMusicFoldersClass.FromJsonString(AJsonString: string)
  : TMusicFoldersClass;
begin
  result := TJson.JsonToObject<TMusicFoldersClass>(AJsonString)
end;

{ TMadsonicresponseClass }

constructor TMadsonicresponseClass.Create;
begin
  inherited;
  FMusicFolders := TMusicFoldersClass.Create();
  FError := TErrorClass.Create();
  FApi := TApiClass.Create();
  FIndexes := TIndexesClass.Create();
  FDirectory := TDirectoryClass.Create();
  FGenres := TGenresClass.Create();
  FArtistGenres := TArtistGenresClass.Create();
end;

destructor TMadsonicresponseClass.Destroy;
begin
  FMusicFolders.free;
  FError.free;
  FApi.free;
  FIndexes.free;
  FDirectory.free;
  FGenres.free;
  FArtistGenres.free;
  inherited;
end;

function TMadsonicresponseClass.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TMadsonicresponseClass.FromJsonString(AJsonString: string)
  : TMadsonicresponseClass;
begin
  result := TJson.JsonToObject<TMadsonicresponseClass>(AJsonString)
end;

{ TGetAPIClass }

constructor TGetAPIClass.Create;
begin
  inherited;
  FMadsonicresponse := TMadsonicresponseClass.Create();
end;

destructor TGetAPIClass.Destroy;
begin
  FMadsonicresponse.free;
  inherited;
end;

function TGetAPIClass.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TGetAPIClass.FromJsonString(AJsonString: string): TGetAPIClass;
begin
  result := TJson.JsonToObject<TGetAPIClass>(AJsonString)
end;

end.
