program CalsLost;

uses
  Forms,
  Main in 'Main.pas' {formCalsLost};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TformCalsLost, formCalsLost);
  Application.Run;
end.
