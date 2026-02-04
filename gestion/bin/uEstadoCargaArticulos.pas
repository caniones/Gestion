unit uEstadoCargaArticulos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uImputForm, StdCtrls, Buttons, ExtCtrls, ComCtrls, DBCtrls,
  Grids, DBGrids, DB;

type
  TfrmEstadoCargaArticulos = class(TfrmImput)
    dtpDesde: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    dtpHasta: TDateTimePicker;
    dblcbProveedor: TDBLookupComboBox;
    btnBuscar: TSpeedButton;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    dsDatos: TDataSource;
    dsProveedores: TDataSource;
    Label4: TLabel;
    dbtTotalCantidad: TDBText;
    dsTotalCantidad: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dtpDesdeChange(Sender: TObject);
    procedure dtpHastaChange(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure dblcbProveedorKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstadoCargaArticulos: TfrmEstadoCargaArticulos;

implementation

uses udmProveedores, uPublicos;

var
  dm:TdmProveedores;

{$R *.dfm}

procedure TfrmEstadoCargaArticulos.FormShow(Sender: TObject);
begin
  inherited;
  // cargo la fecha hasta hoy para los dos dtp
  dtpDesde.Date:=date;
  dtpHasta.Date:=date;
end;

procedure TfrmEstadoCargaArticulos.FormCreate(Sender: TObject);
begin
  inherited;
  // creo el módulo de datos
  dm:=TdmProveedores.Create(self);
end;

procedure TfrmEstadoCargaArticulos.FormDestroy(Sender: TObject);
begin
  inherited;
  // libero el módulo de datos
  dm.Free;
end;

procedure TfrmEstadoCargaArticulos.dtpDesdeChange(Sender: TObject);
begin
  inherited;
  if not uPublicos.validarFechas(dtpDesde.Date, dtpHasta.Date) then
  // como desde es mayor hasta toma el valor desde
    dtpHasta.Date:=dtpDesde.Date;
end;

procedure TfrmEstadoCargaArticulos.dtpHastaChange(Sender: TObject);
begin
  inherited;
  if not uPublicos.validarFechas(dtpDesde.Date, dtpHasta.Date) then
  // como hasta es menor desde toma el valor hasta
    dtpDesde.Date:=dtpHasta.Date
end;

procedure TfrmEstadoCargaArticulos.btnSalirClick(Sender: TObject);
begin
  inherited;
  modalresult:=mrOK;
end;

procedure TfrmEstadoCargaArticulos.btnBuscarClick(Sender: TObject);
begin
  inherited;
  if dblcbProveedor.KeyValue = null then
    dm.buscarEstadoCargaArticulos(dtpDesde.Date, dtpHasta.Date, -1)
  else
    dm.buscarEstadoCargaArticulos(dtpDesde.Date, dtpHasta.Date, dblcbProveedor.KeyValue)
end;

procedure TfrmEstadoCargaArticulos.dblcbProveedorKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = char(VK_BACK) then
    begin
    key:=#0;
    // borro la lista de proveedores
    dblcbProveedor.KeyValue:=-1;
    end;
end;

end.
