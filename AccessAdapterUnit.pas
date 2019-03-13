unit AccessAdapterUnit;

interface

uses
  SysUtils,
  Data.DB,
  Data.Win.ADODB,
  System.Generics.Collections,
  AdaptersUnit;

type
  AccessAdapter = class(TInterfacedObject, Adapters)
  private
    caption: string;
    ADOConnection: TADOConnection;
  public
    function getQuest: TList<string>;
    function getAnswerTrue: TDictionary<string, integer>;
    function getAnswerFalse: TDictionary<string, integer>;
    function getMenu: TList<string>;
    procedure setTest(caption: string);
  published
    constructor create;
  end;

implementation

{ AccessAdapter }

function AccessAdapter.getAnswerFalse: TDictionary<string, integer>;
var
  ADOQuery: TADOQuery;
  answerFalse: string;
begin
  result := TDictionary<string, integer>.create;
  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    Close;
    SQL.Clear;
    SQL.Add('SELECT answerFalse FROM Main WHERE caption="' +
      Self.caption + '";');
    Open;
    Active := True;
  end;
  ADOQuery.First;
  answerFalse := ADOQuery.FieldByName('answerFalse').AsString;
  with (ADOQuery) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT caption FROM ' + answerFalse + ';');
    Open;
    Active := True;
  end;
  while not ADOQuery.Eof do
  begin
    result.Add(ADOQuery.FieldByName('caption').AsString,
      ADOQuery.FieldByName('quest_id').AsInteger);
    ADOQuery.Next;
  end;
  ADOQuery.Free;
end;

function AccessAdapter.getAnswerTrue: TDictionary<string, integer>;
var
  ADOQuery: TADOQuery;
  answerTrue: string;
begin
  result := TDictionary<string, integer>.create;
  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    Close;
    SQL.Clear;
    SQL.Add('SELECT answerTrue FROM Main WHERE caption="' +
      Self.caption + '";');
    Open;
    Active := True;
  end;
  ADOQuery.First;
  answerTrue := ADOQuery.FieldByName('answerTrue').AsString;
  with (ADOQuery) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT quest_id, caption FROM ' + answerTrue + ';');
    Open;
    Active := True;
  end;
  while not ADOQuery.Eof do
  begin
    result.Add(ADOQuery.FieldByName('caption').AsString,
      ADOQuery.FieldByName('quest_id').AsInteger);
    ADOQuery.Next;
  end;
  ADOQuery.Free;
end;

function AccessAdapter.getQuest: TList<string>;
var
  ADOQuery: TADOQuery;
  quest: string;
begin
  result := TList<string>.create;
  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    Close;
    SQL.Clear;
    SQL.Add('SELECT quest FROM Main WHERE caption="' + Self.caption + '";');
    Open;
    Active := True;
  end;
  ADOQuery.First;
  quest := ADOQuery.FieldByName('quest').AsString;
  with (ADOQuery) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT caption FROM ' + quest + ';');
    Open;
    Active := True;
  end;
  while not ADOQuery.Eof do
  begin
    result.Add(ADOQuery.FieldByName('caption').AsString);
    ADOQuery.Next;
  end;
  ADOQuery.Free;
end;

procedure AccessAdapter.setTest(caption: string);
begin
  Self.caption := caption;
end;

constructor AccessAdapter.create;
begin
  ADOConnection := TADOConnection.create(nil);
  with (ADOConnection) do
  begin
    Provider := 'Microsoft.ACE.OLEDB.12.0';
    Mode := cmShareDenyNone;
    LoginPrompt := false;
    ConnectionString := 'Provider=Microsoft.ACE.OLEDB.12.0;' +
      'Data Source=Phisics.accdb;' + 'Persist Security Info=False';
    Connected := True;
  end;
end;

function AccessAdapter.getMenu: TList<string>;
var
  ADOQuery: TADOQuery;
  DataSource: TDAtaSource;
begin
  result := TList<string>.create;
  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    Close;
    SQL.Clear;
    SQL.Add('SELECT caption From Main;');
    Open;
    Active := True;
  end;
  ADOQuery.First;
  while not ADOQuery.Eof do
  begin
    result.Add(ADOQuery.FieldByName('caption').AsString);
    ADOQuery.Next;
  end;
  ADOQuery.Free;
end;

end.
