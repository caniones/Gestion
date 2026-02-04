unit udmArticulos;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBDatabase, Provider, IBQuery;

type
  TdmArticulos = class(TDataModule)
    dspArticulos: TDataSetProvider;
    ibtArticulos: TIBTransaction;
    ibdsArticulos: TIBDataSet;
    ibqRubros: TIBQuery;
    ibqRubrosIDRUBRO: TIntegerField;
    ibqRubrosDESCRIPCION: TIBStringField;
    ibdsArticulosIDARTICULO: TIntegerField;
    ibdsArticulosCODIGO_INTERNO: TIBStringField;
    ibdsArticulosIDLINEA: TIntegerField;
    ibdsArticulosIDRUBRO: TIntegerField;
    ibdsArticulosIDPROVEEDOR: TIntegerField;
    ibdsArticulosFECHA_BAJA: TDateField;
    ibdsArticulosFECHA_ACTPRECIO: TDateField;
    ibdsArticulosCOSTO_UNITARIO: TIBBCDField;
    ibdsArticulosUTILIDAD: TIBBCDField;
    ibdsArticulosIVA: TIBBCDField;
    ibqLineas: TIBQuery;
    ibqProveedores: TIBQuery;
    ibdsArticulosFECHA_COMPRA: TDateField;
    ibqValidarCodigoInterno: TIBQuery;
    ibqValidarCodigoInternoCOUNT: TIntegerField;
    ibdsArticulosPRECIO_SIN_IVA: TFloatField;
    ibdsArticulosPORCENTAJE_IVA: TFloatField;
    ibdsArticulosPRECIO_FINAL: TFloatField;
    ibdsArticulosCONTROL_STOCK: TIntegerField;
    ibqDuplicados: TIBQuery;
    ibqDuplicadosCODIGO_INTERNO: TIBStringField;
    ibqDuplicadosIDLINEA: TIntegerField;
    ibqDuplicadosIDRUBRO: TIntegerField;
    ibqDuplicadosIDPROVEEDOR: TIntegerField;
    ibqDuplicadosFECHA_COMPRA: TDateField;
    ibqDuplicadosCOSTO_UNITARIO: TIBBCDField;
    ibqDuplicadosUTILIDAD: TIBBCDField;
    ibqDuplicadosIVA: TIBBCDField;
    ibqDuplicadosCONTROL_STOCK: TIntegerField;
    ibdsArticulosIDTITULO: TIntegerField;
    ibqTitulos: TIBQuery;
    ibqTitulosIDTITULO: TIntegerField;
    ibqTitulosDESCRIPCION: TIBStringField;
    ibqProveedoresIDPROVEEDOR: TIntegerField;
    ibqProveedoresNOMBRE_FANTASIA: TIBStringField;
    ibqLineasIDLINEA: TIntegerField;
    ibqLineasDESCRIPCION: TIBStringField;
    ibdsArticulosPRECIO_PUBLICO: TIBBCDField;
    ibqDuplicadosIDTITULO: TIntegerField;
    ibqDuplicadosPRECIO_PUBLICO: TIBBCDField;
    ibqFechas: TIBQuery;
    ibqFechasFECHA_ACTPRECIO: TDateField;
    ibdsArticulosLINEA: TIBStringField;
    ibdsArticulosRUBRO: TIBStringField;
    ibdsArticulosPROVEEDOR: TIBStringField;
    ibdsArticulosDESCRIPCION: TIBStringField;
    ibdsArticulosSTOCK: TIBBCDField;
    ibdsArticulosPUNTO_REPOSICION: TIBBCDField;
    ibqDuplicadosDESCRIPCION: TIBStringField;
    ibqDuplicadosSTOCK: TIBBCDField;
    ibqDuplicadosPUNTO_REPOSICION: TIBBCDField;
    ibqMonedas: TIBQuery;
    ibqMonedasIDMONEDA: TIntegerField;
    ibqMonedasCOTIZACION: TIBBCDField;
    ibqMonedasSIGNO: TIBStringField;
    ibdsArticulosIDMONEDA: TIntegerField;
    ibdsArticulosPRECIO_COSTO: TFloatField;
    ibqMonedasMONEDA: TIBStringField;
    ibqDuplicadosIDMONEDA: TIntegerField;
    ibdsArticulosMONEDA: TIBStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure ibdsArticulosCalcFields(DataSet: TDataSet);
    procedure ibdsArticulosNewRecord(DataSet: TDataSet);
    procedure ibdsArticulosCOSTO_UNITARIOChange(Sender: TField);
    procedure ibdsArticulosUTILIDADChange(Sender: TField);
    procedure ibdsArticulosIVAChange(Sender: TField);
    procedure ibdsArticulosPRECIO_PUBLICOChange(Sender: TField);
  private
    FactulizarFecha: boolean;
    procedure SetactulizarFecha(const Value: boolean);
  private
    { Private declarations }
    property actulizarFecha:boolean read FactulizarFecha write SetactulizarFecha;
    procedure refrescar();
  public
    { Public declarations }
    function validarCodigoInterno():boolean;
    procedure grabar();
    procedure duplicarArticulo();
  end;

var
  dmArticulos: TdmArticulos;

implementation

uses dmConex;

{$R *.dfm}

procedure TdmArticulos.DataModuleCreate(Sender: TObject);
begin
  ibdsArticulos.Close;
  ibdsArticulos.Open;
  ibdsArticulos.Last;
  ibdsArticulos.First;
  ibqRubros.Close;
  ibqRubros.Open;
  ibqRubros.Last;
  ibqLineas.Close;
  ibqLineas.Open;
  ibqLineas.Last;
  ibqProveedores.Close;
  ibqProveedores.Open;
  ibqProveedores.Last;
  ibqTitulos.Close;
  ibqTitulos.Open;
  ibqTitulos.Last;
  ibqFechas.Close;
  ibqFechas.Open;
  ibqFechas.Last;
  ibqMonedas.Close;
  ibqMonedas.Open;
  ibqMonedas.Last;
  ibqMonedas.First;
end;

procedure TdmArticulos.grabar;
var
  Marca:TBookmarkStr;
begin
  if (ibdsArticulos.State = dsEdit) or (ibdsArticulos.State = dsInsert) then
    begin
    //hago algunas validaciones
    if (ibdsArticulosSTOCK.AsString = '') or (ibdsArticulosSTOCK.AsFloat<0) then
      ibdsArticulosSTOCK.AsFloat:=0;
    if (ibdsArticulosPUNTO_REPOSICION.AsString = '') or
       (ibdsArticulosPUNTO_REPOSICION.AsFloat<0) then
      ibdsArticulosPUNTO_REPOSICION.AsFloat:=0;
    if ibdsArticulosCOSTO_UNITARIO.AsString = '' then
      ibdsArticulosCOSTO_UNITARIO.AsFloat:=0;
    if ibdsArticulosUTILIDAD.AsString = '' then
      ibdsArticulosUTILIDAD.AsFloat:=0;
    if ibdsArticulosIVA.AsString = '' then
      ibdsArticulosIVA.AsFloat:=0;
    if (ibdsArticulosPRECIO_PUBLICO.AsString = '') or
      (ibdsArticulosPRECIO_PUBLICO.AsFloat = 0) then
      ibdsArticulosPRECIO_PUBLICO.AsFloat:=ibdsArticulosPRECIO_FINAL.AsFloat;
    // fin de las validaciones
    end;
  if self.actulizarFecha then
    ibdsArticulosFECHA_ACTPRECIO.AsDateTime:=date;
  Marca:=ibdsArticulos.Bookmark;
  ibdsArticulos.CheckBrowseMode;
  try
    ibdsArticulos.ApplyUpdates;
    ibtArticulos.Commit;
  except
    ibtArticulos.Rollback;
  end;
  ibdsArticulos.Open;
  ibdsArticulos.Bookmark:=Marca;
  self.refrescar;
end;

procedure TdmArticulos.refrescar;
begin
  ibqRubros.Close;
  ibqRubros.Open;
  ibqRubros.Last;
  ibqLineas.Close;
  ibqLineas.Open;
  ibqLineas.Last;
  ibqProveedores.Close;
  ibqProveedores.Open;
  ibqProveedores.Last;
  ibqTitulos.Close;
  ibqTitulos.Open;
  ibqTitulos.Last;
  ibqFechas.Close;
  ibqFechas.Open;
  ibqFechas.Last;
end;

function TdmArticulos.validarCodigoInterno: boolean;
begin
  // si no ingresan CODIGO_INTERNO le asigno el IDARTICULO
  if ibdsArticulosCODIGO_INTERNO.AsString = '' then
     ibdsArticulosCODIGO_INTERNO.AsString:='SC-'+ibdsArticulosIDARTICULO.AsString;
  // valido el código interno del artículo no se repita
  // DEVUELVE FALSO SI ESTA TODO CORRECTO
  with ibqValidarCodigoInterno do
    begin
    close;
    ParamByName('CODIGO_INTERNO').AsString:=ibdsArticulosCODIGO_INTERNO.AsString;
    ParamByName('ID').AsString:=ibdsArticulosIDARTICULO.AsString;
    open;
    end;
    if ibqValidarCodigoInterno.Fields[0].AsInteger >= 1 then
      result:=True
    else
      result:=False;
end;

procedure TdmArticulos.ibdsArticulosCalcFields(DataSet: TDataSet);
begin
  // CALCULO EL PRECIO DE COSTO
  ibdsArticulosPRECIO_COSTO.AsFloat:=ibdsArticulosCOSTO_UNITARIO.AsFloat*
    ibqMonedasCOTIZACION.AsFloat;
  // CALCULO EL PRECIO SIN IVA
  ibdsArticulosPRECIO_SIN_IVA.AsFloat:=(1+(ibdsArticulosUTILIDAD.AsFloat/100))*
    ibdsArticulosPRECIO_COSTO.AsFloat;
  // CALCULO EL % DEL IVA
  ibdsArticulosPORCENTAJE_IVA.AsFloat:=ibdsArticulosPRECIO_SIN_IVA.AsFloat*
  (ibdsArticulosIVA.AsFloat/100);
  // CALCULO EL PRECIO FINAL
  ibdsArticulosPRECIO_FINAL.AsFloat:=ibdsArticulosPRECIO_SIN_IVA.AsFloat+
  ibdsArticulosPORCENTAJE_IVA.AsFloat;
end;

procedure TdmArticulos.ibdsArticulosNewRecord(DataSet: TDataSet);
begin
  // valores por defecto para un nuevo registro
  ibdsArticulosSTOCK.AsFloat:=0;
  ibdsArticulosPUNTO_REPOSICION.AsFloat:=0;
  ibdsArticulosFECHA_ACTPRECIO.AsDateTime:=Date;
  ibdsArticulosFECHA_COMPRA.AsDateTime:=Date;
  ibdsArticulosCOSTO_UNITARIO.AsFloat:=0;
  ibdsArticulosIDMONEDA.AsInteger:=100; // pesos
  ibdsArticulosUTILIDAD.AsFloat:=0;
  ibdsArticulosIVA.AsFloat:=0;
  ibdsArticulosCONTROL_STOCK.AsInteger:=0;
  ibdsArticulosPRECIO_PUBLICO.AsFloat:=0;
end;

procedure TdmArticulos.duplicarArticulo;
begin
  // me crea un articulo nuevo con los datos del articulo seleccionado en el ibds
  ibqDuplicados.Close;
  ibqDuplicados.ParamByName('IDARTICULO').AsInteger:=
  ibdsArticulosIDARTICULO.AsInteger;
  ibqDuplicados.Open;
  ibdsArticulos.Insert;
  ibdsArticulosDESCRIPCION.AsString:=ibqDuplicadosDESCRIPCION.AsString;
  ibdsArticulosSTOCK.AsFloat:=ibqDuplicadosSTOCK.AsFloat;
  ibdsArticulosPUNTO_REPOSICION.AsFloat:=ibqDuplicadosPUNTO_REPOSICION.AsFloat;
  ibdsArticulosIDLINEA.AsInteger:=ibqDuplicadosIDLINEA.AsInteger;
  ibdsArticulosIDRUBRO.AsInteger:=ibqDuplicadosIDRUBRO.AsInteger;
  ibdsArticulosIDPROVEEDOR.AsInteger:=ibqDuplicadosIDPROVEEDOR.AsInteger;
  ibdsArticulosFECHA_COMPRA.AsDateTime:=ibqDuplicadosFECHA_COMPRA.AsDateTime;
  ibdsArticulosCOSTO_UNITARIO.AsFloat:=ibqDuplicadosCOSTO_UNITARIO.AsFloat;
  ibdsArticulosIDMONEDA.AsInteger:=ibqDuplicadosIDMONEDA.AsInteger;
  ibdsArticulosUTILIDAD.AsFloat:=ibqDuplicadosUTILIDAD.AsFloat;
  ibdsArticulosIVA.AsFloat:=ibqDuplicadosIVA.AsFloat;
  ibdsArticulosCONTROL_STOCK.AsInteger:=ibqDuplicadosCONTROL_STOCK.AsInteger;
  ibdsArticulosIDTITULO.AsInteger:=ibqDuplicadosIDTITULO.AsInteger;
  ibdsArticulosPRECIO_PUBLICO.AsFloat:=ibqDuplicadosPRECIO_PUBLICO.AsInteger;
end;

//  --- Actulización de la fecha de cambio de precios

procedure TdmArticulos.SetactulizarFecha(const Value: boolean);
begin
  FactulizarFecha := Value;
end;

procedure TdmArticulos.ibdsArticulosCOSTO_UNITARIOChange(Sender: TField);
begin
  self.actulizarFecha:=true;
end;

procedure TdmArticulos.ibdsArticulosUTILIDADChange(Sender: TField);
begin
  self.actulizarFecha:=true;
end;

procedure TdmArticulos.ibdsArticulosIVAChange(Sender: TField);
begin
  self.actulizarFecha:=true;
end;

procedure TdmArticulos.ibdsArticulosPRECIO_PUBLICOChange(Sender: TField);
begin
  self.actulizarFecha:=true;
end;

//-----------------------------------------------------------------------

end.
