inherited frmEstadisticasProveedores: TfrmEstadisticasProveedores
  Left = 304
  Top = 165
  Caption = 'Estad'#237'sticas de proveedores'
  ClientHeight = 481
  ClientWidth = 802
  OldCreateOrder = True
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 64
    Width = 81
    Height = 13
    Caption = 'Compras por mes'
  end
  object Label2: TLabel [1]
    Left = 272
    Top = 64
    Width = 112
    Height = 13
    Caption = 'Compras por temporada'
  end
  object Label3: TLabel [2]
    Left = 8
    Top = 280
    Width = 73
    Height = 13
    Caption = 'Ventas por mes'
  end
  object Label4: TLabel [3]
    Left = 272
    Top = 280
    Width = 104
    Height = 13
    Caption = 'Ventas por temporada'
  end
  inherited PanelButton: TPanel
    Top = 424
    inherited btnSalir: TSpeedButton
      OnClick = btnSalirClick
    end
  end
  inherited PanelHeader: TPanel
    inherited lInfo: TLabel
      Width = 65
      Caption = 'Estad'#237'stica'
    end
    inherited lRequeridos: TLabel
      Width = 117
      Caption = 'Por mes y por temporada'
    end
  end
  object dbgComprasMes: TDBGrid
    Left = 8
    Top = 80
    Width = 257
    Height = 193
    DataSource = dsComprasMes
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'MES'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIDADES'
        Width = 70
        Visible = True
      end>
  end
  object dgbVentasMes: TDBGrid
    Left = 8
    Top = 296
    Width = 257
    Height = 120
    DataSource = dsVentasMes
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'MES'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIDADES'
        Width = 70
        Visible = True
      end>
  end
  object dbgComprasTemporada: TDBGrid
    Left = 272
    Top = 80
    Width = 521
    Height = 193
    DataSource = dsComprasTemporada
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PSANIO'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PSVERANO'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PSUNIDADESVERANO'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PSINVIERNO'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PSUNIDADESINVIERNO'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL'
        Width = 100
        Visible = True
      end>
  end
  object dbgVentasTemporada: TDBGrid
    Left = 272
    Top = 296
    Width = 521
    Height = 120
    DataSource = dsVentasTemporada
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PSANIO'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PSVERANO'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PSUNIDADESVERANO'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PSINVIERNO'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PSUNIDADESINVIERNO'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL'
        Width = 100
        Visible = True
      end>
  end
  object dsComprasMes: TDataSource
    AutoEdit = False
    DataSet = dmEstadoCtasCtesProveedores.ibqComprasXmes
    Left = 112
    Top = 136
  end
  object dsComprasTemporada: TDataSource
    AutoEdit = False
    DataSet = dmEstadoCtasCtesProveedores.ibqComprasXtemporada
    Left = 368
    Top = 128
  end
  object dsVentasMes: TDataSource
    AutoEdit = False
    DataSet = dmEstadoCtasCtesProveedores.ibqVentasXmes
    Left = 112
    Top = 352
  end
  object dsVentasTemporada: TDataSource
    AutoEdit = False
    DataSet = dmEstadoCtasCtesProveedores.ibqVentasXtemporada
    Left = 464
    Top = 344
  end
end
