unit uRepDetalleCtasClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uRepBase, QRExport, QRCtrls, QuickRpt, ExtCtrls, DB,
  IBCustomDataSet, IBQuery;

type
  TfrmRepDetalleCtasClientes = class(TfrmRepBase)
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    ibqMaster: TIBQuery;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    ibqMasterFECHA: TDateField;
    ibqMasterDESCRIPCION: TIBStringField;
    ibqMasterIMPORTE: TFloatField;
    ibqSaldo: TIBQuery;
    ibqSaldoFECHA: TDateTimeField;
    ibqSaldoNOMBRE: TIBStringField;
    ibqSaldoSALDO: TIBBCDField;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ver(fechaDesde, fechaHasta :TDate; elCliente :integer);
  end;

var
  frmRepDetalleCtasClientes: TfrmRepDetalleCtasClientes;

implementation

uses dmConex;

{$R *.dfm}

{ TfrmRepDetalleCtasClientes }

procedure TfrmRepDetalleCtasClientes.ver(fechaDesde, fechaHasta: TDate;
  elCliente: integer);
begin
  //
  ibqMaster.Close;
  ibqMaster.ParamByName('DESDE').AsDate:=fechaDesde;
  ibqMaster.ParamByName('HASTA').AsDate:=fechaHasta;
  ibqMaster.ParamByName('IDCLIENTE').AsInteger:=elCliente;
  ibqMaster.Open;
  ibqMaster.RecordCount;
  ibqSaldo.Close;
  ibqSaldo.ParamByName('IDCLIENTE').AsInteger:=elCliente;
  ibqSaldo.Open;
  qrBase.PreviewModal;
end;

end.
