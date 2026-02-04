unit uRepPagosClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uRepBase, QRCtrls, QuickRpt, ExtCtrls, DB, IBCustomDataSet,
  IBQuery, QRExport;

type
  TfrmRepPagosClientes = class(TfrmRepBase)
    ColumnHeaderBand1: TQRBand;
    SummaryBand1: TQRBand;
    DetailBand1: TQRBand;
    ibqMaster: TIBQuery;
    ibqMasterNUMERO: TIntegerField;
    ibqMasterFECHA: TDateField;
    ibqMasterCLIENTE: TIBStringField;
    ibqMasterIMPORTE: TIBBCDField;
    ibqMasterFORMA_PAGO: TIBStringField;
    ibqMasterANULADO: TIntegerField;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    qrlDesde: TQRLabel;
    qrlHasta: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel13: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure prepararImpresion(const desde, hasta: TDate);
    procedure ver();
  end;

var
  frmRepPagosClientes: TfrmRepPagosClientes;

implementation

uses dmConex;

{$R *.dfm}

{ TfrmRepPagosClientes }

procedure TfrmRepPagosClientes.prepararImpresion(const desde,
  hasta: TDate);
begin
  // preparo los datos para generar el reporte
  ibqMaster.Close;
  ibqMaster.ParamByName('DESDE').AsDate:=desde;
  ibqMaster.ParamByName('HASTA').AsDate:=hasta;
  ibqMaster.Open;
  qrlDesde.Caption:=DateToStr(desde);
  qrlHasta.Caption:=DateToStr(hasta);
end;

procedure TfrmRepPagosClientes.ver;
begin
  qrBase.PreviewModal;
end;

procedure TfrmRepPagosClientes.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  // configuracion normal
  Sender.Color:=clWhite;
  Sender.Font.Style:=[];
  if ibqMaster.FieldByName('ANULADO').AsInteger = 1 then
    // si esta anulado lo remarco para que se vea
    begin
    Sender.Color:=clSilver;
    end;
end;

end.
