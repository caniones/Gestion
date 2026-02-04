inherited frmPagosProveedores: TfrmPagosProveedores
  Left = 525
  Top = 281
  Caption = 'Pagos a proveedores'
  ClientHeight = 265
  ClientWidth = 459
  OldCreateOrder = True
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 24
    Top = 64
    Width = 30
    Height = 13
    Caption = 'Fecha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 1738751
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel [1]
    Left = 24
    Top = 112
    Width = 49
    Height = 13
    Caption = 'Proveedor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 1738751
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel [2]
    Left = 24
    Top = 160
    Width = 71
    Height = 13
    Caption = 'Forma de pago'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 1738751
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel [3]
    Left = 192
    Top = 160
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
  inherited PanelButton: TPanel
    Left = -8
    Top = 208
    Width = 385
    TabOrder = 4
    inherited btnAceptar: TSpeedButton
      Left = 117
      Enabled = False
      Visible = False
      OnClick = btnAceptarClick
    end
    inherited btnCancelar: TSpeedButton
      Left = 170
    end
    inherited btnSalir: TSpeedButton
      Left = 223
      Visible = False
    end
  end
  inherited PanelHeader: TPanel
    Width = 385
    TabOrder = 5
    inherited lInfo: TLabel
      Width = 30
      Caption = 'Pago'
    end
    inherited lRequeridos: TLabel
      Width = 212
      Caption = 'Los campos en color naranja son obligatorios'
    end
  end
  object dblcProveedor: TDBLookupComboBox
    Left = 24
    Top = 128
    Width = 265
    Height = 21
    DataField = 'IDPROVEEDOR'
    DataSource = dsDatos
    DropDownRows = 20
    KeyField = 'IDPROVEEDOR'
    ListField = 'NOMBRE_FANTASIA'
    ListSource = dsProveedores
    TabOrder = 1
  end
  object dblcFormaPago: TDBLookupComboBox
    Left = 24
    Top = 176
    Width = 153
    Height = 21
    DataField = 'IDFORMAPAGO'
    DataSource = dsDatos
    DropDownRows = 20
    KeyField = 'IDFORMAPAGO'
    ListField = 'DESCRIPCION'
    ListSource = dsFormasPagos
    TabOrder = 2
    OnClick = dblcFormaPagoClick
    OnExit = dblcFormaPagoExit
  end
  object dbeImporte: TDBEdit
    Left = 192
    Top = 176
    Width = 97
    Height = 21
    DataField = 'IMPORTE'
    DataSource = dsDatos
    TabOrder = 3
  end
  object dtpFecha: TDateTimePicker
    Left = 24
    Top = 80
    Width = 121
    Height = 21
    Date = 40162.246391782400000000
    Time = 40162.246391782400000000
    TabOrder = 0
    OnChange = dtpFechaChange
  end
  object dsDatos: TDataSource
    AutoEdit = False
    DataSet = dmEstadoCtasCtesProveedores.ibdsPagos
    Left = 248
    Top = 80
  end
  object dsProveedores: TDataSource
    AutoEdit = False
    DataSet = dmEstadoCtasCtesProveedores.ibqProveedores
    Left = 216
    Top = 128
  end
  object dsFormasPagos: TDataSource
    AutoEdit = False
    DataSet = dmEstadoCtasCtesProveedores.ibqFormasPagos
    Left = 112
    Top = 168
  end
end
