inherited frmABMlineas: TfrmABMlineas
  Left = 520
  Top = 151
  Caption = 'Actualizaci'#243'n de L'#237'neas'
  ClientHeight = 489
  ClientWidth = 361
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited btnSalir: TSpeedButton
    Left = 304
    Top = 432
  end
  inherited Panel1: TPanel
    inherited btnAlta: TSpeedButton
      OnClick = btnAltaClick
    end
    inherited btnBaja: TSpeedButton
      OnClick = btnBajaClick
    end
    inherited btnModi: TSpeedButton
      OnClick = btnModiClick
    end
  end
  inherited cxGrid: TcxGrid
    inherited cxGridDBTableView1: TcxGridDBTableView
      object cxGridDBTableView1DESCRIPCION: TcxGridDBColumn
        DataBinding.FieldName = 'DESCRIPCION'
      end
    end
  end
  inherited dsDatos: TDataSource
    DataSet = dmLineas.ibdsLineas
  end
end
