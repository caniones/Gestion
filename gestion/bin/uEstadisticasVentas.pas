unit uEstadisticasVentas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uImputForm, Grids, DBGrids, DB, StdCtrls, Buttons, ExtCtrls,
  ComCtrls;

type
  TfrmEstadisticasVentas = class(TfrmImput)
    dsMes: TDataSource;
    dsAnio: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    dtpDesde: TDateTimePicker;
    dtpHasta: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    btnBuscar: TSpeedButton;
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure dtpHastaCloseUp(Sender: TObject);
    procedure dtpDesdeCloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstadisticasVentas: TfrmEstadisticasVentas;

implementation

uses udmCierreTurno, uPublicos;

var
  dm:TdmCierreTurno;

{$R *.dfm}

procedure TfrmEstadisticasVentas.btnSalirClick(Sender: TObject);
begin
  inherited;
  Modalresult:= mrOK
end;

procedure TfrmEstadisticasVentas.FormCreate(Sender: TObject);
begin
  inherited;
  // creo el módulo de datos
  dm:=TdmCierreTurno.Create(self);
end;

procedure TfrmEstadisticasVentas.FormDestroy(Sender: TObject);
begin
  inherited;
  // libero el módulo de datos
  dm.Free;
end;

procedure TfrmEstadisticasVentas.FormShow(Sender: TObject);
begin
  inherited;
  // cargo la fecha hasta hoy para los dos dtp
  dtpDesde.Date:=date;
  dtpHasta.Date:=date;
end;

procedure TfrmEstadisticasVentas.btnBuscarClick(Sender: TObject);
begin
  inherited;
  // busco los comprobantes para las estadísticas
  if uPublicos.validarFechas(dtpDesde.Date, dtpHasta.Date) then
    dm.cargarEstadisticasVentas(dtpDesde.Date, dtpHasta.Date);
end;

procedure TfrmEstadisticasVentas.dtpHastaCloseUp(Sender: TObject);
begin
  inherited;
  if not uPublicos.validarFechas(dtpDesde.Date, dtpHasta.Date) then
  // como hasta es menor desde toma el valor hasta
    dtpDesde.Date:=dtpHasta.Date
end;

procedure TfrmEstadisticasVentas.dtpDesdeCloseUp(Sender: TObject);
begin
  inherited;
  if not uPublicos.validarFechas(dtpDesde.Date, dtpHasta.Date) then
  // como desde es mayor hasta toma el valor desde
    dtpHasta.Date:=dtpDesde.Date;
end;

end.
