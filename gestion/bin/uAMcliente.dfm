inherited frmImputCliente: TfrmImputCliente
  Left = 283
  Top = 94
  Caption = 'Clientes'
  ClientHeight = 401
  ClientWidth = 673
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 16
    Top = 56
    Width = 74
    Height = 13
    Caption = 'Situaci'#243'n Fiscal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 1738751
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel [1]
    Left = 16
    Top = 104
    Width = 37
    Height = 13
    Caption = 'Nombre'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 1738751
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel [2]
    Left = 16
    Top = 152
    Width = 45
    Height = 13
    Caption = 'Direcci'#243'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 1738751
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel [3]
    Left = 16
    Top = 200
    Width = 65
    Height = 13
    Caption = 'C'#243'digo Postal'
  end
  object Label7: TLabel [4]
    Left = 16
    Top = 248
    Width = 46
    Height = 13
    Caption = 'Localidad'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 1738751
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel [5]
    Left = 352
    Top = 56
    Width = 78
    Height = 13
    Caption = 'Limite de Cr'#233'dito'
  end
  object Label9: TLabel [6]
    Left = 352
    Top = 104
    Width = 57
    Height = 13
    Caption = 'Saldo Inicial'
  end
  object Label10: TLabel [7]
    Left = 16
    Top = 296
    Width = 29
    Height = 13
    Caption = 'E-Mail'
  end
  object Label15: TLabel [8]
    Left = 230
    Top = 56
    Width = 60
    Height = 13
    Caption = 'CUIT / CUIL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 1738751
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label16: TLabel [9]
    Left = 352
    Top = 152
    Width = 32
    Height = 13
    Caption = 'Inter'#233's'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 1738751
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  inherited PanelButton: TPanel
    Top = 344
    Width = 521
    TabOrder = 12
    inherited btnAceptar: TSpeedButton
      Left = 270
      OnClick = btnAceptarClick
    end
    inherited btnCancelar: TSpeedButton
      Left = 323
    end
    inherited btnSalir: TSpeedButton
      Left = 376
      Visible = False
    end
  end
  inherited PanelHeader: TPanel
    TabOrder = 13
    inherited lInfo: TLabel
      Width = 40
      Caption = 'Cliente'
    end
    inherited lRequeridos: TLabel
      Width = 212
      Caption = 'Los campos en color naranja son obligatorios'
    end
  end
  object GroupBox1: TGroupBox
    Left = 488
    Top = 104
    Width = 169
    Height = 217
    Caption = 'Tel'#233'fonos'
    TabOrder = 11
    object Label11: TLabel
      Left = 24
      Top = 24
      Width = 61
      Height = 13
      Caption = 'Tel'#233'fono Fijo'
    end
    object Label12: TLabel
      Left = 24
      Top = 72
      Width = 70
      Height = 13
      Caption = 'Tel'#233'fono Movil'
    end
    object Label13: TLabel
      Left = 24
      Top = 120
      Width = 98
      Height = 13
      Caption = 'Tel'#233'fono del Trabajo'
    end
    object Label14: TLabel
      Left = 24
      Top = 168
      Width = 72
      Height = 13
      Caption = 'N'#250'mero de Fax'
    end
    object dbeTelFijo: TDBEdit
      Left = 24
      Top = 40
      Width = 121
      Height = 21
      DataField = 'TELEFONO_FIJO'
      DataSource = dsClientes
      TabOrder = 0
    end
    object dbeTelMovil: TDBEdit
      Left = 24
      Top = 88
      Width = 121
      Height = 21
      DataField = 'TELEFONO_MOVIL'
      DataSource = dsClientes
      TabOrder = 1
    end
    object dbetelTrabajo: TDBEdit
      Left = 24
      Top = 136
      Width = 121
      Height = 21
      DataField = 'TELEFONO_TRABAJO'
      DataSource = dsClientes
      TabOrder = 2
    end
    object dbeTelFax: TDBEdit
      Left = 24
      Top = 184
      Width = 121
      Height = 21
      DataField = 'NUMERO_FAX'
      DataSource = dsClientes
      TabOrder = 3
    end
  end
  object dblcSituacion: TDBLookupComboBox
    Left = 16
    Top = 72
    Width = 201
    Height = 21
    DataField = 'IDSITUACION'
    DataSource = dsClientes
    KeyField = 'IDSITUACION'
    ListField = 'DESCRIPCION'
    ListSource = dsSituacion
    TabOrder = 0
  end
  object dbeNombre: TDBEdit
    Left = 16
    Top = 120
    Width = 321
    Height = 21
    DataField = 'NOMBRE'
    DataSource = dsClientes
    TabOrder = 2
  end
  object dbeDireccion: TDBEdit
    Left = 16
    Top = 168
    Width = 321
    Height = 21
    DataField = 'DIRECCION'
    DataSource = dsClientes
    TabOrder = 3
  end
  object dbeCodigoPostal: TDBEdit
    Left = 16
    Top = 216
    Width = 161
    Height = 21
    DataField = 'CODIGO_POSTAL'
    DataSource = dsClientes
    TabOrder = 4
  end
  object dblcLocalidad: TDBLookupComboBox
    Left = 16
    Top = 264
    Width = 297
    Height = 21
    DataField = 'IDLOCALIDAD'
    DataSource = dsClientes
    KeyField = 'IDLOCALIDAD'
    ListField = 'LOCALIDAD'
    ListSource = dsLocalidades
    TabOrder = 5
  end
  object dbeMail: TDBEdit
    Left = 16
    Top = 312
    Width = 297
    Height = 21
    DataField = 'EMAIL'
    DataSource = dsClientes
    TabOrder = 6
  end
  object dbeLimiteCredito: TDBEdit
    Left = 352
    Top = 72
    Width = 121
    Height = 21
    DataField = 'LIMITE_CREDITO'
    DataSource = dsClientes
    TabOrder = 7
  end
  object dbeSaldoInicial: TDBEdit
    Left = 352
    Top = 120
    Width = 121
    Height = 21
    DataField = 'SALDO_INICIAL'
    DataSource = dsClientes
    TabOrder = 8
  end
  object GroupBox2: TGroupBox
    Left = 352
    Top = 200
    Width = 129
    Height = 121
    Caption = 'Fechas'
    TabOrder = 10
    object dbtFechaIngreso: TDBText
      Left = 8
      Top = 40
      Width = 96
      Height = 13
      AutoSize = True
      DataField = 'FECHA_INGRESO'
      DataSource = dsClientes
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbtFechaBaja: TDBText
      Left = 8
      Top = 80
      Width = 79
      Height = 13
      AutoSize = True
      DataField = 'FECHA_BAJA'
      DataSource = dsClientes
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 86
      Height = 13
      Caption = 'Fecha de Ingreso:'
    end
    object Label2: TLabel
      Left = 8
      Top = 64
      Width = 72
      Height = 13
      Caption = 'Fecha de Baja:'
    end
    object btnRecuperar: TBitBtn
      Left = 15
      Top = 96
      Width = 59
      Height = 17
      Caption = 'Recuperar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clOlive
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Visible = False
      OnClick = btnRecuperarClick
      OnMouseMove = btnRecuperarMouseMove
    end
  end
  object dbeCuit: TDBEdit
    Left = 232
    Top = 72
    Width = 105
    Height = 21
    DataField = 'CUIT'
    DataSource = dsClientes
    TabOrder = 1
  end
  object dbeInteres: TDBEdit
    Left = 352
    Top = 168
    Width = 121
    Height = 21
    DataField = 'INTERES'
    DataSource = dsClientes
    TabOrder = 9
  end
  object dsClientes: TDataSource
    AutoEdit = False
    DataSet = dmClientes.ibdsClientes
    Left = 256
    Top = 208
  end
  object dsSituacion: TDataSource
    AutoEdit = False
    DataSet = dmClientes.ibqSituaciones
    Left = 160
    Top = 72
  end
  object dsLocalidades: TDataSource
    AutoEdit = False
    DataSet = dmClientes.ibqLocalidades
    Left = 192
    Top = 264
  end
end
