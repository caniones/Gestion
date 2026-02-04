unit uRepComprobantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, DB, IBCustomDataSet, IBQuery, QRCtrls;

type
  TfrmRepComprobantes = class(TForm)
    qrComprobantes: TQuickRep;
    TitleBand1: TQRBand;
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    ibqMaster: TIBQuery;
    ibqDetalle: TIBQuery;
    dsDetalle: TDataSource;
    ibqCliente: TIBQuery;
    ibqMasterID_NROCOMPROBANTE: TIntegerField;
    ibqMasterLETRA: TIBStringField;
    ibqMasterNROSUCURSAL: TIntegerField;
    ibqMasterNROCOMPROBANTE: TIntegerField;
    ibqMasterFECHA: TDateTimeField;
    ibqMasterFORMAS_PAGOS: TIBStringField;
    ibqMasterIDCLIENTE: TIntegerField;
    ibqMasterTOTAL_NETO: TIBBCDField;
    ibqMasterTOTAL_IVA: TIBBCDField;
    ibqMasterTOTAL_DESCUENTO: TIBBCDField;
    ibqMasterTOTAL_GENERAL: TIBBCDField;
    ibqClienteNOMBRE: TIBStringField;
    ibqClienteSITUACION: TIBStringField;
    ibqClienteCUIT: TIBStringField;
    ibqClienteDIRECCION: TIBStringField;
    ibqClienteCODIGO_POSTAL: TIBStringField;
    ibqClienteLOCALIDAD: TIBStringField;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText9: TQRDBText;
    qrlRenglon1: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText14: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText15: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRExpr1: TQRExpr;
    ibqMasterTOTAL_FINANCIADO: TFloatField;
    ibqDetalleID_NROCOMPROBANTE: TIntegerField;
    ibqDetallePRECIO: TIBBCDField;
    ibqDetalleDESCUENTO: TIBBCDField;
    ibqDetalleSUBTOTAL: TFloatField;
    ibqDetalleCODIGO_INTERNO: TIBStringField;
    QRDBText16: TQRDBText;
    qrlRenglon2: TQRLabel;
    ibqMasterOBSERVACIONES: TIBStringField;
    qrlRenglon3: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel4: TQRLabel;
    ibqMasterTIPO_COMPROBANTE: TIBStringField;
    QRDBText7: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText8: TQRDBText;
    ibqDetalleDESCRIPCION: TIBStringField;
    ibqDetalleCANTIDAD: TIBBCDField;
    procedure qrComprobantesBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure imprimir(idNroComprobante, cantCopias : integer);
  end;

var
  frmRepComprobantes: TfrmRepComprobantes;

implementation

uses dmConex, uPublicos;

{$R *.dfm}

{ TfrmComprobantes }

procedure TfrmRepComprobantes.imprimir(idNroComprobante, cantCopias: integer);
begin
  // impresion del comprobante //
  ibqMaster.Close;
  ibqMaster.ParamByName('ID').AsInteger:=idNroComprobante;
  ibqMaster.Open;
  ibqDetalle.Open;
  ibqCliente.Open;
  qrComprobantes.PrinterSettings.Copies:=cantCopias;
  qrComprobantes.Print;
end;

procedure TfrmRepComprobantes.qrComprobantesBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  // cargo los datos del negocio desde el .ini
  qrlRenglon1.Caption:=uPublicos.LeerIni(ChangeFileExt(Application.ExeName,
    '.INI'), 'IMPRESION', 'RENGLON1', 'NEGOCIO');
  qrlRenglon2.Caption:=uPublicos.LeerIni(ChangeFileExt(Application.ExeName,
    '.INI'), 'IMPRESION', 'RENGLON2', 'TEL');
  qrlRenglon3.Caption:=uPublicos.LeerIni(ChangeFileExt(Application.ExeName,
    '.INI'), 'IMPRESION', 'RENGLON3', 'DIRECCION');
  // le agrega fecha y hora de impresion al titulo del reporte
  qrComprobantes.ReportTitle:=qrComprobantes.ReportTitle+'-'+
    ibqMasterTIPO_COMPROBANTE.AsString+ibqMasterNROSUCURSAL.AsString+'-'+
    ibqMasterNROCOMPROBANTE.AsString;
end;

end.
