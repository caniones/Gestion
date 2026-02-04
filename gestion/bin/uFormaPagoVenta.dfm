inherited frmFormaPagoVenta: TfrmFormaPagoVenta
  Left = 436
  Top = 220
  Caption = 'Pago de Venta'
  ClientHeight = 322
  ClientWidth = 361
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 16
    Top = 171
    Width = 73
    Height = 20
    Caption = 'SubTotal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel [1]
    Left = 16
    Top = 195
    Width = 88
    Height = 20
    Caption = 'Descuento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel [2]
    Left = 16
    Top = 219
    Width = 41
    Height = 20
    Caption = 'Total'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBText1: TDBText [3]
    Left = 196
    Top = 171
    Width = 70
    Height = 20
    Alignment = taRightJustify
    AutoSize = True
    DataField = 'SUBTOTAL'
    DataSource = dsDatos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBText2: TDBText [4]
    Left = 196
    Top = 195
    Width = 70
    Height = 20
    Alignment = taRightJustify
    AutoSize = True
    DataField = 'DESCUENTO'
    DataSource = dsDatos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBText3: TDBText [5]
    Left = 196
    Top = 219
    Width = 70
    Height = 20
    Alignment = taRightJustify
    AutoSize = True
    DataField = 'TOTAL'
    DataSource = dsDatos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel [6]
    Left = 16
    Top = 120
    Width = 71
    Height = 13
    Caption = 'Forma de pago'
  end
  object Label5: TLabel [7]
    Left = 16
    Top = 64
    Width = 32
    Height = 13
    Caption = 'Cliente'
  end
  object Label6: TLabel [8]
    Left = 256
    Top = 120
    Width = 91
    Height = 13
    Caption = 'Cantidad de copias'
  end
  object Label7: TLabel [9]
    Left = 16
    Top = 243
    Width = 134
    Height = 20
    Caption = 'Total Financiado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBText4: TDBText [10]
    Left = 196
    Top = 243
    Width = 70
    Height = 20
    Alignment = taRightJustify
    AutoSize = True
    DataField = 'TOTAL_FINANCIADO'
    DataSource = dsDatos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited PanelButton: TPanel
    Top = 264
    Width = 361
    TabOrder = 3
    inherited btnAceptar: TSpeedButton
      Left = 198
      Visible = False
      OnClick = btnAceptarClick
    end
    inherited btnCancelar: TSpeedButton
      Left = 251
    end
    inherited btnSalir: TSpeedButton
      Left = 304
      Visible = False
    end
  end
  inherited PanelHeader: TPanel
    Width = 361
    TabOrder = 4
    inherited lInfo: TLabel
      Width = 91
      Caption = 'Formas de pago'
    end
    inherited lRequeridos: TLabel
      Width = 245
      Caption = 'Verifique los datos y cobre antes de aceptar el pago'
    end
  end
  object dblcFormaPago: TDBLookupComboBox
    Left = 16
    Top = 144
    Width = 225
    Height = 21
    DataField = 'IDFORMAPAGO'
    DataSource = dsComprobante
    DropDownRows = 15
    Enabled = False
    KeyField = 'IDFORMAPAGO'
    ListField = 'DESCRIPCION'
    ListSource = dsFormaPago
    TabOrder = 1
    OnClick = dblcFormaPagoClick
    OnEnter = dblcFormaPagoEnter
  end
  object dblcCliente: TDBLookupComboBox
    Left = 16
    Top = 88
    Width = 337
    Height = 21
    DataField = 'IDCLIENTE'
    DataSource = dsComprobante
    DropDownRows = 20
    KeyField = 'IDCLIENTE'
    ListField = 'NOMBRE'
    ListSource = dsCliente
    TabOrder = 0
    OnClick = dblcClienteClick
    OnEnter = dblcClienteEnter
  end
  object cbCantidadCopias: TComboBox
    Left = 256
    Top = 144
    Width = 97
    Height = 21
    AutoDropDown = True
    DropDownCount = 11
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 2
    Text = 'Ninguna'
    OnKeyPress = cbCantidadCopiasKeyPress
    Items.Strings = (
      'Ninguna'
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10')
  end
  object dsDatos: TDataSource
    AutoEdit = False
    DataSet = dmComprobantesVentas.ibqDetalleGral
    Left = 176
    Top = 195
  end
  object dsFormaPago: TDataSource
    AutoEdit = False
    DataSet = dmComprobantesVentas.ibqFormasPagos
    Left = 208
    Top = 144
  end
  object dsComprobante: TDataSource
    AutoEdit = False
    DataSet = dmComprobantesVentas.ibdsComprobantes
    Left = 256
    Top = 192
  end
  object dsCliente: TDataSource
    AutoEdit = False
    DataSet = dmComprobantesVentas.ibqClientes
    Left = 320
    Top = 80
  end
end
