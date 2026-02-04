unit uRepCierreTurno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uRepBase, QRCtrls, QuickRpt, ExtCtrls, DB, IBCustomDataSet,
  IBQuery, QRExport;

type
  TfrmRepCierreTurno = class(TfrmRepBase)
    QRLabel4: TQRLabel;
    ibqDetalle: TIBQuery;
    ColumnHeaderBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    ibqDetalleDESCRIPCION: TIBStringField;
    ibqDetalleCONTADO: TIBBCDField;
    ibqDetalleDEBITO: TIBBCDField;
    ibqDetalleCREDITO: TIBBCDField;
    ibqDetalleCHEQUE: TIBBCDField;
    ibqDetalleCUENTA: TIBBCDField;
    ibqDetalleTICKET: TIBBCDField;
    QRDBText8: TQRDBText;
    ibqTotales: TIBQuery;
    ibqTotalesCONTADO: TIBBCDField;
    ibqTotalesDEBITO: TIBBCDField;
    ibqTotalesCREDITO: TIBBCDField;
    ibqTotalesCHEQUE: TIBBCDField;
    ibqTotalesCUENTA: TIBBCDField;
    ibqTotalesTICKET: TIBBCDField;
    QRSubDetail1: TQRSubDetail;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText6: TQRDBText;
    ibqMaestro: TIBQuery;
    QRLabel15: TQRLabel;
    qreTotalesDetalles: TQRExpr;
  private
    { Private declarations }
    procedure prepararReporte(idCierre: integer);
  public
    { Public declarations }
    procedure imprimir(idCierre: integer);
    procedure ver(idCierre: integer);
  end;

var
  frmRepCierreTurno: TfrmRepCierreTurno;

implementation

uses udmCierreTurno;

{$R *.dfm}

{ TfrmRepCierreTurno }

procedure TfrmRepCierreTurno.imprimir(idCierre: integer);
begin
  self.prepararReporte(idCierre);
  qrBase.Print;
end;

procedure TfrmRepCierreTurno.prepararReporte(idCierre: integer);
begin
  ibqMaestro.Close;
  ibqMaestro.ParamByName('IDCIERRE').AsInteger:=idCierre;
  ibqMaestro.Open;
  ibqDetalle.Close;
  ibqDetalle.ParamByName('IDCIERRE').AsInteger:=idCierre;
  ibqDetalle.Open;
  ibqTotales.Close;
  ibqTotales.ParamByName('IDCIERRE').AsInteger:=idCierre;
  ibqTotales.Open;
end;

procedure TfrmRepCierreTurno.ver(idCierre: integer);
begin
  self.prepararReporte(idCierre);
  qrBase.PreviewModal;
end;

end.
