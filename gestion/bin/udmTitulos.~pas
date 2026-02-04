unit udmTitulos;

interface

uses
  SysUtils, Classes, IBQuery, DB, IBCustomDataSet, IBDatabase, Provider;

type
  TdmTitulos = class(TDataModule)
    dspTitulos: TDataSetProvider;
    ibtTitulos: TIBTransaction;
    ibdsTitulos: TIBDataSet;
    ibqValidar: TIBQuery;
    ibdsTitulosIDTITULO: TIntegerField;
    ibdsTitulosDESCRIPCION: TIBStringField;
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
  dmTitulos: TdmTitulos;

implementation

uses dmConex;

{$R *.dfm}

procedure TdmTitulos.DataModuleCreate(Sender: TObject);
begin
  ibdsTitulos.Open;
end;

procedure TdmTitulos.grabar;
var
  Marca:TBookmarkStr;
begin
  Marca:=ibdsTitulos.Bookmark;
  ibdsTitulos.CheckBrowseMode;
  try
    ibdsTitulos.ApplyUpdates;
    ibtTitulos.Commit;
  except
    ibtTitulos.Rollback;
  end;
  ibdsTitulos.Open;
  ibdsTitulos.Bookmark:=Marca;
end;

function TdmTitulos.permisoBaja: boolean;
begin
  // verifica que el titulo no posea articulos
  ibqPermisoBaja.Close;
  ibqPermisoBaja.ParamByName('IDTITULO').AsInteger:=ibdsTitulosIDTITULO.AsInteger;
  ibqPermisoBaja.Open;
  if ibqPermisoBaja.Fields[0].AsInteger >= 1 then
    result:=False
  else
    result:=True;
end;

function TdmTitulos.validar: boolean;
begin
  // valida que no exista un mismo nombre con distinto id, asi no hay duplicado
  ibqValidar.Close;
  ibqValidar.ParamByName('DESCRIPCION').AsString:=ibdsTitulosDESCRIPCION.AsString;
  ibqValidar.ParamByName('IDTITULO').AsInteger:=ibdsTitulosIDTITULO.AsInteger;
  ibqValidar.Open;
  if ibqValidar.Fields[0].AsInteger >= 1 then
    result:=True
  else
    result:=False;
end;

end.
