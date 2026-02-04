unit uBuscarClienteCtasCtes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uImputForm, StdCtrls, Buttons, ExtCtrls, DBCtrls, DB;

type
  TfrmBuscarClienteCtasCtes = class(TfrmImput)
    dsDatos: TDataSource;
    dblcClientes: TDBLookupComboBox;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscarClienteCtasCtes: TfrmBuscarClienteCtasCtes;

implementation

uses udmEstadoCtasCtesClientes;

{$R *.dfm}

procedure TfrmBuscarClienteCtasCtes.FormShow(Sender: TObject);
begin
  inherited;
  dblcClientes.SetFocus;
end;

procedure TfrmBuscarClienteCtasCtes.btnSalirClick(Sender: TObject);
begin
  inherited;
  Modalresult:= mrOK
end;

end.
