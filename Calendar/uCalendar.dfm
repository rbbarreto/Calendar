object frmCalendar: TfrmCalendar
  Left = 0
  Top = 0
  Caption = 'Usando Calendar'
  ClientHeight = 473
  ClientWidth = 941
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object Label1: TLabel
    Left = 40
    Top = 352
    Width = 38
    Height = 17
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 40
    Top = 16
    Width = 47
    Height = 17
    Caption = 'Nome : '
  end
  object Calendar1: TCalendar
    Left = 40
    Top = 72
    Width = 521
    Height = 258
    PopupMenu = pmnCadastra
    StartOfWeek = 0
    TabOrder = 0
    UseCurrentDate = False
    OnChange = Calendar1Change
  end
  object btnNextMonth: TButton
    Left = 40
    Top = 440
    Width = 98
    Height = 25
    Caption = 'NextMonth'
    TabOrder = 1
    OnClick = btnNextMonthClick
  end
  object Button2: TButton
    Left = 144
    Top = 440
    Width = 90
    Height = 25
    Caption = 'PrevMonth'
    TabOrder = 2
    OnClick = Button2Click
  end
  object btnNexYear: TButton
    Left = 263
    Top = 440
    Width = 75
    Height = 25
    Caption = 'NexYear'
    TabOrder = 3
    OnClick = btnNexYearClick
  end
  object btnPrevTear: TButton
    Left = 344
    Top = 440
    Width = 75
    Height = 25
    Caption = 'PrevYear'
    TabOrder = 4
    OnClick = btnPrevTearClick
  end
  object btnNewDate: TButton
    Left = 464
    Top = 440
    Width = 75
    Height = 25
    Caption = 'NewDate'
    TabOrder = 5
    OnClick = btnNewDateClick
  end
  object edtNewDate: TEdit
    Left = 40
    Top = 381
    Width = 121
    Height = 25
    TabOrder = 6
  end
  object CheckBox1: TCheckBox
    Left = 177
    Top = 385
    Width = 161
    Height = 17
    Caption = 'Selecione data atual'
    TabOrder = 7
    OnClick = CheckBox1Click
  end
  object DBGrid1: TDBGrid
    Left = 567
    Top = 136
    Width = 369
    Height = 321
    DataSource = DataSource1
    TabOrder = 8
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 126
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DataAgenda'
        Width = 95
        Visible = True
      end>
  end
  object edtNome: TLabeledEdit
    Left = 40
    Top = 39
    Width = 521
    Height = 25
    EditLabel.Width = 55
    EditLabel.Height = 17
    EditLabel.Caption = 'edtNome'
    TabOrder = 9
  end
  object GroupBox1: TGroupBox
    Left = 567
    Top = 34
    Width = 369
    Height = 96
    Caption = ' Cadastro - Simples'
    TabOrder = 10
    object edt_Nome: TLabel
      Left = 79
      Top = 26
      Width = 40
      Height = 17
      Caption = 'Nome '
    end
    object lfdData: TLabel
      Left = 238
      Top = 24
      Width = 27
      Height = 17
      Caption = 'Data'
    end
    object Button3: TButton
      Left = 16
      Top = 47
      Width = 57
      Height = 25
      Caption = '+'
      TabOrder = 0
      OnClick = Button3Click
    end
    object Edit1: TEdit
      Left = 78
      Top = 49
      Width = 155
      Height = 25
      TabOrder = 1
    end
    object DateTimePicker1: TDateTimePicker
      Left = 239
      Top = 47
      Width = 121
      Height = 25
      Date = 44334.000000000000000000
      Time = 0.802912534723873300
      TabOrder = 2
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 687
    Top = 312
    object ClientDataSet1Nome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
    object ClientDataSet1DataAgenda: TDateField
      FieldName = 'DataAgenda'
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 768
    Top = 312
  end
  object pmnCadastra: TPopupMenu
    Left = 296
    Top = 296
    object Cadastrar1: TMenuItem
      Caption = 'Lan'#231'ar Registro'
      OnClick = Cadastrar1Click
    end
  end
end
