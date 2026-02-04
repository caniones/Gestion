inherited frmEstadoCargaArticulos: TfrmEstadoCargaArticulos
  Left = 147
  Top = 75
  Caption = 'Estado de carga de art'#237'culos'
  ClientHeight = 545
  ClientWidth = 913
  OldCreateOrder = True
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 64
    Width = 31
    Height = 13
    Caption = 'Desde'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 1738751
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel [1]
    Left = 144
    Top = 64
    Width = 28
    Height = 13
    Caption = 'Hasta'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 1738751
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object btnBuscar: TSpeedButton [2]
    Left = 488
    Top = 64
    Width = 50
    Height = 50
    Caption = 'Buscar'
    Flat = True
    OnClick = btnBuscarClick
  end
  object Label3: TLabel [3]
    Left = 280
    Top = 64
    Width = 49
    Height = 13
    Caption = 'Proveedor'
  end
  object Label4: TLabel [4]
    Left = 536
    Top = 472
    Width = 92
    Height = 13
    Caption = 'Total Cantidad: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbtTotalCantidad: TDBText [5]
    Left = 632
    Top = 472
    Width = 98
    Height = 13
    AutoSize = True
    DataField = 'CANTIDAD_TOTAL'
    DataSource = dsTotalCantidad
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited PanelButton: TPanel
    Top = 488
    inherited btnSalir: TSpeedButton
      OnClick = btnSalirClick
    end
  end
  inherited PanelHeader: TPanel
    Width = 457
    inherited lInfo: TLabel
      Width = 94
      Caption = 'Estado de carga'
    end
    inherited lRequeridos: TLabel
      Width = 212
      Caption = 'Los campos en color naranja son obligatorios'
    end
  end
  object dtpDesde: TDateTimePicker
    Left = 8
    Top = 80
    Width = 121
    Height = 21
    Date = 41383.000000000000000000
    Time = 41383.000000000000000000
    TabOrder = 2
    OnChange = dtpDesdeChange
  end
  object dtpHasta: TDateTimePicker
    Left = 144
    Top = 80
    Width = 121
    Height = 21
    Date = 41383.999988425920000000
    Time = 41383.999988425920000000
    TabOrder = 3
    OnChange = dtpHastaChange
  end
  object dblcbProveedor: TDBLookupComboBox
    Left = 280
    Top = 80
    Width = 193
    Height = 21
    DropDownRows = 20
    KeyField = 'IDPROVEEDOR'
    ListField = 'NOMBRE_FANTASIA'
    ListSource = dsProveedores
    TabOrder = 4
    OnKeyPress = dblcbProveedorKeyPress
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 120
    Width = 897
    Height = 345
    DataSource = dsDatos
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'FECHA_COMPRA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_FANTASIA'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_INTERNO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STOCK'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COSTO_UNITARIO'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO_PUBLICO'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL_COSTO'
        Width = 64
        Visible = True
      end>
  end
  object dsDatos: TDataSource
    AutoEdit = False
    DataSet = dmProveedores.ibqEstadoCarga
    Left = 224
    Top = 208
  end
  object dsProveedores: TDataSource
    AutoEdit = False
    DataSet = dmProveedores.ibdsProveedores
    Left = 416
    Top = 80
  end
  object dsTotalCantidad: TDataSource
    AutoEdit = False
    DataSet = dmProveedores.ibqTotalCantidad
    Left = 768
    Top = 448
  end
end
