unit uMonedas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uImputForm, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB,
  Mask, DBCtrls;

type
  TfrmMonedas = class(TfrmImput)
    dsMonedas: TDataSource;
    SpeedButton1: TSpeedButton;
    DBGrid1: TDBGrid;
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMonedas: TfrmMonedas;

implementation

uses dmConex;

{$R *.dfm}

procedure TfrmMonedas.btnSalirClick(Sender: TObject);
begin
  inherited;
  self.Close;
end;

procedure TfrmMonedas.FormCreate(Sender: TObject);
begin
  inherited;
  dsMonedas.DataSet.Open;
end;

procedure TfrmMonedas.FormDestroy(Sender: TObject);
begin
  inherited;
  dsMonedas.DataSet.Close;
end;

procedure TfrmMonedas.DBGrid1ColExit(Sender: TObject);
begin
  inherited;
  dsMonedas.DataSet.CheckBrowseMode;
end;

procedure TfrmMonedas.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  dmConexion.actualizarCostos;
end;

end.
