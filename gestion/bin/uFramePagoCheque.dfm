object FramePagoCheque: TFramePagoCheque
  Left = 0
  Top = 0
  Width = 320
  Height = 214
  Color = clWhite
  ParentColor = False
  TabOrder = 0
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 91
    Height = 13
    Caption = 'N'#250'mero de cheque'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 1738751
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 64
    Width = 86
    Height = 13
    Caption = 'Fecha del cheque'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 1738751
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 112
    Width = 31
    Height = 13
    Caption = 'Banco'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 1738751
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 160
    Width = 71
    Height = 13
    Caption = 'Observaciones'
  end
  object Label5: TLabel
    Left = 176
    Top = 112
    Width = 35
    Height = 13
    Caption = 'Importe'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 1738751
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lFechaCobro: TLabel
    Left = 176
    Top = 64
    Width = 75
    Height = 13
    Caption = 'Fecha de cobro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 1738751
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object dbtFecha: TDBText
    Left = 176
    Top = 32
    Width = 45
    Height = 13
    AutoSize = True
    DataField = 'FECHA'
    DataSource = dsCheques
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lFechaIngreso: TLabel
    Left = 176
    Top = 16
    Width = 82
    Height = 13
    Caption = 'Fecha de ingreso'
  end
  object dbeNroCheque: TDBEdit
    Left = 8
    Top = 32
    Width = 121
    Height = 21
    DataField = 'NROCHEQUE'
    DataSource = dsCheques
    TabOrder = 0
  end
  object dbeBanco: TDBEdit
    Left = 8
    Top = 128
    Width = 153
    Height = 21
    DataField = 'BANCO'
    DataSource = dsCheques
    TabOrder = 2
  end
  object dtpFechaCheque: TDateTimePicker
    Left = 8
    Top = 80
    Width = 137
    Height = 21
    Date = 40125.447501261600000000
    Time = 40125.447501261600000000
    TabOrder = 1
    OnChange = dtpFechaChequeChange
  end
  object dbeImporte: TDBEdit
    Left = 176
    Top = 128
    Width = 97
    Height = 21
    DataField = 'IMPORTE'
    DataSource = dsCheques
    TabOrder = 3
  end
  object dtpFechaCobro: TDateTimePicker
    Left = 176
    Top = 80
    Width = 137
    Height = 21
    Date = 40125.448776944400000000
    Time = 40125.448776944400000000
    TabOrder = 5
    OnChange = dtpFechaCobroChange
  end
  object dbeObservacion: TDBEdit
    Left = 8
    Top = 176
    Width = 305
    Height = 21
    DataField = 'OBSERVACIONES'
    DataSource = dsCheques
    TabOrder = 4
  end
  object dsCheques: TDataSource
    AutoEdit = False
    DataSet = dmPagos.ibdsCheques
    OnStateChange = dsChequesStateChange
    Left = 280
    Top = 16
  end
end
