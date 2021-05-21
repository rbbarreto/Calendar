program calendar;

uses
  Vcl.Forms,
  uCalendar in 'uCalendar.pas' {frmCalendar};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCalendar, frmCalendar);
  Application.Run;
end.
