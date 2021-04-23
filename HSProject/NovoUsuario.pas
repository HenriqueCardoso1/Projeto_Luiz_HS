unit NovoUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmNovoUsuario = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edtNuNome: TEdit;
    edtNuCelular: TEdit;
    btn1: TBitBtn;
    edtNuEmail: TEdit;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    edtNuNomeUsuario: TEdit;
    edtNuSenha: TEdit;
    edtConfirmarSenha: TEdit;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure SalvarCadastro;
    procedure Limpar;
  public
    { Public declarations }
  end;

var
  frmNovoUsuario: TfrmNovoUsuario;

implementation

uses SqlExpr, aadm;

{$R *.dfm}

procedure TfrmNovoUsuario.btn1Click(Sender: TObject);
begin
  SalvarCadastro;
end;

procedure TfrmNovoUsuario.SalvarCadastro;
var vQrySalvar: TSQLQuery;
begin
  if edtNUSenha.Text <> edtConfirmarSenha.Text then
  begin
    ShowMessage('As senhas não são iguais!');
    edtNUSenha.Clear;
    edtConfirmarSenha.Clear;
    edtNUSenha.SetFocus;
  end
  else
  begin
    vQrySalvar := TSQLQuery.Create(Self);
    vQrySalvar.SQLConnection := aadm.dm.dbxDb;
    vQrySalvar.Close;

    vQrySalvar.SQL.Clear;
    vQrySalvar.SQL.Add(' Insert INTO Login ( Usuario');
    vQrySalvar.SQL.Add('                   , Senha  ');
    vQrySalvar.SQL.Add('                   , Nome   ');
    vQrySalvar.SQL.Add('                   , Email  ');
    vQrySalvar.SQL.Add('                   , Celular)');
    vQrySalvar.SQL.Add('                     values( ');
    vQrySalvar.SQL.Add('                     :Usuario');
    vQrySalvar.SQL.Add('                   , :Senha  ');
    vQrySalvar.SQL.Add('                   , :Nome   ');
    vQrySalvar.SQL.Add('                   , :Email  ');
    vQrySalvar.SQL.Add('                   , :Celular)');

    vQrySalvar.ParamByName('Usuario').AsString := (edtNUNomeUsuario.Text);
    vQrySalvar.ParamByName('Senha').AsString := (edtNUSenha.Text);
    vQrySalvar.ParamByName('Nome').AsString := (edtNUNome.Text);
    vQrySalvar.ParamByName('Email').AsString := (edtNUEmail.Text);
    vQrySalvar.ParamByName('Celular').AsString := (edtNUCelular.Text);

    try
      vQrySalvar.ExecSQL;
      MessageBox(Handle,'Gravado com sucesso','Sucesso', MB_ICONEXCLAMATION or MB_OK);
      Limpar;
    except on e: exception do
    begin
      MessageBox(Handle,pChar('Erro ao Gravar' + #13 + e.message ),'Erro', MB_ICONERROR or MB_OK);
    end;

    end;
    Limpar;
    Close;
  end;
end;
procedure TfrmNovoUsuario.Limpar;
begin
  edtNUNome.Clear;
  edtNUNomeUsuario.Clear;
  edtNUCelular.Clear;
  edtNUEmail.Clear;
  edtNUSenha.Clear;
  edtConfirmarSenha.Clear;
end;

end.
