inherited frmImputTitulo: TfrmImputTitulo
  Caption = 'T'#237'tulo'
  ClientWidth = 442
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 24
    Top = 88
    Width = 132
    Height = 13
    Caption = 'Escriba el nombre del T'#237'tulo'
  end
  inherited PanelButton: TPanel
    inherited btnAceptar: TSpeedButton
      Left = 174
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
    Width = 369
    inherited lInfo: TLabel
      Width = 35
      Caption = 'T'#237'tulo'
    end
    inherited lRequeridos: TLabel
      Width = 152
      Caption = 'El nombre del t'#237'tulo es requerido'
    end
  end
  object dbeTitulo: TDBEdit
    Left = 24
    Top = 112
    Width = 257
    Height = 21
    DataField = 'DESCRIPCION'
    DataSource = dsTitulos
    TabOrder = 2
  end
  object dsTitulos: TDataSource
    DataSet = dmTitulos.ibdsTitulos
    Left = 184
    Top = 104
  end
end
