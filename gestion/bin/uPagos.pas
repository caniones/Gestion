unit uPagos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uImputForm, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DB;

type
  TfrmPagos = class(TfrmImput)
    dbgDatos: TDBGrid;
    dsDatos: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure dbgDatosDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FviendoComo: string;
    procedure SetviendoComo(const Value: string);
    property viendoComo:string read FviendoComo write SetviendoComo;
  public
    { Public declarations }
    procedure verComo(como:string);
  end;

var
  frmPagos: TfrmPagos;

implementation

uses udmPagos, uAPago;

var
  dm:TdmPagos;

{$R *.dfm}

{ TfrmPagos }

procedure TfrmPagos.FormCreate(Sender: TObject);
begin
  inherited;
  // creo el datamodule
  dm:=TdmPagos.Create(self);
end;

procedure TfrmPagos.btnSalirClick(Sender: TObject);
begin
  inherited;
  dsDatos.DataSet.Cancel;
  Modalresult:= mrOK;
end;

procedure TfrmPagos.SetviendoComo(const Value: string);
begin
  FviendoComo := Value;
end;

procedure TfrmPagos.verComo(como: string);
begin
  // asigno el valor a la propiedad viendoComo
  self.SetviendoComo(como);
  // --------------------- CHEQUES ---------------------//
  if FviendoComo = 'CHEQUE' then
    begin
    self.caption:=self.caption+'Cheques';
    lInfo.Caption:='Cheques';
    // asigno el dataset
    dsDatos.DataSet:=dm.ibdsCheques;
    // abro el dataset
    dm.abrirCheques;
    // oculto las columnas innecesarias
    dbgDatos.Columns[0].Visible:=false;
    dbgDatos.Columns[3].Visible:=false;
    dbgDatos.Columns[6].Visible:=false;
    dbgDatos.Columns[7].Visible:=false;
    end;
  // --------------------- DEPOSITOS ---------------------//
  if FviendoComo = 'DEPOSITO' then
    begin
    self.caption:=self.caption+'Depósitos';
    lInfo.Caption:='Depósitos';
    // asigno el dataset
    dsDatos.DataSet:=dm.ibdsDepositos;
    // abro el dataset
    dm.abrirDepositos;
    // oculto las columnas innecesarias
    dbgDatos.Columns[0].Visible:=false;
    dbgDatos.Columns[3].Visible:=false;
    dbgDatos.Columns[6].Visible:=false;
    end;
end;

procedure TfrmPagos.dbgDatosDblClick(Sender: TObject);
var
  FImputPago:TfrmImputPago;
  id: integer;
begin
  inherited;
  if not dsDatos.DataSet.IsEmpty then
  // si no hay datos no hace nada 
    begin
    // --------------------- CHEQUES ---------------------//
    if FviendoComo = 'CHEQUE' then
      begin
      // primero lo pongo en edit para que tome el estado al mostrar los datos del cheque
      dsDatos.DataSet.Edit;
      // muestro los datos del cheque
      FImputPago:=TfrmImputPago.Create(self);
      FImputPago.verComo('CHEQUE');
      if FImputPago.ShowModal = mrOK then
      // grabo el cheque, no hago nada con el id
        dm.grabarCheque(id);
      end;
    // --------------------- DEPOSITOS ---------------------//
    if FviendoComo = 'DEPOSITO' then
      begin
      // primero lo pongo en edit para que tome el estado al mostrar los datos del cheque
      dsDatos.DataSet.Edit;
      // muestro los datos del deposito
      FImputPago:=TfrmImputPago.Create(self);
      FImputPago.verComo('DEPOSITO');
      if FImputPago.ShowModal = mrOK then
      // grabo el deposito, no hago nada con el id
        dm.grabarDeposito(id);
      end;
    end;
end;

procedure TfrmPagos.FormDestroy(Sender: TObject);
begin
  inherited;
  // libero el datamodule
  dm.Free;
end;

end.
