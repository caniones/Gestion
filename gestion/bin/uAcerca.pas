unit uAcerca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls, OleCtrls, SHDocVw;

type
  TfrmAcerca = class(TForm)
    Image: TImage;
    lCuatroCuatros: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClick(Sender: TObject);
    procedure ImageClick(Sender: TObject);
    procedure ImageMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lCuatroCuatrosClick(Sender: TObject);
    procedure lCuatroCuatrosMouseLeave(Sender: TObject);
    procedure lCuatroCuatrosMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAcerca: TfrmAcerca;

implementation

uses ShellAPI;

{$R *.dfm}

procedure TfrmAcerca.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = char(VK_ESCAPE) then
  begin
    key:= #0;
    Modalresult:= mrOK;
  end;
end;

procedure TfrmAcerca.FormClick(Sender: TObject);
begin
  Modalresult:= mrOK;
end;

procedure TfrmAcerca.ImageClick(Sender: TObject);
begin
  Modalresult:= mrOK;
end;

procedure TfrmAcerca.ImageMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  Image.Hint:='Click para Cerrar';
end;

procedure TfrmAcerca.lCuatroCuatrosClick(Sender: TObject);
Var St:Array[0..255] of char;
begin
  ShellExecute(0,'open',StrPCopy(St,'http://'+lCuatroCuatros.Caption),nil,nil,SW_SHOW);
end;

procedure TfrmAcerca.lCuatroCuatrosMouseLeave(Sender: TObject);
begin
  lCuatroCuatros.Font.Style:=[fsBold];
end;

procedure TfrmAcerca.lCuatroCuatrosMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  lCuatroCuatros.Font.Style:=[fsBold,fsUnderline];
end;

end.
