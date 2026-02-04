unit udmPagos;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBDatabase, Provider;

type
  TdmPagos = class(TDataModule)
    dspCheques: TDataSetProvider;
    ibtPagos: TIBTransaction;
    ibdsCheques: TIBDataSet;
    ibdsChequesIDCHEQUE: TIntegerField;
    ibdsChequesFECHA: TDateTimeField;
    ibdsChequesNROCHEQUE: TIntegerField;
    ibdsChequesFECHA_CHEQUE: TDateField;
    ibdsChequesBANCO: TIBStringField;
    ibdsChequesIMPORTE: TIBBCDField;
    ibdsChequesFECHA_COBRO: TDateField;
    ibdsChequesOBSERVACIONES: TIBStringField;
    dspDepositos: TDataSetProvider;
    ibdsDepositos: TIBDataSet;
    ibdsDepositosIDDEPOSITO: TIntegerField;
    ibdsDepositosFECHA: TDateTimeField;
    ibdsDepositosNRODEPOSITO: TIntegerField;
    ibdsDepositosFECHA_DEPOSITO: TDateField;
    ibdsDepositosBANCO: TIBStringField;
    ibdsDepositosIMPORTE: TIBBCDField;
    ibdsDepositosOBSERVACIONES: TIBStringField;
    procedure ibdsChequesNewRecord(DataSet: TDataSet);
    procedure ibdsDepositosNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure abrirCheques();
    procedure abrirDepositos();
    procedure nuevoCheque();
    procedure nuevoDeposito();
    procedure buscarCheque(idCheque: integer);
    procedure buscarDeposito( idDeposito: integer);
    procedure grabarCheque(out idCheque:integer);
    procedure grabarDeposito(out idDeposito:integer);
    procedure cancelarCheque();
    procedure cancelarDeposito();
  end;

var
  dmPagos: TdmPagos;

implementation

uses dmConex;

{$R *.dfm}

{ TdmPagos }

procedure TdmPagos.abrirCheques;
begin
  ibdsCheques.Close;
  ibdsCheques.Open;
end;

procedure TdmPagos.nuevoCheque;
begin
  // nuevo cheque
  ibdsCheques.Insert;
end;

procedure TdmPagos.ibdsChequesNewRecord(DataSet: TDataSet);
begin
  // valores por defecto para un nuevo registro
  ibdsChequesFECHA.AsDateTime:=date;
  ibdsChequesNROCHEQUE.AsInteger:=0;
  ibdsChequesFECHA_CHEQUE.AsDateTime:=date;
  ibdsChequesIMPORTE.AsInteger:=0;
end;

procedure TdmPagos.buscarCheque(idCheque: integer);
begin
  // busco el cheque por el id
  ibdsCheques.Locate('IDCHEQUE',idCheque, [loPartialKey]);
end;

procedure TdmPagos.grabarCheque(out idCheque: integer);
begin
  // grabo los datos del cheque
  ibdsCheques.CheckBrowseMode;
  // devuelvo el id del chque
  idCheque:=ibdsChequesIDCHEQUE.AsInteger;
  try
    ibdsCheques.ApplyUpdates;
    ibtPagos.Commit;
  except
    ibtPagos.Rollback;
  end;
  ibdsCheques.Open;
  ibdsCheques.Last;
end;


procedure TdmPagos.abrirDepositos;
begin
  ibdsDepositos.Close;
  ibdsDepositos.Open;
end;

procedure TdmPagos.buscarDeposito(idDeposito: integer);
begin
  // busco el deposito por el id
  ibdsDepositos.Locate('IDDEPOSITO',idDeposito, [loPartialKey]);
end;

procedure TdmPagos.grabarDeposito(out idDeposito: integer);
begin
  // grabo los datos del deposito
  ibdsDepositos.CheckBrowseMode;
  // devuelvo el id del deposito
  idDeposito:=ibdsDepositosIDDEPOSITO.AsInteger;
  try
    ibdsDepositos.ApplyUpdates;
    ibtPagos.Commit;
  except
    ibtPagos.Rollback;
  end;
  ibdsDepositos.Open;
end;

procedure TdmPagos.nuevoDeposito;
begin
  ibdsDepositos.Insert;
end;

procedure TdmPagos.ibdsDepositosNewRecord(DataSet: TDataSet);
begin
  // valores por defecto para un nuevo registro
  ibdsDepositosFECHA.AsDateTime:=date;
  ibdsDepositosNRODEPOSITO.AsInteger:=0;
  ibdsDepositosFECHA_DEPOSITO.AsDateTime:=date;
  ibdsDepositosIMPORTE.AsFloat:=0;
end;

procedure TdmPagos.cancelarCheque;
begin
  ibdsCheques.Cancel;
end;

procedure TdmPagos.cancelarDeposito;
begin
  ibdsDepositos.Cancel;
end;

end.
