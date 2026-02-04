unit udmComprobantesAdmin;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IBQuery, IBStoredProc,
  Forms, Dialogs;

type
  TdmComprobantesAdmin = class(TDataModule)
    ibtComprobantes: TIBTransaction;
    ibqComprobantes: TIBQuery;
    ibqItems: TIBQuery;
    dsComprobantes: TDataSource;
    ibqClientes: TIBQuery;
    ibqItemsIDITEM: TIntegerField;
    ibqItemsID_NROCOMPROBANTE: TIntegerField;
    ibqItemsIDARTICULO: TIntegerField;
    ibqItemsPRECIO: TIBBCDField;
    ibqItemsIVA: TIBBCDField;
    ibqItemsDESCUENTO: TIBBCDField;
    ibqClientesIDCLIENTE: TIntegerField;
    ibqClientesNOMBRE: TIBStringField;
    ibqClientesCUIT: TIBStringField;
    ibqClientesNOMBRE_CORTO: TIBStringField;
    ibqClientesDIRECCION: TIBStringField;
    ibspAnularComprobante: TIBStoredProc;
    ibqDetalle: TIBQuery;
    ibqItemsDESCRIPCION: TIBStringField;
    ibqItemsCANTIDAD: TIBBCDField;
    ibqDetalleSUBTOTAL: TFloatField;
    ibqDetalleDESCUENTO: TIBBCDField;
    ibqDetalleTOTAL: TFloatField;
    ibqDetalleTOTAL_FINANCIADO: TFloatField;
    ibqComprobantesID_NROCOMPROBANTE: TIntegerField;
    ibqComprobantesTIPO: TIBStringField;
    ibqComprobantesNROSUCURSAL: TIntegerField;
    ibqComprobantesNROCOMPROBANTE: TIntegerField;
    ibqComprobantesFECHA: TDateTimeField;
    ibqComprobantesIDCLIENTE: TIntegerField;
    ibqComprobantesCLIENTE: TIBStringField;
    ibqComprobantesFORMA_PAGO: TIBStringField;
    ibqComprobantesANULADO: TIntegerField;
    ibqItemsSUBTOTAL: TFloatField;
    ibqItemsCODIGO_INTERNO: TIBStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dsComprobantesDataChange(Sender: TObject; Field: TField);
    procedure ibqItemsCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure anularComprobante();
    procedure refrescar();
  end;

var
  dmComprobantesAdmin: TdmComprobantesAdmin;

implementation

uses dmConex;

{$R *.dfm}

procedure TdmComprobantesAdmin.anularComprobante;
var
  MarcaComprobante:TBookmarkStr;
begin
  // anulo el comprobante y devuelvo al stock los art. del detalle.
  MarcaComprobante:=ibqComprobantes.Bookmark;
  ibspAnularComprobante.Close;
  ibspAnularComprobante.ParamByName('peID').AsInteger:=
    ibqComprobantesID_NROCOMPROBANTE.AsInteger;
  ibspAnularComprobante.Prepare;
  ibqClientesIDCLIENTE.AsInteger;
  try
    ibspAnularComprobante.ExecProc;
    ibtComprobantes.Commit;
  except
    ibtComprobantes.Rollback;
  end;
  ibqComprobantes.Open;
  ibqComprobantes.Bookmark:=MarcaComprobante;
  self.refrescar;
end;

procedure TdmComprobantesAdmin.DataModuleCreate(Sender: TObject);
begin
  ibqComprobantes.Close;
  ibqComprobantes.Open;
end;

procedure TdmComprobantesAdmin.refrescar;
begin
  ibqItems.Close;
  ibqItems.Open;
  ibqClientes.Close;
  ibqClientes.Open;
  ibqDetalle.Close;
  ibqDetalle.Open;
end;

procedure TdmComprobantesAdmin.dsComprobantesDataChange(Sender: TObject;
  Field: TField);
begin
  self.refrescar;
end;

procedure TdmComprobantesAdmin.ibqItemsCalcFields(DataSet: TDataSet);
begin
  ibqItemsSUBTOTAL.AsFloat:=ibqItemsPRECIO.AsFloat*ibqItemsCANTIDAD.AsFloat;
  // calculo el descuento
  ibqItemsSUBTOTAL.AsFloat:=ibqItemsSUBTOTAL.AsFloat-ibqItemsDESCUENTO.AsFloat;
end;

end.
