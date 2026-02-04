unit uRepGastos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uRepBase, QRCtrls, QuickRpt, ExtCtrls, DB, IBCustomDataSet,
  IBQuery, QRExport;

type
  TfrmRepGastos = class(TfrmRepBase)
    ibqMaster: TIBQuery;
    SummaryBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    ibqMasterFECHA: TDateField;
    ibqMasterDESCRIPCION: TIBStringField;
    ibqMasterIMPORTE: TIBBCDField;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    ibqMasterFORMA_PAGO: TIBStringField;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    qrlDesde: TQRLabel;
    qrlHasta: TQRLabel;
    QRLabel11: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure prepararImpresion(const desde, hasta: TDate);
    procedure ver();
  end;

var
  frmRepGastos: TfrmRepGastos;

implementation

uses dmConex;

{$R *.dfm}

{ TfrmRepGastos }

procedure TfrmRepGastos.prepararImpresion(const desde, hasta: TDate);
begin
  // preparo los datos para generar el reporte
  ibqMaster.Close;
  ibqMaster.ParamByName('DESDE').AsDate:=desde;
  ibqMaster.ParamByName('HASTA').AsDate:=hasta;
  ibqMaster.Open;
  qrlDesde.Caption:=DateToStr(desde);
  qrlHasta.Caption:=DateToStr(hasta);
end;

procedure TfrmRepGastos.ver;
begin
  qrBase.PreviewModal;
end;

end.
