unit udmEstadoCtasCtesClientes;

interface

uses
  SysUtils, Classes, IBDatabase, Provider, IBSQL, DB, IBCustomDataSet,
  IBQuery;

type
  TdmEstadoCtasCtesClientes = class(TDataModule)
    ibtCtasCtesClientes: TIBTransaction;
    ibqClientes: TIBQuery;
    ibqComprobantes: TIBQuery;
    ibqDetalles: TIBQuery;
    dsClientes: TDataSource;
    dsComprobantes: TDataSource;
    ibqClientesIDCLIENTE: TIntegerField;
    ibqClientesNOMBRE: TIBStringField;
    ibqClientesDIRECCION: TIBStringField;
    ibqClientesLOCALIDAD: TIBStringField;
    ibqClientesLIMITE_CREDITO: TIBBCDField;
    ibqComprobantesIDTRANSACCION: TIntegerField;
    ibqComprobantesFECHA: TDateTimeField;
    ibqComprobantesID_NROCOMPROBANTE: TIntegerField;
    ibqComprobantesCOMPROBANTE: TIBStringField;
    ibqComprobantesIMPORTE_COMPROBANTE: TIBBCDField;
    ibqComprobantesRECIBO: TIntegerField;
    ibqComprobantesIMPORTE_RECIBO: TIBBCDField;
    ibqComprobantesSALDO: TIBBCDField;
    ibqDetallesNROCOMPROBANTE: TIntegerField;
    ibqDetallesPRECIO: TIBBCDField;
    ibqDetallesCODIGO_INTERNO: TIBStringField;
    ibqAcumuladosXmes: TIBQuery;
    ibqAcumuladosXmesFECHA: TIBStringField;
    ibqAcumuladosXmesTOTAL: TIBBCDField;
    ibqDetallesDESCRIPCION: TIBStringField;
    ibqDetallesCANTIDAD: TIBBCDField;
    ibqDetallesDESCUENTO: TIBBCDField;
    ibqDetallesSUBTOTAL: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure ibqClientesAfterOpen(DataSet: TDataSet);
    procedure ibqComprobantesAfterOpen(DataSet: TDataSet);
    procedure ibqDetallesCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmEstadoCtasCtesClientes: TdmEstadoCtasCtesClientes;

implementation

uses dmConex;

{$R *.dfm}

procedure TdmEstadoCtasCtesClientes.DataModuleCreate(Sender: TObject);
begin
  ibqClientes.Close;
  ibqClientes.Open;
  ibqClientes.Last;
  ibqClientes.First;
end;

procedure TdmEstadoCtasCtesClientes.ibqClientesAfterOpen(
  DataSet: TDataSet);
begin
  ibqComprobantes.Close;
  ibqComprobantes.Open;
  ibqComprobantes.Last;
  ibqAcumuladosXmes.Close;
  ibqAcumuladosXmes.Open;
  ibqAcumuladosXmes.Last;
end;

procedure TdmEstadoCtasCtesClientes.ibqComprobantesAfterOpen(
  DataSet: TDataSet);
begin
  ibqDetalles.Close;
  ibqDetalles.Open;
end;

procedure TdmEstadoCtasCtesClientes.ibqDetallesCalcFields(
  DataSet: TDataSet);
begin
  ibqDetallesSUBTOTAL.AsFloat:=ibqDetallesPRECIO.AsFloat*
    ibqDetallesCANTIDAD.AsFloat;
  // calculo el descuento
  ibqDetallesSUBTOTAL.AsFloat:=ibqDetallesSUBTOTAL.AsFloat-
    ibqDetallesDESCUENTO.AsFloat;
end;

end.
