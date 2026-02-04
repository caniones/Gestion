unit udmBuscarArtVenta;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery;

type
  TdmBuscarArtVenta = class(TDataModule)
    ibqArticulosBusqueda: TIBQuery;
    ibqArticulosBusquedaCODIGO_INTERNO: TIBStringField;
    ibqArticulosBusquedaPRECIO_PUBLICO: TIBBCDField;
    ibqArticulosBusquedaLINEA: TIBStringField;
    ibqArticulosBusquedaRUBRO: TIBStringField;
    ibqArticulosBusquedaPROVEEDOR: TIBStringField;
    ibqArticulosBusquedaIDARTICULO: TIntegerField;
    ibqArticulosBusquedaIVA: TIBBCDField;
    ibqArticulosBusquedaDESCRIPCION: TIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure buscarArticulo(elArticulo: string);
  end;

var
  dmBuscarArtVenta: TdmBuscarArtVenta;

implementation

uses dmConex;

{$R *.dfm}

{ TdmBuscarArtVenta }

procedure TdmBuscarArtVenta.buscarArticulo(elArticulo: string);
begin
  ibqArticulosBusqueda.Close;
  ibqArticulosBusqueda.ParamByName('CADENA').AsString:=elArticulo;
  ibqArticulosBusqueda.Open;
end;

end.
