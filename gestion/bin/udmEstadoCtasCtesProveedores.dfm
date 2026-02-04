object dmEstadoCtasCtesProveedores: TdmEstadoCtasCtesProveedores
  OldCreateOrder = False
  Left = 345
  Top = 211
  Height = 244
  Width = 970
  object ibtCtaCteProveedores: TIBTransaction
    Active = True
    DefaultDatabase = dmConexion.IBDatabase
    AutoStopAction = saNone
    Left = 48
    Top = 8
  end
  object ibqProveedores: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = ibtCtaCteProveedores
    AfterOpen = ibqProveedoresAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT r.IDPROVEEDOR, r.CUIT, r.NOMBRE_FANTASIA, r.NOMBRE_REAL, ' +
        'r.FECHA_BAJA'
      'FROM PROVEEDORES r'
      'ORDER BY R.NOMBRE_FANTASIA')
    Left = 48
    Top = 56
    object ibqProveedoresIDPROVEEDOR: TIntegerField
      FieldName = 'IDPROVEEDOR'
      Origin = 'PROVEEDORES.IDPROVEEDOR'
      Required = True
    end
    object ibqProveedoresCUIT: TIBStringField
      FieldName = 'CUIT'
      Origin = 'PROVEEDORES.CUIT'
      Required = True
      Size = 11
    end
    object ibqProveedoresNOMBRE_FANTASIA: TIBStringField
      DisplayLabel = 'NOMBRE DE FANTASIA'
      FieldName = 'NOMBRE_FANTASIA'
      Origin = 'PROVEEDORES.NOMBRE_FANTASIA'
      Required = True
      Size = 50
    end
    object ibqProveedoresNOMBRE_REAL: TIBStringField
      DisplayLabel = 'NOMBRE REAL'
      FieldName = 'NOMBRE_REAL'
      Origin = 'PROVEEDORES.NOMBRE_REAL'
      Required = True
      Size = 50
    end
    object ibqProveedoresFECHA_BAJA: TDateField
      DisplayLabel = 'FECHA DE BAJA'
      FieldName = 'FECHA_BAJA'
      Origin = 'PROVEEDORES.FECHA_BAJA'
    end
  end
  object dsProveedores: TDataSource
    AutoEdit = False
    DataSet = ibqProveedores
    Left = 48
    Top = 104
  end
  object ibdsComprobantes: TIBDataSet
    Database = dmConexion.IBDatabase
    Transaction = ibtCtaCteProveedores
    BufferChunks = 1000
    CachedUpdates = False
    InsertSQL.Strings = (
      
        'INSERT INTO COMPROBANTES_PROVEEDORES (ID_NROCOMPROBANTE, IDTIPOC' +
        'OMPROBANTE, NROSUCURSAL, NROCOMPROBANTE, FECHA, IDPROVEEDOR, IMP' +
        'ORTE, CANTIDAD_UNIDADES, ANULADO)'
      ' VALUES ('
      ':ID_NROCOMPROBANTE, '
      ':IDTIPOCOMPROBANTE, '
      ':NROSUCURSAL, '
      ':NROCOMPROBANTE, '
      ':FECHA, '
      ':IDPROVEEDOR, '
      ':IMPORTE, '
      ':CANTIDAD_UNIDADES, '
      '0'
      ')')
    SelectSQL.Strings = (
      
        'SELECT a.ID_NROCOMPROBANTE, a.IDTIPOCOMPROBANTE, a.NROSUCURSAL, ' +
        'a.NROCOMPROBANTE, a.FECHA, a.IDPROVEEDOR, a.IMPORTE, a.CANTIDAD_' +
        'UNIDADES, a.ANULADO'
      'FROM COMPROBANTES_PROVEEDORES a'
      'ORDER BY a.ID_NROCOMPROBANTE')
    GeneratorField.Field = 'ID_NROCOMPROBANTE'
    GeneratorField.Generator = 'GEN_ID_NROCOMPROBANTE'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 352
    Top = 152
    object ibdsComprobantesID_NROCOMPROBANTE: TIntegerField
      FieldName = 'ID_NROCOMPROBANTE'
      Origin = 'COMPROBANTES_PROVEEDORES.ID_NROCOMPROBANTE'
      Required = True
    end
    object ibdsComprobantesIDTIPOCOMPROBANTE: TIntegerField
      FieldName = 'IDTIPOCOMPROBANTE'
      Origin = 'COMPROBANTES_PROVEEDORES.IDTIPOCOMPROBANTE'
      Required = True
    end
    object ibdsComprobantesNROSUCURSAL: TIntegerField
      FieldName = 'NROSUCURSAL'
      Origin = 'COMPROBANTES_PROVEEDORES.NROSUCURSAL'
      Required = True
    end
    object ibdsComprobantesNROCOMPROBANTE: TIntegerField
      FieldName = 'NROCOMPROBANTE'
      Origin = 'COMPROBANTES_PROVEEDORES.NROCOMPROBANTE'
      Required = True
    end
    object ibdsComprobantesFECHA: TDateField
      FieldName = 'FECHA'
      Origin = 'COMPROBANTES_PROVEEDORES.FECHA'
      Required = True
    end
    object ibdsComprobantesIDPROVEEDOR: TIntegerField
      FieldName = 'IDPROVEEDOR'
      Origin = 'COMPROBANTES_PROVEEDORES.IDPROVEEDOR'
      Required = True
    end
    object ibdsComprobantesIMPORTE: TIBBCDField
      FieldName = 'IMPORTE'
      Origin = 'COMPROBANTES_PROVEEDORES.IMPORTE'
      Required = True
      DisplayFormat = '$#,##0.00'
      EditFormat = '0.##'
      Precision = 18
      Size = 4
    end
    object ibdsComprobantesCANTIDAD_UNIDADES: TIntegerField
      FieldName = 'CANTIDAD_UNIDADES'
      Origin = 'COMPROBANTES_PROVEEDORES.CANTIDAD_UNIDADES'
      Required = True
    end
    object ibdsComprobantesANULADO: TIntegerField
      FieldName = 'ANULADO'
      Origin = 'COMPROBANTES_PROVEEDORES.ANULADO'
      Required = True
    end
  end
  object ibdsPagos: TIBDataSet
    Database = dmConexion.IBDatabase
    Transaction = ibtCtaCteProveedores
    BufferChunks = 1000
    CachedUpdates = False
    InsertSQL.Strings = (
      
        'INSERT INTO PAGOS_PROVEEDORES (IDPAGO_PROVEEDOR, FECHA, IDPROVEE' +
        'DOR, IDPAGO, IDFORMAPAGO, IMPORTE)'
      ' VALUES ('
      ':IDPAGO_PROVEEDOR, '
      ':FECHA, '
      ':IDPROVEEDOR, '
      ':IDPAGO, '
      ':IDFORMAPAGO, '
      ':IMPORTE'
      ')')
    SelectSQL.Strings = (
      
        'SELECT a.IDPAGO_PROVEEDOR, a.FECHA, a.IDPROVEEDOR, a.IDPAGO, a.I' +
        'DFORMAPAGO, a.IMPORTE'
      'FROM PAGOS_PROVEEDORES a'
      'ORDER BY 2')
    GeneratorField.Field = 'IDPAGO_PROVEEDOR'
    GeneratorField.Generator = 'GEN_IDPAGO_PROVEEDOR'
    Left = 240
    Top = 152
    object ibdsPagosIDPAGO_PROVEEDOR: TIntegerField
      FieldName = 'IDPAGO_PROVEEDOR'
      Origin = 'PAGOS_PROVEEDORES.IDPAGO_PROVEEDOR'
      Required = True
    end
    object ibdsPagosFECHA: TDateField
      FieldName = 'FECHA'
      Origin = 'PAGOS_PROVEEDORES.FECHA'
      Required = True
    end
    object ibdsPagosIDPROVEEDOR: TIntegerField
      FieldName = 'IDPROVEEDOR'
      Origin = 'PAGOS_PROVEEDORES.IDPROVEEDOR'
      Required = True
    end
    object ibdsPagosIDPAGO: TIntegerField
      FieldName = 'IDPAGO'
      Origin = 'PAGOS_PROVEEDORES.IDPAGO'
      Required = True
    end
    object ibdsPagosIDFORMAPAGO: TIntegerField
      FieldName = 'IDFORMAPAGO'
      Origin = 'PAGOS_PROVEEDORES.IDFORMAPAGO'
      Required = True
    end
    object ibdsPagosIMPORTE: TIBBCDField
      FieldName = 'IMPORTE'
      Origin = 'PAGOS_PROVEEDORES.IMPORTE'
      Required = True
      DisplayFormat = '$#,##0.00'
      EditFormat = '0.##'
      Precision = 18
      Size = 4
    end
  end
  object ibqTiposComprobantes: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = ibtCtaCteProveedores
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT a.IDTIPOCOMPROBANTE, a.DESCRIPCION, a.LETRA'
      'FROM TIPOS_COMPROBANTES a'
      'ORDER BY a.IDTIPOCOMPROBANTE')
    Left = 240
    Top = 56
    object ibqTiposComprobantesIDTIPOCOMPROBANTE: TIntegerField
      FieldName = 'IDTIPOCOMPROBANTE'
      Origin = 'TIPOS_COMPROBANTES.IDTIPOCOMPROBANTE'
      Required = True
    end
    object ibqTiposComprobantesDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TIPOS_COMPROBANTES.DESCRIPCION'
      Required = True
      Size = 30
    end
    object ibqTiposComprobantesLETRA: TIBStringField
      FieldName = 'LETRA'
      Origin = 'TIPOS_COMPROBANTES.LETRA'
      FixedChar = True
      Size = 1
    end
  end
  object ibspControlCtaCte: TIBStoredProc
    Database = dmConexion.IBDatabase
    Transaction = ibtCtaCteProveedores
    StoredProcName = 'SP_CONTROL_CUENTAS_PROVEEDOR'
    Left = 448
    Top = 152
    ParamData = <
      item
        DataType = ftBCD
        Name = 'PSSALDO'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'PSMENSAJE'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'PEID_NROCOMPROBANTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PEIDPAGO_PROVEEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PEIDPROVEEDOR'
        ParamType = ptInput
      end>
  end
  object ibqEstadoCtasCtes: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = ibtCtaCteProveedores
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsProveedores
    SQL.Strings = (
      
        'SELECT CP.FECHA, CCP.ID_NROCOMPROBANTE, TC.DESCRIPCION, CP.NROSU' +
        'CURSAL||'#39' - '#39'||CP.NROCOMPROBANTE AS NUMERO, CCP.IMPORTE_COMPROBA' +
        'NTE AS IMPORTE, CP.IDTIPOCOMPROBANTE'
      'FROM COMPROBANTES_PROVEEDORES CP'
      
        'INNER JOIN CUENTASCORRIENTES_PROVEEDORES CCP ON CCP.ID_NROCOMPRO' +
        'BANTE = CP.ID_NROCOMPROBANTE'
      
        'INNER JOIN TIPOS_COMPROBANTES TC ON TC.IDTIPOCOMPROBANTE = CP.ID' +
        'TIPOCOMPROBANTE'
      'AND CCP.IDPROVEEDOR = :IDPROVEEDOR'
      ''
      'UNION'
      ''
      
        'SELECT PP.FECHA, CCP.IDPAGO_PROVEEDOR, '#39'PAGO'#39', CCP.IDPAGO_PROVEE' +
        'DOR, CCP.IMPORTE_PAGO, -1'
      'FROM PAGOS_PROVEEDORES PP'
      
        'INNER JOIN CUENTASCORRIENTES_PROVEEDORES CCP ON CCP.IDPAGO_PROVE' +
        'EDOR = PP.IDPAGO_PROVEEDOR'
      'AND CCP.IDPROVEEDOR = :IDPROVEEDOR'
      ''
      'ORDER BY 1 ')
    Left = 48
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPROVEEDOR'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'IDPROVEEDOR'
        ParamType = ptInput
      end>
    object ibqEstadoCtasCtesFECHA: TDateField
      FieldName = 'FECHA'
      Origin = 'COMPROBANTES_PROVEEDORES.FECHA'
      Required = True
    end
    object ibqEstadoCtasCtesID_NROCOMPROBANTE: TIntegerField
      FieldName = 'ID_NROCOMPROBANTE'
      Origin = 'CUENTASCORRIENTES_PROVEEDORES.ID_NROCOMPROBANTE'
    end
    object ibqEstadoCtasCtesDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TIPOS_COMPROBANTES.DESCRIPCION'
      Required = True
      Size = 30
    end
    object ibqEstadoCtasCtesNUMERO: TIBStringField
      FieldName = 'NUMERO'
      Size = 25
    end
    object ibqEstadoCtasCtesIMPORTE: TIBBCDField
      FieldName = 'IMPORTE'
      Origin = 'CUENTASCORRIENTES_PROVEEDORES.IMPORTE_COMPROBANTE'
      DisplayFormat = '$#,##0.00'
      EditFormat = '0.##'
      Precision = 18
      Size = 4
    end
    object ibqEstadoCtasCtesIDTIPOCOMPROBANTE: TIntegerField
      FieldName = 'IDTIPOCOMPROBANTE'
      Origin = 'COMPROBANTES_PROVEEDORES.IDTIPOCOMPROBANTE'
      Required = True
    end
  end
  object ibqComprasXmes: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = ibtCtaCteProveedores
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsProveedores
    SQL.Strings = (
      
        'SELECT p.PSMES AS MES, SUM(p.PSTOTAL) AS TOTAL, SUM(p.PSUNIDADES' +
        ') AS UNIDADES'
      'FROM SP_COMPRAS_MES_PROVEEDOR (:IDPROVEEDOR) p'
      'GROUP BY 1'
      'ORDER BY 1 DESC')
    Left = 552
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPROVEEDOR'
        ParamType = ptInput
        Size = 4
      end>
    object ibqComprasXmesMES: TIBStringField
      FieldName = 'MES'
      Size = 8
    end
    object ibqComprasXmesTOTAL: TIBBCDField
      FieldName = 'TOTAL'
      DisplayFormat = '$#,##0.00'
      EditFormat = '0.##'
      Precision = 18
      Size = 4
    end
    object ibqComprasXmesUNIDADES: TIBBCDField
      FieldName = 'UNIDADES'
      Precision = 18
      Size = 4
    end
  end
  object ibqFormasPagos: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = ibtCtaCteProveedores
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT a.IDFORMAPAGO, a.DESCRIPCION, a.COEFICIENTE'
      'FROM FORMAS_PAGOS a'
      'order by a.IDFORMAPAGO')
    Left = 352
    Top = 56
    object ibqFormasPagosIDFORMAPAGO: TIntegerField
      FieldName = 'IDFORMAPAGO'
      Origin = 'FORMAS_PAGOS.IDFORMAPAGO'
      Required = True
    end
    object ibqFormasPagosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'FORMAS_PAGOS.DESCRIPCION'
      Size = 30
    end
    object ibqFormasPagosCOEFICIENTE: TIBBCDField
      FieldName = 'COEFICIENTE'
      Origin = 'FORMAS_PAGOS.COEFICIENTE'
      Required = True
      Precision = 18
      Size = 4
    end
  end
  object ibqVentasXmes: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = dmConexion.ibTransac
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsProveedores
    SQL.Strings = (
      
        'SELECT p.PSMES AS MES, SUM(p.PSTOTAL) AS TOTAL, SUM(P.PSUNIDADES' +
        ') AS UNIDADES'
      'FROM SP_VENTAS_MES_PROVEEDOR (:IDPROVEEDOR) p'
      'GROUP BY 1'
      'ORDER BY 1 DESC')
    Left = 760
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPROVEEDOR'
        ParamType = ptUnknown
      end>
    object ibqVentasXmesMES: TIBStringField
      FieldName = 'MES'
      Size = 8
    end
    object ibqVentasXmesTOTAL: TIBBCDField
      FieldName = 'TOTAL'
      DisplayFormat = '$#,##0.00'
      EditFormat = '0,##'
      Precision = 18
      Size = 4
    end
    object ibqVentasXmesUNIDADES: TIBBCDField
      FieldName = 'UNIDADES'
      Precision = 18
      Size = 4
    end
  end
  object ibqComprasXtemporada: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = ibtCtaCteProveedores
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsProveedores
    SQL.Strings = (
      'SELECT p.PSANIO, p.PSVERANO, p.PSUNIDADESVERANO, p.PSINVIERNO, '
      '    p.PSUNIDADESINVIERNO, (p.PSINVIERNO+p.PSVERANO) AS TOTAL'
      'FROM SP_COMPRAS_TEMPORADAS_PROVEEDOR(:IDPROVEEDOR) p'
      'ORDER BY 1 DESC')
    Left = 656
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPROVEEDOR'
        ParamType = ptInput
        Size = 4
      end>
    object ibqComprasXtemporadaPSANIO: TIBStringField
      DisplayLabel = 'A'#209'O'
      FieldName = 'PSANIO'
      Origin = 'SP_COMPRAS_TEMPORADAS.PSANIO'
      Size = 4
    end
    object ibqComprasXtemporadaPSVERANO: TIBBCDField
      DisplayLabel = 'VERANO'
      FieldName = 'PSVERANO'
      Origin = 'SP_COMPRAS_TEMPORADAS.PSVERANO'
      DisplayFormat = '$#,##0.00'
      EditFormat = '0.##'
      Precision = 18
      Size = 4
    end
    object ibqComprasXtemporadaPSUNIDADESVERANO: TIBBCDField
      DisplayLabel = 'UNIDADES'
      FieldName = 'PSUNIDADESVERANO'
      Origin = 'SP_COMPRAS_TEMPORADAS_PROVEEDOR.PSUNIDADESVERANO'
      Precision = 18
      Size = 4
    end
    object ibqComprasXtemporadaPSINVIERNO: TIBBCDField
      DisplayLabel = 'INVIERNO'
      FieldName = 'PSINVIERNO'
      Origin = 'SP_COMPRAS_TEMPORADAS.PSINVIERNO'
      DisplayFormat = '$#,##0.00'
      EditFormat = '0.##'
      Precision = 18
      Size = 4
    end
    object ibqComprasXtemporadaPSUNIDADESINVIERNO: TIBBCDField
      DisplayLabel = 'UNIDADES'
      FieldName = 'PSUNIDADESINVIERNO'
      Origin = 'SP_COMPRAS_TEMPORADAS_PROVEEDOR.PSUNIDADESINVIERNO'
      Precision = 18
      Size = 4
    end
    object ibqComprasXtemporadaTOTAL: TIBBCDField
      FieldName = 'TOTAL'
      DisplayFormat = '$#,##0.00'
      EditFormat = '0.##'
      Precision = 18
      Size = 4
    end
  end
  object ibqVentasXtemporada: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = ibtCtaCteProveedores
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsProveedores
    SQL.Strings = (
      
        'SELECT p.PSANIO, p.PSVERANO, P.PSUNIDADESVERANO, p.PSINVIERNO, P' +
        '.PSUNIDADESINVIERNO, (p.PSVERANO+p.PSINVIERNO) AS TOTAL'
      'FROM SP_VENTAS_TEMPORADAS_PROVEEDOR(:IDPROVEEDOR) p'
      'ORDER BY 1 DESC')
    Left = 856
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPROVEEDOR'
        ParamType = ptUnknown
      end>
    object ibqVentasXtemporadaPSANIO: TIBStringField
      DisplayLabel = 'A'#209'O'
      FieldName = 'PSANIO'
      Origin = 'SP_VENTAS_TEMPORADAS.PSANIO'
      Size = 4
    end
    object ibqVentasXtemporadaPSVERANO: TIBBCDField
      DisplayLabel = 'VERANO'
      FieldName = 'PSVERANO'
      Origin = 'SP_VENTAS_TEMPORADAS.PSVERANO'
      DisplayFormat = '$#,##0.00'
      EditFormat = '0.##'
      Precision = 18
      Size = 4
    end
    object ibqVentasXtemporadaPSUNIDADESVERANO: TIBBCDField
      DisplayLabel = 'UNIDADES'
      FieldName = 'PSUNIDADESVERANO'
      Origin = 'SP_VENTAS_TEMPORADAS_PROVEEDOR.PSUNIDADESVERANO'
      Precision = 9
      Size = 4
    end
    object ibqVentasXtemporadaPSINVIERNO: TIBBCDField
      DisplayLabel = 'INVIERNO'
      FieldName = 'PSINVIERNO'
      Origin = 'SP_VENTAS_TEMPORADAS.PSINVIERNO'
      DisplayFormat = '$#,##0.00'
      EditFormat = '0.##'
      Precision = 18
      Size = 4
    end
    object ibqVentasXtemporadaPSUNIDADESINVIERNO: TIBBCDField
      DisplayLabel = 'UNIDADES'
      FieldName = 'PSUNIDADESINVIERNO'
      Origin = 'SP_VENTAS_TEMPORADAS_PROVEEDOR.PSUNIDADESINVIERNO'
      Precision = 9
      Size = 4
    end
    object ibqVentasXtemporadaTOTAL: TIBBCDField
      FieldName = 'TOTAL'
      DisplayFormat = '$#,##0.00'
      EditFormat = '0.##'
      Precision = 18
      Size = 4
    end
  end
  object ibqSaldo: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = dmConexion.ibTransac
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsProveedores
    SQL.Strings = (
      'SELECT r.SALDO'
      'FROM CUENTASCORRIENTES_PROVEEDORES r'
      'WHERE R.IDTRANSACCION = (SELECT MAX(A.IDTRANSACCION)'
      '                         FROM CUENTASCORRIENTES_PROVEEDORES A'
      '                         WHERE A.IDPROVEEDOR = :IDPROVEEDOR)')
    Left = 144
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPROVEEDOR'
        ParamType = ptUnknown
      end>
    object ibqSaldoSALDO: TIBBCDField
      FieldName = 'SALDO'
      Origin = 'CUENTASCORRIENTES_PROVEEDORES.SALDO'
      Required = True
      DisplayFormat = '$#,##0.00'
      EditFormat = '$#,##0.00'
      Precision = 18
      Size = 4
    end
  end
end
