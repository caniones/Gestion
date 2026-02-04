unit uRepEstadoCtasClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uRepBase, QRCtrls, QuickRpt, ExtCtrls, DB, IBCustomDataSet,
  IBQuery, QRExport;

type
  TfrmRepEstadoCtasClientes = class(TfrmRepBase)
    ColumnHeaderBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    ibqMaster: TIBQuery;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
    ibqMasterFECHA: TDateField;
    ibqMasterSALDO: TIBBCDField;
    QRDBText4: TQRDBText;
    ibqCount: TIBQuery;
    ibqCountCOUNT: TIntegerField;
    ibqMasterPSFECHAPAGO: TDateField;
    QRLabel10: TQRLabel;
    QRDBText5: TQRDBText;
    ibqMasterNOMBRE: TIBStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ver();
    procedure imprimir();
  end;

var
  frmRepEstadoCtasClientes: TfrmRepEstadoCtasClientes;

implementation

uses dmConex;

{$R *.dfm}

{ TfrmRepEstadoCtasClientes }

procedure TfrmRepEstadoCtasClientes.imprimir;
begin
  // Imprimo el reporte
  qrBase.Print;
end;

procedure TfrmRepEstadoCtasClientes.ver;
begin
  // Muestro el reporte
  qrBase.PreviewModal;
end;

procedure TfrmRepEstadoCtasClientes.FormCreate(Sender: TObject);
begin
  inherited;
  ibqMaster.Close;
  ibqMaster.Open;
  ibqCount.Close;
  ibqCount.Open;
end;

end.
