inherited frmRecibosClientes: TfrmRecibosClientes
  Left = 303
  Top = 185
  Caption = 'Recibos por pagos en Cuenta Corriente'
  ClientHeight = 437
  ClientWidth = 732
  OldCreateOrder = True
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelButton: TPanel
    Top = 380
    Width = 729
    inherited btnAceptar: TSpeedButton
      Left = 569
    end
    inherited btnCancelar: TSpeedButton
      Left = 622
    end
    inherited btnSalir: TSpeedButton
      Left = 675
      OnClick = btnSalirClick
    end
    object btnNuevoRecibo: TSpeedButton
      Left = 163
      Top = 4
      Width = 50
      Height = 50
      Caption = 'Nuevo'
      Flat = True
      OnClick = btnNuevoReciboClick
    end
    object btnImprimirRecibo: TSpeedButton
      Left = 57
      Top = 4
      Width = 50
      Height = 50
      Caption = 'Imprimir'
      Flat = True
      OnClick = btnImprimirReciboClick
    end
    object btnCancelarRecibo: TSpeedButton
      Left = 110
      Top = 4
      Width = 50
      Height = 50
      Caption = 'Cancelar'
      Flat = True
      OnClick = btnCancelarReciboClick
    end
    object btnAnularRecibo: TSpeedButton
      Left = 4
      Top = 4
      Width = 50
      Height = 50
      Caption = 'Anular'
      Flat = True
      OnClick = btnAnularReciboClick
    end
  end
  inherited PanelHeader: TPanel
    inherited lInfo: TLabel
      Width = 47
      Caption = 'Recibos'
    end
    inherited lRequeridos: TLabel
      Width = 96
      Caption = 'Registro de Recibos'
    end
  end
  object cxGrid: TcxGrid
    Left = 0
    Top = 56
    Width = 729
    Height = 321
    PopupMenu = PopupMenu
    TabOrder = 2
    object cxGridDBTableView1: TcxGridDBTableView
      DataController.DataSource = dsDatos
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.IncSearch = True
      OptionsData.Editing = False
      OptionsView.GroupByBox = False
      object cxGridDBTableView1NUMERO: TcxGridDBColumn
        DataBinding.FieldName = 'NUMERO'
      end
      object cxGridDBTableView1FECHA: TcxGridDBColumn
        DataBinding.FieldName = 'FECHA'
      end
      object cxGridDBTableView1CLIENTE: TcxGridDBColumn
        DataBinding.FieldName = 'CLIENTE'
      end
      object cxGridDBTableView1IMPORTE: TcxGridDBColumn
        DataBinding.FieldName = 'IMPORTE'
      end
      object cxGridDBTableView1FORMAPAGO: TcxGridDBColumn
        DataBinding.FieldName = 'FORMAPAGO'
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBTableView1
    end
  end
  object dsDatos: TDataSource
    AutoEdit = False
    DataSet = dmRecibos.ibdsRecibos
    Left = 184
    Top = 80
  end
  object PopupMenu: TPopupMenu
    OnPopup = PopupMenuPopup
    Left = 352
    Top = 152
    object Cancelar1: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      OnClick = Cancelar1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Nuevo1: TMenuItem
      Caption = 'Nuevo'
      OnClick = Nuevo1Click
    end
    object Imprimir1: TMenuItem
      Caption = 'Imprimir'
      OnClick = Imprimir1Click
    end
    object Anular1: TMenuItem
      Caption = 'Anular'
      OnClick = Anular1Click
    end
  end
end
