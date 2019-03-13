unit ControllersUnit;

interface

uses System.Generics.Collections;

type
  Controllers = interface
    function getListAnswer: TList<string>;                   //function getTListAnswer: TList<string>;
    function getQuestCaption: string;
    procedure setTest(caption: string);
    function getMenu: TList<string>;
    {
    function getAnswerTrue: TDictionary<string, integer>;
    function getAnswerFalse: TDictionary<string, integer>; }
  end;

implementation

end.
