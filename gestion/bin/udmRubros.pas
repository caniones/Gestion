
unit udmRubros;

interface

uses
  SysUtils, Classes, DBClient, Provider, DB, IBCustomDataSet, IBQuery,
  DBLocal, DBLocalI, IBDatabase;

type
  TdmRubros = class(TDataModule)
    ibdsRubros: TIBDataSet;
    ibdsRubrosIDRUBRO: TIntegerField;
    ibdsRubrosDESCRIPCION: TIBStringField;
    dspRubros: TDataSetProvider;
    ibtRubros: TIBTransaction;
    ibqValidar: TIBQuery;
    ibqValidarCOUNT: TIntegerField;
    ibqPermisoBaja: TIBQuery;
    ibqPermisoBajaCOUNT: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure grabar();
    function validar():boolean;
    function permisoBaja():boolean;
  end;

var
  dmRubros: TdmRubros;

implementation

uses dmConex;

{$R *.dfm}

procedure TdmRubros.DataModuleCreate(Sender: TObject);
begin
  ibdsRubros.Open;
end;

procedure TdmRubros.grabar;
var
  Marca:TBookmarkStr;
begin
  Marca:=ibdsRubros.Bookmark;
  ibdsRubros.CheckBrowseMode;
  try
    ibdsRubros.ApplyUpdates;
    ibtRubros.Commit;
  except
    ibtRubros.Rollback;
  end;
  ibdsRubros.Open;
  ibdsRubros.Bookmark:=Marca;
end;

function TdmRubros.permisoBaja: boolean;
begin
  // verifica que el rubro no posea articulos
  ibqPermisoBaja.Close;
  ibqPermisoBaja.ParamByName('IDRUBRO').AsInteger:=ibdsRubrosIDRUBRO.AsInteger;
  ibqPermisoBaja.Open;
  if ibqPermisoBaja.Fields[0].AsInteger >= 1 then
    result:=False
  else
    result:=True;
end;

function TdmRubros.validar: boolean;
begin
  // valida que no exista un mismo nombre con distinto id, asi no hay duplicado
  ibqValidar.Close;
  ibqValidar.ParamByName('NOMBRE').AsString:=ibdsRubrosDESCRIPCION.AsString;
  ibqValidar.ParamByName('ID').AsInteger:=ibdsRubrosIDRUBRO.AsInteger;
  ibqValidar.Open;
  if ibqValidar.Fields[0].AsInteger >= 1 then
    result:=True
  else
    result:=False;
end;

end.
