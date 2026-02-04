unit udmClientes;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBDatabase, Provider, IBQuery;

type
  TdmClientes = class(TDataModule)
    ibdsClientes: TIBDataSet;
    ibqValidar: TIBQuery;
    ibqSituaciones: TIBQuery;
    ibqLocalidades: TIBQuery;
    ibqValidarCOUNT: TIntegerField;
    ibqSituacionesIDSITUACION: TIntegerField;
    ibqSituacionesDESCRIPCION: TIBStringField;
    ibqLocalidadesIDLOCALIDAD: TIntegerField;
    ibqLocalidadesLOCALIDAD: TIBStringField;
    ibdsClientesIDCLIENTE: TIntegerField;
    ibdsClientesIDSITUACION: TIntegerField;
    ibdsClientesNOMBRE: TIBStringField;
    ibdsClientesDIRECCION: TIBStringField;
    ibdsClientesCODIGO_POSTAL: TIBStringField;
    ibdsClientesIDLOCALIDAD: TIntegerField;
    ibdsClientesTELEFONO_FIJO: TIBStringField;
    ibdsClientesTELEFONO_MOVIL: TIBStringField;
    ibdsClientesTELEFONO_TRABAJO: TIBStringField;
    ibdsClientesNUMERO_FAX: TIBStringField;
    ibdsClientesEMAIL: TIBStringField;
    ibdsClientesLIMITE_CREDITO: TIBBCDField;
    ibdsClientesSALDO_INICIAL: TIBBCDField;
    ibdsClientesFECHA_INGRESO: TDateField;
    ibdsClientesFECHA_BAJA: TDateField;
    dspClientes: TDataSetProvider;
    ibtClientes: TIBTransaction;
    ibdsClientesCUIT: TIBStringField;
    ibqControlCtaCte: TIBQuery;
    dsClientes: TDataSource;
    ibdsClientesINTERES: TIBBCDField;
    ibdsClientesLOCALIDAD: TIBStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure ibdsClientesNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    procedure refrescar();
  public
    { Public declarations }
    procedure grabar();
    function validar():boolean;
  end;

var
  dmClientes: TdmClientes;

implementation

uses dmConex;

{$R *.dfm}

{ TdmClientes }

procedure TdmClientes.DataModuleCreate(Sender: TObject);
begin
  ibdsClientes.Open;
  ibqSituaciones.Close;
  ibqSituaciones.Open;
  ibqSituaciones.Last;
  ibqLocalidades.Close;
  ibqLocalidades.Open;
  ibqLocalidades.Last;
end;

procedure TdmClientes.grabar;
var
  Marca:TBookmarkStr;
begin
  Marca:=ibdsClientes.Bookmark;
  if ibdsClientes.State = dsInsert then
    begin
    ibqControlCtaCte.Close;
    ibqControlCtaCte.Prepare;
    end;
  ibdsClientes.CheckBrowseMode;
  try
    ibdsClientes.ApplyUpdates;
    if ibqControlCtaCte.Prepared then
      ibqControlCtaCte.ExecSQL; // Ingreso el saldo inicial del cliente
                                // en la tabla de Ctas. Ctes.
    ibtClientes.Commit;
  except
    ibtClientes.Rollback;
  end;
  ibdsClientes.Open;
  ibdsClientes.Bookmark:=Marca;
  self.refrescar;
end;

function TdmClientes.validar: boolean;
begin
  // valida que no exista
  ibqValidar.Close;
  ibqValidar.ParamByName('IDCLIENTE').AsInteger:=ibdsClientesIDCLIENTE.AsInteger;
  ibqValidar.ParamByName('NOMBRE').AsString:=ibdsClientesNOMBRE.AsString;
  ibqValidar.Open;
  if ibqValidar.Fields[0].AsInteger >= 1 then
    result:=True
  else
    result:=False;
end;

procedure TdmClientes.ibdsClientesNewRecord(DataSet: TDataSet);
begin
  ibdsClientesIDLOCALIDAD.AsInteger:=2510; // La Paz Entre Ríos
  ibdsClientesLIMITE_CREDITO.AsFloat:=0;
  ibdsClientesSALDO_INICIAL.AsFloat:=0;
  ibdsClientesCUIT.AsString:='0';
  ibdsClientesFECHA_INGRESO.AsDateTime:=Date;
  ibdsClientesINTERES.AsFloat:=0;
end;

procedure TdmClientes.refrescar;
begin
  ibqSituaciones.Close;
  ibqSituaciones.Open;
  ibqSituaciones.Last;
  ibqLocalidades.Close;
  ibqLocalidades.Open;
  ibqLocalidades.Last;
end;

end.
