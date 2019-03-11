unit PhisicsControllerUnit;

interface

uses
  Test1Unit,
  TestsUnit,
  MenuUnit,
  MainUnit,
  System.Generics.Collections,
  ControllersUnit;

type
  PhisicsController = class(TInterfacedObject, Controllers)
  private
    Test: Tests;
    /// <link>aggregation</link>
    Menu1: Main;
  public
    procedure setTest(caption: string);
    function getMenu: TList<string>;
  end;

implementation

{ PhisicsController }

function PhisicsController.getMenu: TList<string>;
begin
  result := TList<string>.create;
  Menu1:= Menu.Create;
  result:= Menu1.getMenu;
end;

procedure PhisicsController.setTest(caption: string);
begin
  Test := Test1.create;
  Test.SetTest(caption);
end;

end.
