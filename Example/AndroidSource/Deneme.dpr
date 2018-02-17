program Deneme;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main1 in 'Main1.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
