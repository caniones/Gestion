unit uEstadoCtasCtesClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, DBCtrls;

type
  TfrmEstadoCtasCtesClientes = class(TForm)
    dbgDetalles: TDBGrid;
    dbgComprobantes: TDBGrid;
    dbgClientes: TDBGrid;
    dsClientes: TDataSource;
    dsComprobantes: TDataSource;
    dsDetalles: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    btnImprimirSaldo: TSpeedButton;
    btnSalir: TSpeedButton;
    btnBuscarCliente: TSpeedButton;
    btnReimprimir: TSpeedButton;
    btnImprimirEstados: TSpeedButton;
    btnRecibo: TSpeedButton;
    DBGrid1: TDBGrid;
    Label4: TLabel;
    dsAcumulados: TDataSource;
    btnDetalle: TSpeedButton;
    procedure dbgComprobantesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure btnBuscarClienteClick(Sender: TObject);
    procedure btnImprimirSaldoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnReimprimirClick(Sender: TObject);
    procedure btnImprimirEstadosClick(Sender: TObject);
    procedure btnReciboClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnDetalleClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstadoCtasCtesClientes: TfrmEstadoCtasCtesClientes;

implementation

uses udmEstadoCtasCtesClientes, uBuscarClienteCtasCtes, uRepSaldos,
  uRepComprobantes, uRepEstadoCtasClientes, uRecibosClientes, uFiltroFecha,
  uRepDetalleCtasClientes;

var
  dm:TdmEstadoCtasCtesClientes;

{$R *.dfm}

procedure TfrmEstadoCtasCtesClientes.dbgComprobantesDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  // Cambiamos el color
  if dsComprobantes.DataSet.FieldByName('COMPROBANTE').AsString <> '' then
    begin
    dbgComprobantes.Canvas.Brush.Color:=$00FED967;
    dbgComprobantes.Canvas.Font.Color:=clBlack;
    dbgComprobantes.DefaultDrawColumnCell(rect,DataCol,Column,State);
    end;
  if dsComprobantes.DataSet.FieldByName('RECIBO').AsString <> '' then
    begin
    dbgComprobantes.Canvas.Brush.Color:=$0040FF00;
    dbgComprobantes.Canvas.Font.Color:=clBlack;
    dbgComprobantes.DefaultDrawColumnCell(rect,DataCol,Column,State);
    end;
  if dsComprobantes.DataSet.FieldByName('IMPORTE_COMPROBANTE').AsFloat < 0 then
    begin
    dbgComprobantes.Canvas.Brush.Color:=$00C080FF;
    dbgComprobantes.Canvas.Font.Color:=clBlack;
    dbgComprobantes.DefaultDrawColumnCell(rect,DataCol,Column,State);
    end;
end;

procedure TfrmEstadoCtasCtesClientes.FormCreate(Sender: TObject);
begin
  dm:=TdmEstadoCtasCtesClientes.Create(self);
end;

procedure TfrmEstadoCtasCtesClientes.btnSalirClick(Sender: TObject);
begin
  close();
end;

procedure TfrmEstadoCtasCtesClientes.btnBuscarClienteClick(Sender: TObject);
var
  FBuscarClienteCtasCtes:TfrmBuscarClienteCtasCtes;
begin
  FBuscarClienteCtasCtes:=TfrmBuscarClienteCtasCtes.Create(self);
  try
    FBuscarClienteCtasCtes.ShowModal;
  finally
    FBuscarClienteCtasCtes.Free;
  end;
end;

procedure TfrmEstadoCtasCtesClientes.btnImprimirSaldoClick(Sender: TObject);
var
  FSaldo:TfrmRepSaldos;
  id:integer;
begin
  id:=dbgClientes.Fields[0].AsInteger;
  if id > 0 then
    begin
    FSaldo:=TfrmRepSaldos.Create(self);
    try
      FSaldo.imprimir(id);
    finally
      FSaldo.Free;
    end;
    end;
end;

procedure TfrmEstadoCtasCtesClientes.btnReimprimirClick(Sender: TObject);
var
  FRepComprobantes:TfrmRepComprobantes;
  idComprobante:integer;
begin
  idComprobante:=dbgComprobantes.Fields[1].AsInteger;
  if idComprobante > 0 then
    begin
    FRepComprobantes:=TfrmRepComprobantes.Create(self);
    try
      FRepComprobantes.imprimir(idComprobante,1);
    finally
      FRepComprobantes.Free;
    end;
    end
  else
    application.MessageBox('Debe seleccionar un comprobante',
    'Atención',MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmEstadoCtasCtesClientes.btnImprimirEstadosClick(
  Sender: TObject);
var
  FRepEstadoCtasClientes:TfrmRepEstadoCtasClientes;
begin
   FRepEstadoCtasClientes:=TfrmRepEstadoCtasClientes.Create(self);
  try
    FRepEstadoCtasClientes.ver;
  finally
    FRepEstadoCtasClientes.Free;
  end;
end;

procedure TfrmEstadoCtasCtesClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm.Free;
end;

procedure TfrmEstadoCtasCtesClientes.btnReciboClick(Sender: TObject);
var
  FRecibosClientes:TfrmRecibosClientes;
begin
  FRecibosClientes:=TfrmRecibosClientes.Create(self);
  try
    FRecibosClientes.ShowModal;
  finally
    FRecibosClientes.Free;
  end;
end;

procedure TfrmEstadoCtasCtesClientes.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  begin
  key:= #0;
  btnSalir.Click;
  end;
end;

procedure TfrmEstadoCtasCtesClientes.btnDetalleClick(Sender: TObject);
var
  FFiltroFecha:TfrmFiltroFecha;
  FRepDetalleCtaCliente:TfrmRepDetalleCtasClientes;
  fechaDesde, fechaHasta :Tdate;
  elCliente :integer;
begin
  FFiltroFecha:=TfrmFiltroFecha.Create(self);
  try
    FFiltroFecha.ShowModal;
    if FFiltroFecha.ModalResult = mrOK then
      begin
      elCliente:=dsClientes.DataSet.FieldByName('IDCLIENTE').AsInteger;
      fechaDesde:=FFiltroFecha.fechaDesde;
      fechaHasta:=FFiltroFecha.fechaHasta;
      FRepDetalleCtaCliente:=TfrmRepDetalleCtasClientes.Create(self);
      FRepDetalleCtaCliente.ver(fechaDesde, fechaHasta, elCliente);
      end;
  finally
    FFiltroFecha.Free;
    FRepDetalleCtaCliente.Free;
  end;
end;

end.
