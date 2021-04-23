unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmLogin = class(TForm)
    img1: TImage;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    btnEntrar: TBitBtn;
    btnNU: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
    procedure btnNUClick(Sender: TObject);
  private
    aSenha : array of string ;
    aUsuario : array of string ;
  public
end;

var
  frmLogin: TfrmLogin;

implementation

uses Principal, NovoUsuario, SqlExpr, aadm;

{$R *.dfm}

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
var vQryAcesso : TSQLquery;
begin
  vQryAcesso := TSQLQuery.Create(Self);
  vQryAcesso.SQLConnection := aadm.dm.dbxDb;
  vQryAcesso.Close;

  vQryAcesso.SQL.Add('  SELECT usuario');
  vQryAcesso.SQL.Add('       , senha  ');
  vQryAcesso.SQL.Add('    FROM login  ');
  vQryAcesso.SQL.Add('   WHERE usuario = :usuario');
  vQryAcesso.SQL.Add('     AND senha = :senha    ');

  vQryAcesso.ParamByName('usuario').AsString := edtUsuario.text ;
  vQryAcesso.ParamByName('senha').AsString := edtSenha.text ;
  vQryAcesso.open;

  if not vQryAcesso.IsEmpty then
  begin
    ShowMessage('Bem vindo');
    TfrmPrincipal.Create(Application).ShowModal;
  end
  else
  begin
    showMessage('Usuario não cadastrado.');
    edtUsuario.Clear;
    edtSenha.Clear;
    edtUsuario.SetFocus;
    FreeAndNil( vQryAcesso ); 
    exit; 
  end;
  Close;
  FreeAndNil( vQryAcesso ); 
end; 

procedure TfrmLogin.btnNUClick(Sender: TObject);
var vfrm: TfrmNovoUsuario;
begin
  vfrm := TfrmNovoUsuario.Create(Application);
  vfrm.ShowModal;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  SetLength(aUsuario, 4);
  SetLength(aSenha, 4);
  aUsuario[0] := ('Henrique_LhCs');
  aUsuario[1] := ('Rafael_ScreamerHead');
  aUsuario[2] := ('Felipe_LRJ');
  aUsuario[3] := ('ABC');
  aSenha[0] := ('');
  aSenha[1] := ('');
  aSenha[2] := ('');
  aSenha[3] := ('');
end;
end.
