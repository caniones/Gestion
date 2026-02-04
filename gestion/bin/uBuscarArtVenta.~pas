unit uBuscarArtVenta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uImputForm, StdCtrls, Buttons, ExtCtrls, DBCtrls, Grids,
  DBGrids, DB, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, Mask, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid;

type
  TfrmBuscarArtVenta = class(TfrmImput)
    dsItems: TDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    eBusquedaArticulo: TEdit;
    dsDatos: TDataSource;
    cxGrid1DBTableView1IDARTICULO: TcxGridDBColumn;
    cxGrid1DBTableView1CODIGO_INTERNO: TcxGridDBColumn;
    cxGrid1DBTableView1DESCRIPCION: TcxGridDBColumn;
    cxGrid1DBTableView1PRECIO_PUBLICO: TcxGridDBColumn;
    cxGrid1DBTableView1LINEA: TcxGridDBColumn;
    cxGrid1DBTableView1RUBRO: TcxGridDBColumn;
    cxGrid1DBTableView1PROVEEDOR: TcxGridDBColumn;
    procedure dbgDatosDblClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure eBusquedaArticuloKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscarArtVenta: TfrmBuscarArtVenta;

implementation

uses udmComprobantesVentas, udmBuscarArtVenta;

var
  dm:TdmBuscarArtVenta;

{$R *.dfm}

procedure TfrmBuscarArtVenta.dbgDatosDblClick(Sender: TObject);
begin
  inherited;
  btnAceptar.Click;
end;

procedure TfrmBuscarArtVenta.btnSalirClick(Sender: TObject);
var
  i: integer;
begin
  inherited;
  // rengón seleccionado
  i:=cxGrid1DBTableView1.DataController.RecNo-1;
  dsItems.DataSet.FieldByName('IDARTICULO').AsInteger:=
    dsDatos.DataSet.FieldByName('IDARTICULO').AsInteger;
  dsItems.DataSet.FieldByName('PRECIO').AsFloat:=
    dsDatos.DataSet.FieldByName('PRECIO_PUBLICO').AsFloat;
  dsItems.DataSet.FieldByName('IVA').AsFloat:=
    dsDatos.DataSet.FieldByName('IVA').AsFloat;
  Modalresult:= mrOK;
end;

procedure TfrmBuscarArtVenta.eBusquedaArticuloKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = char(VK_RETURN) then
    begin
    key:= #0;
    // busco el articulo
    dm.buscarArticulo(eBusquedaArticulo.Text);
    end;
  if Key = char(VK_SPACE) then
    begin
    key:= '%';
    end;
end;

procedure TfrmBuscarArtVenta.FormCreate(Sender: TObject);
begin
  inherited;
  // creo el módulo de datos
  dm:=TdmBuscarArtVenta.Create(self);
end;

procedure TfrmBuscarArtVenta.FormDestroy(Sender: TObject);
begin
  inherited;
  // libero el módulo de datos
  dm.Free;
end;

procedure TfrmBuscarArtVenta.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  inherited;
  btnSalir.Click;
end;

procedure TfrmBuscarArtVenta.FormShow(Sender: TObject);
begin
  inherited;
  eBusquedaArticulo.SetFocus;
end;

end.
