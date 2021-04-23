unit HospitalSystem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.jpeg;

type
  TForm1 = class(TForm)
    pnl1: TPanel;
    edtSenha: TEdit;
    img1: TImage;
    edtUsuario: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure edtUsuarioEnter(Sender: TObject);
  private
    aUsuario : array of string;
    aSenhaUsuario : array of string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.edtUsuarioEnter(Sender: TObject);
var i : integer;
    x : string;
begin
  for I := 0 to 4 do
  begin
    if Pos(edtUsuario.Text , aUsuario[i])> 0 then
      edtUsuario.Text := aUsuario[i];
    if edtSenha.Text = aSenhaUsuario[i] then // Abrir a Nova janela
      ShowMessage ('Ok');
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  SetLength(aUsuario,5);
  SetLength(aSenhaUsuario,5);
  aUsuario[0] := ('Henrique_LhCs');
  aUsuario[1] := ('Rejane');
  aUsuario[2] := ('Rejane');
  aUsuario[3] := ('Rejane');
  aUsuario[4] := ('Rejane');
  aSenhaUsuario[0] := ('lhcs1994');
  aSenhaUsuario[1] := ('1234');
  aSenhaUsuario[2] := ('1234');
  aSenhaUsuario[3] := ('1234');
  aSenhaUsuario[4] := ('1234');
end;

end.
