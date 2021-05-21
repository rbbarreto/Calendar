unit uCalendar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids,
  Vcl.Samples.Calendar, Vcl.ComCtrls,
  Data.DB, Datasnap.DBClient, Vcl.DBGrids, System.Dateutils, Vcl.WinXCalendars,
  Vcl.ExtCtrls, Vcl.Menus;

type

  TCalendario = class(TCalendar)
  protected
    procedure click; override;
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect;
      AState: TGridDrawState); override;
    function GetRandomColor: TColor;
  end;

type
  TfrmCalendar = class(TForm)
    Calendar1: TCalendar;
    btnNextMonth: TButton;
    Button2: TButton;
    btnNexYear: TButton;
    btnPrevTear: TButton;
    btnNewDate: TButton;
    Label1: TLabel;
    edtNewDate: TEdit;
    CheckBox1: TCheckBox;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Nome: TStringField;
    ClientDataSet1DataAgenda: TDateField;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    edtNome: TLabeledEdit;
    GroupBox1: TGroupBox;
    Button3: TButton;
    Edit1: TEdit;
    DateTimePicker1: TDateTimePicker;
    edt_Nome: TLabel;
    lfdData: TLabel;
    pmnCadastra: TPopupMenu;
    Cadastrar1: TMenuItem;
    Label2: TLabel;
    procedure Calendar1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure btnNewDateClick(Sender: TObject);
    procedure btnPrevTearClick(Sender: TObject);
    procedure btnNexYearClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnNextMonthClick(Sender: TObject);
    procedure CalendarView1DrawDayItem(Sender: TObject;
      DrawParams: TDrawViewInfoParams; CalendarViewViewInfo: TCellItemViewInfo);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button3Click(Sender: TObject);
    procedure Cadastrar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    AText: string;
    ACol, ALin: Integer;
    procedure OnshowForm;
    procedure CarregarClientDataSet;
    procedure BOnclick(sender : TObject);


//    https://forum.scriptbrasil.com.br/topic/183969-pintar-celula-dia-do-tcalendar/

  end;

var
  frmCalendar: TfrmCalendar;
  A: Array [0 .. 31] of Byte;
  Dia, CC: Integer;

implementation

{$R *.dfm}

procedure TfrmCalendar.btnNewDateClick(Sender: TObject);
begin
  try
    Calendar1.CalendarDate := StrToDateTime(edtNewDate.Text);
  except
    Application.MessageBox
      ('Error setting the  new date. Possible an incorrect format.' + #13#10 +
      'The correct date format is format is: mm/dd/yyyy', 'Error', MB_OK);
  end;
end;

procedure TfrmCalendar.btnNextMonthClick(Sender: TObject);
begin
 Calendar1.NextMonth;
end;

procedure TfrmCalendar.btnNexYearClick(Sender: TObject);
begin
  Calendar1.NextYear;
end;

procedure TfrmCalendar.btnPrevTearClick(Sender: TObject);
begin
  Calendar1.PrevYear;
end;

procedure TfrmCalendar.Button2Click(Sender: TObject);
begin
  Calendar1.PrevMonth;
end;

procedure TfrmCalendar.Button3Click(Sender: TObject);
begin
  ClientDataSet1.Append;
  ClientDataSet1Nome.AsString := Edit1.Text;
  ClientDataSet1DataAgenda.AsDateTime := DateTimePicker1.Date;
  ClientDataSet1.Post;

end;

procedure TfrmCalendar.Cadastrar1Click(Sender: TObject);
begin
  DateTimePicker1.DateTime := Calendar1.CalendarDate;
  Edit1.SetFocus;
end;

procedure TfrmCalendar.Calendar1Change(Sender: TObject);
begin
  Label1.Caption := Format('Curretn date is: %s ',
    [DateTimeToStr(Calendar1.CalendarDate)]);

  edtNewDate.Text := DateTimeToStr(Calendar1.CalendarDate);
end;

procedure TfrmCalendar.CalendarView1DrawDayItem(Sender: TObject;
  DrawParams: TDrawViewInfoParams; CalendarViewViewInfo: TCellItemViewInfo);
begin
  if DayOfWeek(CalendarViewViewInfo.Date) in [1,7] then
  DrawParams.FocusedColor := clGreen;
end;

procedure TfrmCalendar.CarregarClientDataSet;
var
  I: Integer;
  Date : string;
begin

  for I := 0 to 10 do
     begin
        ClientDataSet1.Append;
          ClientDataSet1Nome.AsString := 'Valor :  ' + IntToStr(i);
          ClientDataSet1DataAgenda.AsDateTime := incDay(Now, I);

          Date := Copy(DateToStr(ClientDataSet1DataAgenda.AsDateTime), 1, 2);
          A[i] := StrToInt(Date);
          ClientDataSet1.Post;
     end;
end;

procedure TfrmCalendar.CheckBox1Click(Sender: TObject);
begin
  Calendar1.UseCurrentDate := CheckBox1.Checked;
  Calendar1.OnChange(Self);
end;


procedure TfrmCalendar.DBGrid1CellClick(Column: TColumn);
begin

  Calendar1.CalendarDate := ClientDataSet1DataAgenda.AsDateTime;
  edtNome.Text := ClientDataSet1Nome.AsString;
end;

procedure TfrmCalendar.FormCreate(Sender: TObject);
begin
  Calendar1.OnChange(Self);
  OnshowForm;
end;


procedure TfrmCalendar.BOnclick(sender: TObject);
var
  s: string;
begin
  S := datetostr(Calendar1.CalendarDate);
  frmCalendar.edtNewDate.Text := copy(s, 1, 2);
  frmCalendar.edtNewDate.Refresh;
end;

procedure TfrmCalendar.OnshowForm;
//var
//  Calendar1: TCalendar;
begin
//  Calendar1 := TCalendario.Create(Self);
//  Calendar1.Parent := Self;
//  Calendar1.Top := 24;
//  Calendar1.Left := 40;
//  Calendar1.Height := 306;
//  Calendar1.Width := 625;
//  Calendar1.NextMonth;

  ClientDataSet1.CreateDataSet;
  CarregarClientDataSet;
end;

{ TCalendario }

procedure TCalendario.click;
var
  s: string;
begin
  inherited;
  S := datetostr(CalendarDate);
  frmCalendar.edtNewDate.Text := copy(s, 1, 2);
  frmCalendar.edtNewDate.Refresh;
end;

procedure TCalendario.DrawCell(ACol, ARow: Longint; ARect: TRect;
  AState: TGridDrawState);
var
  Ano, Mes, Dia: Word;
  Texto: string;
  X, Acount, I: Integer;
  Color: TColor;

begin
  inherited;

//  DecodeDate(Now, Ano, Mes, Dia);
  Texto := CellText[ACol, ARow];

  X := 0;

//   A[0] := 4;
//   A[1] := 10;
//   A[2] := 19;
//   A[3] := 21;
//   A[4] := 29;


  for X := 0 to 10 do
  begin
    if Texto = inttostr(A[X]) then
    begin
      Canvas.Font.Color := clBlue;
      Canvas.Font.Style := [fsBold];

      Canvas.Brush.Color := GetRandomColor;

//      case X of
//        0:
//          Canvas.Brush.Color := claqua;
//        1:
//          Canvas.Brush.Color := clYellow;
//        2:
//          Canvas.Brush.Color := clLime;
//        3:
//          Canvas.Brush.Color := clMoneyGreen;
//        4:
//          Canvas.Brush.Color := $00FFAEFF;
//      end;

      with ARect, Canvas do
        TextRect(ARect, Left + (Right - Left - TextWidth(Texto)) div 2,
          Top + (Bottom - Top - TextHeight(Texto)) div 2, Texto);
      Canvas.Font.Color := clBlue;
    end
    else
    begin
      with ARect, Canvas do
        TextRect(ARect, Left + (Right - Left - TextWidth(Texto)) div 2,
          Top + (Bottom - Top - TextHeight(Texto)) div 2, Texto);
    end;

  end;
end;

function TCalendario.GetRandomColor: TColor;
begin
  Result := RGB(Random(255), Random(255), Random(255));
end;


end.
