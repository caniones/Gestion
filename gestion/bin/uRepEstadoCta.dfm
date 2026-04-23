inherited frmRepDetalleCta: TfrmRepDetalleCta
  Left = 444
  Top = 168
  Caption = 'frmRepDetalleCta'
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
      Size.Values = (
        182.562500000000000000
        1801.812500000000000000)
      inherited QRLabel3: TQRLabel
        Size.Values = (
          44.979166666666670000
          994.833333333333300000
          21.166666666666670000
          378.354166666666700000)
        FontSize = 10
      end
      inherited QRSysData1: TQRSysData
        Size.Values = (
          44.979166666666670000
          1397.000000000000000000
          21.166666666666670000
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
          76.729166666666670000
          259.291666666666700000)
        FontSize = 10
      end
      inherited qrlRenglon3: TQRLabel
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          124.354166666666700000
          232.833333333333300000)
        FontSize = 10
      end
    end
    inherited PageFooterBand2: TQRBand
      Top = 209
      Size.Values = (
        74.083333333333330000
        1801.812500000000000000)
      inherited QRLabel12: TQRLabel
        Size.Values = (
          44.979166666666670000
          1553.104166666667000000
          34.395833333333330000
          132.291666666666700000)
        FontSize = 10
      end
      inherited QRSysData4: TQRSysData
        Size.Values = (
          44.979166666666670000
          1714.500000000000000000
          34.395833333333330000
          121.708333333333300000)
        FontSize = 10
      end
    end
    object QRSubDetail1: TQRSubDetail
      Left = 76
      Top = 185
      Width = 681
      Height = 24
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
        63.500000000000000000
        1801.812500000000000000)
      Master = qrBase
      DataSet = ibqMaster
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText1: TQRDBText
        Left = 8
        Top = 8
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          21.166666666666670000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = ibqMaster
        DataField = 'FECHA'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 184
        Top = 8
        Width = 167
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          486.833333333333300000
          21.166666666666670000
          441.854166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = ibqMaster
        DataField = 'IMPORTE_COMPROBANTE'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText5: TQRDBText
        Left = 440
        Top = 8
        Width = 115
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1164.166666666667000000
          21.166666666666670000
          304.270833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = ibqMaster
        DataField = 'IMPORTE_RECIBO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText6: TQRDBText
        Left = 616
        Top = 8
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1629.833333333333000000
          21.166666666666670000
          119.062500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = ibqMaster
        DataField = 'SALDO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 176
        Top = 8
        Width = 102
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          465.666666666666700000
          21.166666666666670000
          269.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = ibqMaster
        DataField = 'COMPROBANTE'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 408
        Top = 8
        Width = 50
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1079.500000000000000000
          21.166666666666670000
          132.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = ibqMaster
        DataField = 'RECIBO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object ColumnHeaderBand1: TQRBand
      Left = 76
      Top = 145
      Width = 681
      Height = 40
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
        105.833333333333300000
        1801.812500000000000000)
      BandType = rbColumnHeader
      object QRLabel1: TQRLabel
        Left = 616
        Top = 16
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1629.833333333333000000
          42.333333333333330000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'SALDO'
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
      object QRLabel2: TQRLabel
        Left = 496
        Top = 16
        Width = 60
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1312.333333333333000000
          42.333333333333330000
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
      object QRLabel4: TQRLabel
        Left = 392
        Top = 16
        Width = 50
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1037.166666666667000000
          42.333333333333330000
          132.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'RECIBO'
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
        Left = 288
        Top = 16
        Width = 60
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          762.000000000000000000
          42.333333333333330000
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
      object QRLabel6: TQRLabel
        Left = 160
        Top = 16
        Width = 102
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          423.333333333333300000
          42.333333333333330000
          269.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'COMPROBANTE'
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
        Left = 8
        Top = 16
        Width = 44
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          42.333333333333330000
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
    end
  end
  object ibqMaster: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = dmConexion.ibTransac
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT IDTRANSACCION, FECHA, CC.ID_NROCOMPROBANTE, (SELECT C.NRO' +
        'SUCURSAL||'#39' - '#39'||C.NROCOMPROBANTE FROM COMPROBANTES C WHERE C.ID' +
        '_NROCOMPROBANTE = CC.ID_NROCOMPROBANTE AND C.IDCLIENTE = CC.IDCL' +
        'IENTE) AS COMPROBANTE, IMPORTE_COMPROBANTE, (SELECT R.NUMERO FRO' +
        'M RECIBOS R WHERE R.IDRECIBO = CC.IDRECIBO AND R.IDCLIENTE = CC.' +
        'IDCLIENTE) AS RECIBO, IMPORTE_RECIBO, SALDO'
      'FROM CUENTASCORRIENTES_CLIENTES CC'
      'WHERE CC.IDCLIENTE = :IDCLIENTE'
      'ORDER BY CC.IDTRANSACCION')
    Left = 48
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDCLIENTE'
        ParamType = ptUnknown
      end>
    object ibqMasterIDTRANSACCION: TIntegerField
      FieldName = 'IDTRANSACCION'
      Origin = 'CUENTASCORRIENTES_CLIENTES.IDTRANSACCION'
      Required = True
    end
    object ibqMasterFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'CUENTASCORRIENTES_CLIENTES.FECHA'
      Required = True
    end
    object ibqMasterID_NROCOMPROBANTE: TIntegerField
      FieldName = 'ID_NROCOMPROBANTE'
      Origin = 'CUENTASCORRIENTES_CLIENTES.ID_NROCOMPROBANTE'
    end
    object ibqMasterCOMPROBANTE: TIBStringField
      FieldName = 'COMPROBANTE'
      Size = 25
    end
    object ibqMasterIMPORTE_COMPROBANTE: TIBBCDField
      FieldName = 'IMPORTE_COMPROBANTE'
      Origin = 'CUENTASCORRIENTES_CLIENTES.IMPORTE_COMPROBANTE'
      DisplayFormat = '$,0.##'
      Precision = 18
      Size = 4
    end
    object ibqMasterRECIBO: TIntegerField
      FieldName = 'RECIBO'
      Origin = 'RECIBOS.NUMERO'
    end
    object ibqMasterIMPORTE_RECIBO: TIBBCDField
      FieldName = 'IMPORTE_RECIBO'
      Origin = 'CUENTASCORRIENTES_CLIENTES.IMPORTE_RECIBO'
      DisplayFormat = '$,0.##'
      Precision = 18
      Size = 4
    end
    object ibqMasterSALDO: TIBBCDField
      FieldName = 'SALDO'
      Origin = 'CUENTASCORRIENTES_CLIENTES.SALDO'
      Required = True
      DisplayFormat = '$,0.##'
      Precision = 18
      Size = 4
    end
  end
end
