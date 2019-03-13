unit Unit1;

interface

uses
  System.Generics.Collections,
  PhisicsControllerUnit,
  ControllersUnit,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    list: TList<string>;
    Buttons: TList<TButton>;
    /// <link>aggregation</link>
    Controller1: Controllers;
    procedure createNextAnswer;
    procedure createListAnswer;
    procedure createQuestCaption;
    procedure getQuest; { Public declarations }
    procedure destroyButtons;
    procedure createButtons(list: TList<string>);
    procedure destroyButtonsAnswer;
    procedure createButtonsAnswer(list: TList<string>);
  public
    procedure onButtonClick1(Sender: TObject);
    procedure onButtonAnswerClick1 (sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.onButtonAnswerClick1(sender: TObject);
begin

end;

procedure TForm1.createButtonsAnswer(list: TList<string>);
begin
  ButtonsAnswer := TList<TButton>.create;
  self.listAnswer := TList<string>.create;
  self.listAnswer := list;
  for s in listAnswer do
  begin
    ButtomsAnswer.add(TButton.create(self));
    with ButtonsAnswer.Last do
    begin
      Parent := self;
      Top := i * 41;
      Caption := s;
      Width := 300;
      OnClick := onButtonAnswerClick1;
    end;
  end;
end;

procedure TForm1.destroyButtonsAnswer;
var
  b: TButton;
begin
  for b in ButtonsAnswer do
  begin
    b.Parent := nil;
  end;
  ButtonsAnswer.DeleteRange(0, ButtonsAnswer.Count - 1);
end;

procedure TForm1.createNextAnswer;
begin
  createButtonsAnswer(Controller1.getListAnswer);
end;

procedure TForm1.createListAnswer;
var
  listAnswer: TList<string>;
begin
  listAnswer := TList<string>.create;
  listAnswer := Controller1.getTListAnswer;
  createNextAnswer;
  // createListAnswer(listAnswer);
end;

procedure TForm1.createNextAnswer;
begin

end;

procedure TForm1.createQuestCaption;
begin
  self.Caption := Controller1.getQuestCaption;
end;

procedure TForm1.getQuest;
begin
  createQuestCaption;
  createListAnswer;
end;

procedure TForm1.destroyButtons;
var
  b: TButton;
begin
  for b in Buttons do
  begin
    b.Parent := nil;
  end;
  Buttons.DeleteRange(0, Buttons.Count - 1);
end;

procedure TForm1.createButtons(list: TList<string>);
var
  i: integer;
  s: string;
begin
  i := 0; // почему умножение на 0?
  Buttons := TList<TButton>.create;
  self.list := TList<string>.create;
  self.list := list;
  for s in list do
  begin
    Buttons.add(TButton.create(self));
    with Buttons.Last do
    begin
      Parent := self;
      Top := i * 41;
      Caption := s;
      Width := 300;
      OnClick := onButtonClick1;
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  list: TList<string>;
begin
  Controller1 := PhisicsController.create;
  list := TList<string>.create;
  list := Controller1.getMenu;
  createButtons(list);
end;

procedure TForm1.onButtonClick1(Sender: TObject);
var
  questCaption: string;
  listAnswer: TList<string>;
begin
  Controller1.setTest((Sender as TButton).Caption);
  destroyButtons;
  getQuest;
  { quest := Tlist<string>.create;
    answerTrue := TDictionary<integer, string>.create;
    answerFalse := TDictionary<integer, string>.create;
    quest := Controller1.getQuest;
    answerTrue := Controller1.getAnswerTrue;
    answerFalse := Controller1.getAnswerFalse; }
end;

end.
