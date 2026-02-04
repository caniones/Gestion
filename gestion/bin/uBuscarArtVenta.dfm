inherited frmBuscarArtVenta: TfrmBuscarArtVenta
  Left = 191
  Top = 103
  Caption = 'Buscar Art'#237'culo'
  ClientHeight = 473
  ClientWidth = 793
  OldCreateOrder = True
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelButton: TPanel
    Top = 417
    Width = 617
    inherited btnAceptar: TSpeedButton
      Left = 457
    end
    inherited btnCancelar: TSpeedButton
      Left = 510
    end
    inherited btnSalir: TSpeedButton
      Left = 563
      OnClick = btnSalirClick
    end
  end
  inherited PanelHeader: TPanel
    inherited lInfo: TLabel
      Width = 52
      Caption = 'Art'#237'culos'
    end
    inherited lRequeridos: TLabel
      Width = 185
      Caption = 'B'#250'squeda por C'#243'digos y Descripciones'
    end
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 88
    Width = 777
    Height = 321
    TabOrder = 2
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnDblClick = cxGrid1DBTableView1DblClick
      DataController.DataSource = dsDatos
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.IncSearch = True
      OptionsData.Editing = False
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1IDARTICULO: TcxGridDBColumn
        DataBinding.FieldName = 'IDARTICULO'
        Visible = False
      end
      object cxGrid1DBTableView1CODIGO_INTERNO: TcxGridDBColumn
        Caption = 'CODIGOINTERNO'
        DataBinding.FieldName = 'CODIGO_INTERNO'
      end
      object cxGrid1DBTableView1DESCRIPCION: TcxGridDBColumn
        DataBinding.FieldName = 'DESCRIPCION'
        Width = 250
      end
      object cxGrid1DBTableView1PRECIO_PUBLICO: TcxGridDBColumn
        Caption = 'PRECIO PUBLICO'
        DataBinding.FieldName = 'PRECIO_PUBLICO'
      end
      object cxGrid1DBTableView1LINEA: TcxGridDBColumn
        DataBinding.FieldName = 'LINEA'
        Width = 200
      end
      object cxGrid1DBTableView1RUBRO: TcxGridDBColumn
        DataBinding.FieldName = 'RUBRO'
        Width = 200
      end
      object cxGrid1DBTableView1PROVEEDOR: TcxGridDBColumn
        DataBinding.FieldName = 'PROVEEDOR'
        Width = 200
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object eBusquedaArticulo: TEdit
    Left = 8
    Top = 64
    Width = 393
    Height = 21
    TabOrder = 3
    OnKeyPress = eBusquedaArticuloKeyPress
  end
  object dsItems: TDataSource
    AutoEdit = False
    DataSet = dmComprobantesVentas.ibdsItems
    Left = 176
    Top = 176
  end
  object dsDatos: TDataSource
    AutoEdit = False
    DataSet = dmBuscarArtVenta.ibqArticulosBusqueda
    Left = 280
    Top = 56
  end
end
