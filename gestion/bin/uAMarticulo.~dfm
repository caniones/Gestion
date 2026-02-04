inherited frmImputArticulo: TfrmImputArticulo
  Left = 425
  Top = 205
  Caption = 'Art'#237'culos'
  ClientHeight = 481
  ClientWidth = 793
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox [0]
    Left = 8
    Top = 64
    Width = 457
    Height = 153
    Caption = 'Descripci'#243'n'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 68
      Height = 13
      Caption = 'C'#243'digo interno'
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
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 1738751
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 104
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
    object Label6: TLabel
      Left = 256
      Top = 24
      Width = 26
      Height = 13
      Caption = 'Titulo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 1738751
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object dbeCodigoInterno: TDBEdit
      Left = 8
      Top = 40
      Width = 233
      Height = 21
      DataField = 'CODIGO_INTERNO'
      DataSource = dsArticulos
      TabOrder = 0
    end
    object dbeDescripcion: TDBEdit
      Left = 8
      Top = 80
      Width = 433
      Height = 21
      DataField = 'DESCRIPCION'
      DataSource = dsArticulos
      TabOrder = 1
    end
    object dblcProveedor: TDBLookupComboBox
      Left = 8
      Top = 120
      Width = 250
      Height = 21
      DataField = 'IDPROVEEDOR'
      DataSource = dsArticulos
      DropDownRows = 15
      KeyField = 'IDPROVEEDOR'
      ListField = 'NOMBRE_FANTASIA'
      ListSource = dsProveedores
      TabOrder = 2
      OnClick = dblcProveedorClick
    end
    object dblcTitulo: TDBLookupComboBox
      Left = 256
      Top = 40
      Width = 185
      Height = 21
      DataField = 'IDTITULO'
      DataSource = dsArticulos
      KeyField = 'IDTITULO'
      ListField = 'DESCRIPCION'
      ListSource = dsTitulos
      TabOrder = 3
    end
  end
  inherited PanelButton: TPanel
    Top = 424
    Width = 697
    TabOrder = 6
    inherited btnAceptar: TSpeedButton
      Left = 446
      OnClick = btnAceptarClick
    end
    inherited btnCancelar: TSpeedButton
      Left = 499
    end
    inherited btnSalir: TSpeedButton
      Left = 552
      Visible = False
    end
  end
  inherited PanelHeader: TPanel
    TabOrder = 7
    inherited lInfo: TLabel
      Width = 52
      Caption = 'Art'#237'culos'
    end
    inherited lRequeridos: TLabel
      Width = 212
      Caption = 'Los campos en color naranja son obligatorios'
    end
  end
  object GroupBox1: TGroupBox
    Left = 240
    Top = 360
    Width = 457
    Height = 49
    Caption = 'Precios calculados'
    Color = clWhite
    ParentColor = False
    TabOrder = 5
    object Label7: TLabel
      Left = 120
      Top = 24
      Width = 63
      Height = 13
      Caption = 'Sin I.V.A.: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 256
      Top = 24
      Width = 37
      Height = 13
      Caption = 'I.V.A.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 352
      Top = 24
      Width = 34
      Height = 13
      Caption = 'Total:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbtSinIva: TDBText
      Left = 180
      Top = 24
      Width = 55
      Height = 13
      AutoSize = True
      DataField = 'PRECIO_SIN_IVA'
      DataSource = dsArticulos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbtIva: TDBText
      Left = 296
      Top = 24
      Width = 37
      Height = 13
      AutoSize = True
      DataField = 'PORCENTAJE_IVA'
      DataSource = dsArticulos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbtTotal: TDBText
      Left = 389
      Top = 24
      Width = 48
      Height = 13
      AutoSize = True
      DataField = 'PRECIO_FINAL'
      DataSource = dsArticulos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label20: TLabel
      Left = 8
      Top = 24
      Width = 37
      Height = 13
      Caption = 'Costo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbtCosto: TDBText
      Left = 48
      Top = 24
      Width = 51
      Height = 13
      AutoSize = True
      DataField = 'PRECIO_COSTO'
      DataSource = dsArticulos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object GroupBox3: TGroupBox
    Left = 472
    Top = 64
    Width = 225
    Height = 129
    Caption = 'Categor'#237'as'
    TabOrder = 1
    object Label4: TLabel
      Left = 8
      Top = 24
      Width = 29
      Height = 13
      Caption = 'Rubro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 1738751
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 64
      Width = 28
      Height = 13
      Caption = 'L'#237'nea'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 1738751
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object dblcRubro: TDBLookupComboBox
      Left = 8
      Top = 40
      Width = 209
      Height = 21
      DataField = 'IDRUBRO'
      DataSource = dsArticulos
      DropDownRows = 15
      KeyField = 'IDRUBRO'
      ListField = 'DESCRIPCION'
      ListSource = dsRubros
      TabOrder = 0
    end
    object dblcLinea: TDBLookupComboBox
      Left = 8
      Top = 80
      Width = 209
      Height = 21
      DataField = 'IDLINEA'
      DataSource = dsArticulos
      DropDownRows = 15
      KeyField = 'IDLINEA'
      ListField = 'DESCRIPCION'
      ListSource = dsLineas
      TabOrder = 1
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 224
    Width = 225
    Height = 185
    Caption = 'Precios y M'#225'rgenes'
    TabOrder = 2
    object Label11: TLabel
      Left = 8
      Top = 64
      Width = 75
      Height = 13
      Caption = 'Precio de Costo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 1738751
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 8
      Top = 104
      Width = 35
      Height = 13
      Caption = 'Utilidad'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 1738751
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 120
      Top = 64
      Width = 26
      Height = 13
      Caption = 'I.V.A.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 1738751
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 120
      Top = 104
      Width = 67
      Height = 13
      Caption = 'Precio p'#250'blico'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 1738751
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 8
      Top = 24
      Width = 77
      Height = 13
      Caption = 'Tipo de moneda'
    end
    object dbePrecioCosto: TDBEdit
      Left = 8
      Top = 80
      Width = 97
      Height = 21
      DataField = 'COSTO_UNITARIO'
      DataSource = dsArticulos
      TabOrder = 1
    end
    object dbeIva: TDBEdit
      Left = 120
      Top = 80
      Width = 97
      Height = 21
      DataField = 'IVA'
      DataSource = dsArticulos
      TabOrder = 3
    end
    object dbeUtilidad: TDBEdit
      Left = 8
      Top = 120
      Width = 97
      Height = 21
      DataField = 'UTILIDAD'
      DataSource = dsArticulos
      TabOrder = 2
    end
    object dbePrecioPublico: TDBEdit
      Left = 120
      Top = 120
      Width = 97
      Height = 21
      DataField = 'PRECIO_PUBLICO'
      DataSource = dsArticulos
      TabOrder = 4
    end
    object dblcMoneda: TDBLookupComboBox
      Left = 8
      Top = 40
      Width = 209
      Height = 21
      DataField = 'IDMONEDA'
      DataSource = dsArticulos
      KeyField = 'IDMONEDA'
      ListField = 'MONEDA'
      ListSource = dsMonedas
      TabOrder = 0
    end
  end
  object GroupBox5: TGroupBox
    Left = 472
    Top = 200
    Width = 225
    Height = 153
    Caption = 'Fechas'
    TabOrder = 4
    object dbtFechaActPrecio: TDBText
      Left = 8
      Top = 42
      Width = 109
      Height = 13
      AutoSize = True
      DataField = 'FECHA_ACTPRECIO'
      DataSource = dsArticulos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbtFechaBaja: TDBText
      Left = 84
      Top = 112
      Width = 79
      Height = 13
      AutoSize = True
      DataField = 'FECHA_BAJA'
      DataSource = dsArticulos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 8
      Top = 24
      Width = 143
      Height = 13
      Caption = #218'ltima Actualizaci'#243'n de Precio'
    end
    object Label15: TLabel
      Left = 8
      Top = 112
      Width = 72
      Height = 13
      Caption = 'Fecha de Baja:'
    end
    object Label16: TLabel
      Left = 8
      Top = 61
      Width = 84
      Height = 13
      Caption = 'Fecha de Compra'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 1738751
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object dtpFechaCompra: TDateTimePicker
      Left = 8
      Top = 77
      Width = 186
      Height = 21
      CalColors.TitleBackColor = 1738751
      Date = 39693.744189988400000000
      Time = 39693.744189988400000000
      TabOrder = 0
      OnChange = dtpFechaCompraChange
    end
    object btnRecuperar: TBitBtn
      Left = 96
      Top = 128
      Width = 60
      Height = 17
      Hint = 'Recupera el registro dado de baja'
      Caption = 'Recuperar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clOlive
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Visible = False
      OnClick = btnRecuperarClick
    end
  end
  object GroupBox6: TGroupBox
    Left = 240
    Top = 224
    Width = 225
    Height = 129
    Hint = 
      'Active el uso del Stock para que el sistema lleve un control del' +
      ' mismo'
    Caption = 'Stock   '
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    object Label17: TLabel
      Left = 8
      Top = 64
      Width = 65
      Height = 13
      Caption = 'Stock m'#237'nimo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 1738751
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label18: TLabel
      Left = 8
      Top = 24
      Width = 53
      Height = 13
      Caption = 'Existencias'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 1738751
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object dbePuntoReposicion: TDBEdit
      Left = 8
      Top = 80
      Width = 97
      Height = 21
      DataField = 'PUNTO_REPOSICION'
      DataSource = dsArticulos
      TabOrder = 2
    end
    object dbeStock: TDBEdit
      Left = 8
      Top = 40
      Width = 97
      Height = 21
      DataField = 'STOCK'
      DataSource = dsArticulos
      TabOrder = 1
    end
    object cbControlStock: TCheckBox
      Left = 40
      Top = 0
      Width = 137
      Height = 17
      Caption = 'Activar el uso del Stock'
      TabOrder = 0
      OnClick = cbControlStockClick
    end
  end
  object dsArticulos: TDataSource
    AutoEdit = False
    DataSet = dmArticulos.ibdsArticulos
    Left = 376
    Top = 176
  end
  object dsRubros: TDataSource
    AutoEdit = False
    DataSet = dmArticulos.ibqRubros
    Left = 640
    Top = 104
  end
  object dsLineas: TDataSource
    AutoEdit = False
    DataSet = dmArticulos.ibqLineas
    Left = 640
    Top = 144
  end
  object dsProveedores: TDataSource
    AutoEdit = False
    DataSet = dmArticulos.ibqProveedores
    Left = 216
    Top = 184
  end
  object dsTitulos: TDataSource
    AutoEdit = False
    DataSet = dmArticulos.ibqTitulos
    Left = 400
    Top = 104
  end
  object dsMonedas: TDataSource
    AutoEdit = False
    DataSet = dmArticulos.ibqMonedas
    Left = 176
    Top = 264
  end
end
