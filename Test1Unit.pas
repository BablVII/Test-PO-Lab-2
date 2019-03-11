unit Test1Unit;

interface

uses
  AdaptersUnit,
  TestsUnit;

type
  Test1 = class(TInterfacedObject, Tests)
  private
    Adapter:Adapters;
  public
    procedure setTest(caption:string);
  end;
implementation

{ Test1 }

procedure Test1.setTest(caption: string);
begin
  Adapter.setTest(caption);
end;

end.
