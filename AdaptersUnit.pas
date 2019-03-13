unit AdaptersUnit;

interface

uses
  System.Generics.Collections;

type
  Adapters = interface
    function getMenu: TList<string>;
    procedure setTest(caption: string);
    function getQuest: TList<string>;
    function getAnswerTrue: TDictionary<string, integer>;
    function getAnswerFalse: TDictionary<string, integer>;
  end;

implementation

end.
