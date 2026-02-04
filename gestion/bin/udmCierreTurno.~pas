unit udmCierreTurno;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IBQuery, IBSQL, Controls;

type
  TdmCierreTurno = class(TDataModule)
    ibtCierresTurnos: TIBTransaction;
    ibqCierresTurnos: TIBQuery;
    ibqCierresTurnosIDCIERRE: TIntegerField;
    ibqCierresTurnosFECHA: TDateTimeField;
    ibsqlCerrarTurno: TIBSQL;
    ibqIdCierreTurno: TIBQuery;
    ibqIdCierreTurnoMAX: TIntegerField;
    ibqVentasXmes: TIBQuery;
    ibqVentasXanio: TIBQuery;
    ibqVentasXmesTOTAL: TIBBCDField;
    ibqVentasXmesCONTADO: TIBBCDField;
    ibqVentasXmesCUENTA: TIBBCDField;
    ibqVentasXmesDEBITO: TIBBCDField;
    ibqVentasXmesCREDITO: TIBBCDField;
    ibqVentasXmesCHEQUE: TIBBCDField;
    ibqVentasXmesTICKET: TIBBCDField;
    ibqVentasXmesDEPOSITO: TIBBCDField;
    ibqVentasXmesFECHA: TIBStringField;
    ibqVentasXanioFECHA: TSmallintField;
    ibqVentasXanioTOTAL: TIBBCDField;
    ibqVentasXanioCONTADO: TIBBCDField;
    ibqVentasXanioCUENTA: TIBBCDField;
    ibqVentasXanioDEBITO: TIBBCDField;
    ibqVentasXanioCREDITO: TIBBCDField;
    ibqVentasXanioCHEQUE: TIBBCDField;
    ibqVentasXanioTICKET: TIBBCDField;
    ibqVentasXanioDEPOSITO: TIBBCDField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure cerrarTurno(out idCierre: integer);
    procedure cargarEstadisticasVentas(desde, hasta: TDate);
  end;

var
  dmCierreTurno: TdmCierreTurno;

implementation

uses dmConex;

{$R *.dfm}

procedure TdmCierreTurno.cargarEstadisticasVentas(desde, hasta: TDate);
begin
  // cargo los dataset para mostrar las estadisticas de ventas
  ibqVentasXmes.Close;
  ibqVentasXmes.ParamByName('DESDE_FECHA').AsDate:=desde;
  ibqVentasXmes.ParamByName('HASTA_FECHA').AsDate:=hasta;
  ibqVentasXmes.Open;
  ibqVentasXanio.Close;
  ibqVentasXanio.ParamByName('DESDE_FECHA').AsDate:=desde;
  ibqVentasXanio.ParamByName('HASTA_FECHA').AsDate:=hasta;
  ibqVentasXanio.Open;
end;

procedure TdmCierreTurno.cerrarTurno(out idCierre: integer);
begin
  ibsqlCerrarTurno.Close;
  try
    ibsqlCerrarTurno.ExecQuery;
    ibtCierresTurnos.Commit;
    ibqIdCierreTurno.Close;
    ibqIdCierreTurno.Open;
    idCierre:=ibqIdCierreTurno.Fields[0].AsInteger;
  except
    ibtCierresTurnos.Rollback;
  end;
end;

procedure TdmCierreTurno.DataModuleCreate(Sender: TObject);
begin
  ibqCierresTurnos.Close;
  ibqCierresTurnos.Open;
  ibqCierresTurnos.Last;
end;

end.
