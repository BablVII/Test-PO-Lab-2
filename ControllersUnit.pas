unit ControllersUnit;

interface

uses System.Generics.Collections;

type
  Controllers = interface
    procedure setTest(caption: string);
    function getMenu: TList<string>;
  end;

implementation

end.
