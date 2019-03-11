unit Unit1;

interface

uses
  System.Generics.Collections, PhisicsControllerUnit, ControllersUnit,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    list:Tlist<string>;
    Labels: TList<TLabel>;
    /// <link>aggregation</link>
    Controller1: Controllers;
    procedure createPanels(list: TList<string>);
  public
    procedure onClick1(sender:TObject);
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.createPanels(list: TList<string>);
var
  i: integer;
  s: string;
begin
  i := 0;   //почему умножение на 0?
  Labels := TList<TLabel>.create;
  self.list := TList<string>.create;
  self.list := list;
  for s in list do
  begin
    Labels.Add(TLabel.create(self));
    with Labels.Last do
    begin
      Parent := self;
      Position.Y := i * 41;
      Text := s;
      Width := 300;
      OnClick := OnClick1;
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
  createPanels(Controller1.getMenu);
end;

procedure TForm1.onClick1(sender, TObject);
begin
  Controller1.setTest((Sender as TLabel).Text);
end;

end.
