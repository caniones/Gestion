unit uEstadisticasProveedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uImputForm, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB;

type
  TfrmEstadisticasProveedores = class(TfrmImput)
    dbgComprasMes: TDBGrid;
    dgbVentasMes: TDBGrid;
    dbgComprasTemporada: TDBGrid;
    dbgVentasTemporada: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dsComprasMes: TDataSource;
    dsComprasTemporada: TDataSource;
    dsVentasMes: TDataSource;
    dsVentasTemporada: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstadisticasProveedores: TfrmEstadisticasProveedores;

implementation

uses udmEstadoCtasCtesProveedores;

{$R *.dfm}

procedure TfrmEstadisticasProveedores.FormCreate(Sender: TObject);
begin
  inherited;
  // abro los data set
  dsComprasMes.DataSet.Open;
  dsComprasTemporada.DataSet.Open;
  dsVentasMes.DataSet.Open;
  dsVentasTemporada.DataSet.Open;
end;

procedure TfrmEstadisticasProveedores.FormDestroy(Sender: TObject);
begin
  inherited;
  // cierro los data set
  dsComprasMes.DataSet.Close;
  dsComprasTemporada.DataSet.Close;
  dsVentasMes.DataSet.Close;
  dsVentasTemporada.DataSet.Close;
end;

procedure TfrmEstadisticasProveedores.btnSalirClick(Sender: TObject);
begin
  inherited;
  self.Close;
end;

end.
