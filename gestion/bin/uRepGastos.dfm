inherited frmRepGastos: TfrmRepGastos
  Left = 491
  Top = 162
  Caption = 'frmRepGastos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited qrBase: TQuickRep
    DataSet = ibqMaster
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      200.000000000000000000
      2100.000000000000000000
      200.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    inherited PageHeaderBand1: TQRBand
      Height = 105
      Size.Values = (
        277.812500000000000000
        1801.812500000000000000)
      inherited QRLabel3: TQRLabel
        Top = 40
        Size.Values = (
          44.979166666666670000
          994.833333333333400000
          105.833333333333300000
          378.354166666666700000)
        FontSize = 10
      end
      inherited QRSysData1: TQRSysData
        Top = 40
        Size.Values = (
          44.979166666666670000
          1397.000000000000000000
          105.833333333333300000
          179.916666666666700000)
        FontSize = 10
      end
      inherited qrlRenglon1: TQRLabel
        Size.Values = (
          79.375000000000000000
          21.166666666666670000
          2.645833333333333000
          455.083333333333300000)
        FontSize = 18
      end
      inherited qrlRenglon2: TQRLabel
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          76.729166666666680000
          259.291666666666700000)
        FontSize = 10
      end
      inherited qrlRenglon3: TQRLabel
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          124.354166666666700000
          232.833333333333400000)
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 433
        Top = 60
        Width = 87
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1145.645833333333000000
          158.750000000000000000
          230.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Desde la fecha'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel10: TQRLabel
        Left = 435
        Top = 80
        Width = 84
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1150.937500000000000000
          211.666666666666700000
          222.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Hasta la fecha'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlDesde: TQRLabel
        Left = 528
        Top = 60
        Width = 52
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1397.000000000000000000
          158.750000000000000000
          137.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlDesde'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlHasta: TQRLabel
        Left = 528
        Top = 80
        Width = 49
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1397.000000000000000000
          211.666666666666700000
          129.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlHasta'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel11: TQRLabel
        Left = 252
        Top = 1
        Width = 178
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.208333333333340000
          666.750000000000000000
          2.645833333333333000
          470.958333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'REPORTE DE GASTOS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
    end
    inherited PageFooterBand2: TQRBand
      Top = 276
      Size.Values = (
        74.083333333333340000
        1801.812500000000000000)
      inherited QRLabel12: TQRLabel
        Size.Values = (
          44.979166666666670000
          1553.104166666667000000
          34.395833333333340000
          132.291666666666700000)
        FontSize = 10
      end
      inherited QRSysData4: TQRSysData
        Size.Values = (
          44.979166666666670000
          1714.500000000000000000
          34.395833333333340000
          121.708333333333300000)
        FontSize = 10
      end
    end
    object SummaryBand1: TQRBand
      Left = 76
      Top = 228
      Width = 681
      Height = 48
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        127.000000000000000000
        1801.812500000000000000)
      BandType = rbSummary
      object QRExpr1: TQRExpr
        Left = 513
        Top = 13
        Width = 157
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1357.312500000000000000
          34.395833333333340000
          415.395833333333400000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Master = qrBase
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'SUM(ibqMaster.IMPORTE)'
        Mask = '$,0.##'
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 560
        Top = 13
        Width = 44
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1481.666666666667000000
          34.395833333333340000
          116.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TOTAL'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object ColumnHeaderBand1: TQRBand
      Left = 76
      Top = 181
      Width = 681
      Height = 27
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        71.437500000000000000
        1801.812500000000000000)
      BandType = rbColumnHeader
      object QRLabel4: TQRLabel
        Left = 7
        Top = 7
        Width = 44
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          18.520833333333330000
          18.520833333333330000
          116.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'FECHA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 80
        Top = 7
        Width = 59
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          211.666666666666700000
          18.520833333333330000
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DETALLE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 427
        Top = 7
        Width = 102
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1129.770833333333000000
          18.520833333333330000
          269.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'FORM DE PAGO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 613
        Top = 7
        Width = 60
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1621.895833333333000000
          18.520833333333330000
          158.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'IMPORTE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object DetailBand1: TQRBand
      Left = 76
      Top = 208
      Width = 681
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666660000
        1801.812500000000000000)
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 7
        Top = 7
        Width = 35
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          18.520833333333330000
          18.520833333333330000
          92.604166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = ibqMaster
        DataField = 'FECHA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 80
        Top = 7
        Width = 67
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          211.666666666666700000
          18.520833333333330000
          177.270833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = ibqMaster
        DataField = 'DESCRIPCION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 433
        Top = 7
        Width = 74
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1145.645833333333000000
          18.520833333333330000
          195.791666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = ibqMaster
        DataField = 'FORMA_PAGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 622
        Top = 7
        Width = 44
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1645.708333333333000000
          18.520833333333330000
          116.416666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = ibqMaster
        DataField = 'IMPORTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
  end
  object ibqMaster: TIBQuery [1]
    Database = dmConexion.IBDatabase
    Transaction = dmConexion.ibTransac
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT G.FECHA, G.DESCRIPCION, G.IMPORTE, FP.DESCRIPCION AS FORM' +
        'A_PAGO'
      'FROM GASTOS G, FORMAS_PAGOS FP'
      'WHERE G.IDFORMAPAGO = FP.IDFORMAPAGO'
      'AND G.FECHA >= :DESDE'
      'AND G.FECHA <= :HASTA')
    Left = 8
    Top = 128
    ParamData = <
      item
        DataType = ftDate
        Name = 'DESDE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'HASTA'
        ParamType = ptInput
      end>
    object ibqMasterFECHA: TDateField
      FieldName = 'FECHA'
      Origin = 'GASTOS.FECHA'
      Required = True
    end
    object ibqMasterDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'GASTOS.DESCRIPCION'
      Required = True
      Size = 50
    end
    object ibqMasterFORMA_PAGO: TIBStringField
      FieldName = 'FORMA_PAGO'
      Origin = 'FORMAS_PAGOS.DESCRIPCION'
      Size = 30
    end
    object ibqMasterIMPORTE: TIBBCDField
      FieldName = 'IMPORTE'
      Origin = 'GASTOS.IMPORTE'
      Required = True
      DisplayFormat = '$,0.##'
      EditFormat = '0.##'
      Precision = 18
      Size = 4
    end
  end
end
