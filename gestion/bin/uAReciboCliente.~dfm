inherited frmAReciboCliente: TfrmAReciboCliente
  Caption = 'Recibo Nuevo'
  ClientHeight = 281
  ClientWidth = 481
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 24
    Top = 80
    Width = 32
    Height = 13
    Caption = 'Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 1738751
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel [1]
    Left = 136
    Top = 128
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
  object Label3: TLabel [2]
    Left = 24
    Top = 176
    Width = 72
    Height = 13
    Caption = 'Forma de Pago'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 1738751
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel [3]
    Left = 248
    Top = 128
    Width = 77
    Height = 13
    Caption = 'Importe a cobrar'
  end
  object Label5: TLabel [4]
    Left = 24
    Top = 128
    Width = 27
    Height = 13
    Caption = 'Saldo'
  end
  object dbtFechaUltimoPago: TDBText [5]
    Left = 296
    Top = 104
    Width = 118
    Height = 13
    AutoSize = True
    DataField = 'FECHA'
    DataSource = dsUltimoPago
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel [6]
    Left = 296
    Top = 80
    Width = 56
    Height = 13
    Caption = #218'ltimo pago'
  end
  inherited PanelButton: TPanel
    Top = 224
    Width = 481
    TabOrder = 4
    inherited btnAceptar: TSpeedButton
      Left = 174
      Visible = False
      OnClick = btnAceptarClick
    end
    inherited btnCancelar: TSpeedButton
      Left = 227
    end
    inherited btnSalir: TSpeedButton
      Left = 280
      Visible = False
    end
  end
  inherited PanelHeader: TPanel
    Width = 481
    TabOrder = 5
    inherited lInfo: TLabel
      Width = 47
      Caption = 'Recibos'
    end
    inherited lRequeridos: TLabel
      Width = 212
      Caption = 'Los campos en color naranja son obligatorios'
    end
  end
  object dblcCliente: TDBLookupComboBox
    Left = 24
    Top = 96
    Width = 257
    Height = 21
    DataField = 'IDCLIENTE'
    DataSource = dsDatos
    DropDownRows = 20
    KeyField = 'IDCLIENTE'
    ListField = 'NOMBRE'
    ListSource = dsClientes
    TabOrder = 0
    OnClick = dblcClienteClick
  end
  object dbeImporte: TDBEdit
    Tag = 1
    Left = 136
    Top = 144
    Width = 97
    Height = 21
    DataField = 'IMPORTE'
    DataSource = dsDatos
    TabOrder = 2
  end
  object dblcFormaPago: TDBLookupComboBox
    Tag = 2
    Left = 24
    Top = 192
    Width = 209
    Height = 21
    DataField = 'IDFORMAPAGO'
    DataSource = dsDatos
    DropDownRows = 20
    Enabled = False
    KeyField = 'IDFORMAPAGO'
    ListField = 'DESCRIPCION'
    ListSource = dsFormasPagos
    TabOrder = 3
    OnClick = dblcFormaPagoClick
    OnExit = dblcFormaPagoExit
  end
  object dbeSaldo: TDBEdit
    Left = 24
    Top = 144
    Width = 97
    Height = 21
    DataField = 'SALDO'
    DataSource = dsSaldo
    Enabled = False
    TabOrder = 1
  end
  object dbeImporteRecargo: TDBEdit
    Left = 248
    Top = 144
    Width = 97
    Height = 21
    DataField = 'IMPORTERECARGO'
    DataSource = dsDatos
    Enabled = False
    TabOrder = 6
  end
  object dsDatos: TDataSource
    AutoEdit = False
    DataSet = dmRecibos.ibdsRecibos
    Left = 376
    Top = 184
  end
  object dsClientes: TDataSource
    AutoEdit = False
    DataSet = dmRecibos.ibqClientes
    Left = 104
    Top = 96
  end
  object dsFormasPagos: TDataSource
    AutoEdit = False
    DataSet = dmRecibos.ibqFormasPagos
    Left = 200
    Top = 184
  end
  object dsSaldo: TDataSource
    AutoEdit = False
    DataSet = dmRecibos.ibqSaldo
    Left = 88
    Top = 136
  end
  object dsUltimoPago: TDataSource
    AutoEdit = False
    DataSet = dmRecibos.ibqUltimoPago
    Left = 368
    Top = 88
  end
end
