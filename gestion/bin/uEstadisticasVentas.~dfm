inherited frmEstadisticasVentas: TfrmEstadisticasVentas
  Left = 274
  Top = 171
  Caption = 'Estad'#237'sticas de ventas'
  ClientHeight = 542
  ClientWidth = 902
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
    Left = 272
    Top = 64
    Width = 50
    Height = 50
    Caption = 'Buscar'
    Flat = True
    OnClick = btnBuscarClick
  end
  inherited PanelButton: TPanel
    Top = 485
    inherited btnAceptar: TSpeedButton
      Visible = False
    end
    inherited btnCancelar: TSpeedButton
      Visible = False
    end
    inherited btnSalir: TSpeedButton
      OnClick = btnSalirClick
    end
  end
  inherited PanelHeader: TPanel
    Width = 449
    inherited lInfo: TLabel
      Width = 161
      Caption = 'Ventas mensuales / anuales'
    end
    inherited lRequeridos: TLabel
      Width = 269
      Caption = 'En la grilla superior ventas mensuales y la inferior anuales'
    end
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 123
    Width = 697
    Height = 246
    DataSource = dsMes
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'FECHA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTADO'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEBITO'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CREDITO'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHEQUE'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TICKET'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPOSITO'
        Width = 64
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 372
    Width = 697
    Height = 109
    DataSource = dsAnio
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'FECHA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTADO'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEBITO'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CREDITO'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHEQUE'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TICKET'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPOSITO'
        Width = 64
        Visible = True
      end>
  end
  object dtpDesde: TDateTimePicker
    Left = 8
    Top = 80
    Width = 121
    Height = 21
    Date = 41234.000000000000000000
    Time = 41234.000000000000000000
    TabOrder = 4
    OnCloseUp = dtpDesdeCloseUp
  end
  object dtpHasta: TDateTimePicker
    Left = 144
    Top = 80
    Width = 121
    Height = 21
    Date = 41234.999988425930000000
    Time = 41234.999988425930000000
    TabOrder = 5
    OnCloseUp = dtpHastaCloseUp
  end
  object dsMes: TDataSource
    AutoEdit = False
    DataSet = dmCierreTurno.ibqVentasXmes
    Left = 216
    Top = 144
  end
  object dsAnio: TDataSource
    AutoEdit = False
    DataSet = dmCierreTurno.ibqVentasXanio
    Left = 240
    Top = 400
  end
end
