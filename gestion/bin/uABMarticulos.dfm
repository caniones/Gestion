inherited frmABMarticulos: TfrmABMarticulos
  Left = 377
  Top = 167
  Caption = 'Actualizaci'#243'n de Art'#237'culos'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited btnSalir: TSpeedButton
    Caption = ''
  end
  inherited Panel1: TPanel
    Width = 657
    ParentShowHint = False
    ShowHint = True
    object Label1: TLabel [0]
      Left = 15
      Top = 8
      Width = 138
      Height = 13
      Caption = 'B'#250'squeda por C'#243'digo Interno'
    end
    inherited btnAlta: TSpeedButton
      Left = 497
      Visible = False
      OnClick = btnAltaClick
    end
    inherited btnBaja: TSpeedButton
      Left = 550
      OnClick = btnBajaClick
    end
    inherited btnModi: TSpeedButton
      Left = 603
      OnClick = btnModiClick
    end
    object btnDuplicar: TBitBtn
      Left = 378
      Top = 4
      Width = 50
      Height = 50
      Hint = 'Genera un registro nuevo a partir del seleccionado'
      Caption = 'Duplicar'
      TabOrder = 0
      OnClick = btnDuplicarClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFC2C2C29B9B9B808081858586A3A3A3D4D4D4FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB9B9B97878795252534F4F504A
        4A4B48484949494B4F4F5089898ADBDBDBFF00FFFF00FFFF00FFFF00FFFF00FF
        9494955353555A5A5B5757595050524A4A4C4545474141423D3D3F4646485151
        52ADADADFF00FFFF00FFFF00FFA3A3A35757586A6A6C6767696060625A5A5C54
        54564E4E5049494A444445414142434344525253D3D3D3FF00FFFF00FF535354
        75757878787A7A7A7BC4C4C4C5C5C5A9A9A97D7D7E5353554D4D4F49494A4545
        474A4A4C8A8A8BFF00FFFF00FF62626387878A8383867D7D80808081C9C9C9C7
        C7C7A7A7A77E7E7F58585A5252544D4D4F4A4A4C515153FF00FF8282837B7B7C
        9090938D8D9089898C848487858587D1D1D2CDCDCDACACAC8585865D5D5F5757
        59535354525253AFAFAF71717188888B99999C97979A9494968F8F928A8A8D8A
        8A8DD6D6D7D0D0D0B4B4B49191926262645C5C5E5555569A9A9A7373738D8D8F
        A2A2A4A0A0A29E9EA09A9A9C9595988F8F92C7C7C9F2F2F2D5D5D5BABABA7575
        7665656759595A9D9D9E898989848486A9A9ABA8A8ABA7A7A9A3A3A69F9FA1CD
        CDCEFFFFFFFFFFFFE9E9E98B8B8E7575786E6E7159595AB6B6B6C0C0C0676768
        B0B0B2B0B0B2AEAEB0ABABADD4D4D5FFFFFFFFFFFFF4F4F49F9FA18686897F7F
        81757577535354FF00FFFF00FF777778979799B6B6B8B5B5B7D9D9DAFFFFFFFF
        FFFFF5F5F6ACACAD9797998F8F9288888B656567919192FF00FFFF00FFB7B7B7
        59595AA6A6A8C0C0C2D4D4D5D3D3D4D0D0D1B6B6B8A5A5A79E9EA097979A7777
        79848485FF00FFFF00FFFF00FFFF00FFA3A3A355555689898BBABABCB8B8BAB5
        B5B7AFAFB1AAAAAC9D9D9F6A6A6B848485FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFD5D5D58787885A5A5B6F6F718383847C7C7D666668545455929293FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB6B6B697
        97979D9D9EBFBFC0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Layout = blGlyphTop
      Spacing = 2
    end
    object eBuscarArticulo: TEdit
      Left = 15
      Top = 27
      Width = 249
      Height = 21
      TabOrder = 1
      OnKeyPress = eBuscarArticuloKeyPress
    end
  end
  inherited cxGrid: TcxGrid
    inherited cxGridDBTableView1: TcxGridDBTableView
      DataController.DataSource = nil
      OnCustomDrawCell = cxGridDBTableView1CustomDrawCell
      object cxGridDBTableView1CODIGO_INTERNO: TcxGridDBColumn
        Caption = 'CODIGO INTERNO'
        DataBinding.FieldName = 'CODIGO_INTERNO'
        Width = 300
      end
      object cxGridDBTableView1DESCRIPCION: TcxGridDBColumn
        DataBinding.FieldName = 'DESCRIPCION'
        Width = 300
      end
      object cxGridDBTableView1PRECIO_PUBLICO: TcxGridDBColumn
        DataBinding.FieldName = 'PRECIO_PUBLICO'
        Width = 150
      end
      object cxGridDBTableView1FECHA_ACTPRECIO: TcxGridDBColumn
        Caption = 'FECHA'
        DataBinding.FieldName = 'FECHA_ACTPRECIO'
        Width = 80
      end
      object cxGridDBTableView1MONEDA: TcxGridDBColumn
        DataBinding.FieldName = 'MONEDA'
        Width = 100
      end
      object cxGridDBTableView1LINEA: TcxGridDBColumn
        DataBinding.FieldName = 'LINEA'
        Width = 100
      end
      object cxGridDBTableView1RUBRO: TcxGridDBColumn
        DataBinding.FieldName = 'RUBRO'
        Width = 100
      end
      object cxGridDBTableView1PROVEEDOR: TcxGridDBColumn
        DataBinding.FieldName = 'PROVEEDOR'
        Width = 300
      end
      object cxGridDBTableView1FECHA_BAJA: TcxGridDBColumn
        Caption = 'FECHA BAJA'
        DataBinding.FieldName = 'FECHA_BAJA'
        Width = 150
      end
    end
  end
  object dbgDatos: TDBGrid [3]
    Left = 0
    Top = 64
    Width = 785
    Height = 353
    DataSource = dsDatos
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgDatosDrawColumnCell
    OnDblClick = dbgDatosDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO_INTERNO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO_PUBLICO'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STOCK'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_ACTPRECIO'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_COMPRA'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LINEA'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RUBRO'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROVEEDOR'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_BAJA'
        Width = 64
        Visible = True
      end>
  end
  inherited dsDatos: TDataSource
    DataSet = dmArticulos.ibdsArticulos
  end
end
