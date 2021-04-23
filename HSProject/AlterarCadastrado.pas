unit AlterarCadastrado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Menus, Vcl.ExtCtrls;

type
  TfrmAlterarCadastrado = class(TForm)
    mm1: TMainMenu;
    mSair: TMenuItem;
    lbl1: TLabel;
    edtPaciente: TEdit;
    btnPesquisaPaciente: TBitBtn;
    lbl2: TLabel;
    edtRG: TEdit;
    lbl3: TLabel;
    edtDN: TEdit;
    lbl4: TLabel;
    edtAcompanhante: TEdit;
    lbl5: TLabel;
    edtComplemento: TEdit;
    lbl6: TLabel;
    edtEndereco: TEdit;
    edtCPF: TEdit;
    lbl8: TLabel;
    cbbTipoS: TComboBox;
    lbl9: TLabel;
    edtId: TEdit;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    edtTelefone: TEdit;
    edtCelular: TEdit;
    lbl13: TLabel;
    edtEmail: TEdit;
    btnAtualizar: TBitBtn;
    procedure mSairClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnPesquisaPacienteClick(Sender: TObject);
  private
    procedure limpar;
    procedure AtualizarPaciente;
  public

  end;

var
  frmAlterarCadastrado: TfrmAlterarCadastrado;

implementation

uses SqlExpr, aadm;

{$R *.dfm}

procedure TfrmAlterarCadastrado.AtualizarPaciente;
var vQryInsert: TSQLQuery;
begin
  vQryInsert:= TSQLQuery.Create(Self);
  vQryInsert.SQLConnection := aadm.dm.dbxDb;
  vQryInsert.Close;

  vQryInsert.Sql.Clear;
  vQryInsert.Sql.Add(' ');
  vQryInsert.Sql.Add('UPDATE Pacientes SET ID = :ID');
  vQryInsert.Sql.Add('                      , NOME = :NOME');
  vQryInsert.Sql.Add('                      , CPF = :CPF');
  vQryInsert.Sql.Add('                      , RG = :RG');
  vQryInsert.Sql.Add('                      , DATANASCIMENTO = :DATANASCIMENTO');
  vQryInsert.Sql.Add('                      , TIPOSANGUINEO = :TIPOSANGUINEO');
  vQryInsert.Sql.Add('                      , ACOMPANHANTE = :ACOMPANHANTE');
  vQryInsert.Sql.Add('                      , ENDERECO = :ENDERECO');
  vQryInsert.Sql.Add('                      , COMPLEMENTO = :COMPLEMENTO');
  vQryInsert.Sql.Add('                      , TELEFONE = :TELEFONE');
  vQryInsert.Sql.Add('                      , CELULAR = :CELULAR');
  vQryInsert.Sql.Add('                      , EMAIL = :EMAIL');
  vQryInsert.Sql.Add('                 WHERE ID = :ID ');

  vQryInsert.ParamByName('ID').AsInteger := strToInt(edtId.Text);
  vQryInsert.ParamByName('NOME').AsString  := edtPaciente.Text;
  vQryInsert.ParamByName('CPF').AsString := edtCPF.Text;
  vQryInsert.ParamByName('RG').AsString := edtRG.Text;
  vQryInsert.ParamByName('DATANASCIMENTO').AsDate := strToDate(edtDN.Text);
  vQryInsert.ParamByName('TIPOSANGUINEO').AsInteger := cbbTipoS.ItemIndex;
  vQryInsert.ParamByName('ACOMPANHANTE').AsString := edtAcompanhante.Text;
  vQryInsert.ParamByName('ENDERECO').AsString := edtEndereco.Text;
  vQryInsert.ParamByName('COMPLEMENTO').AsString := edtComplemento.Text ;
  vQryInsert.ParamByName('TELEFONE').AsString := edtTelefone.Text;
  vQryInsert.ParamByName('CELULAR').AsString := edtCelular.Text;
  vQryInsert.ParamByName('EMAIL').AsString := edtEmail.Text;

  try
    vQryInsert.ExecSQL;
    MessageBox(Handle,'Atualizado com sucesso','Sucesso', MB_ICONEXCLAMATION or MB_OK);
    Limpar;
  except
    MessageBox(Handle,'Erro ao Atualizar','Erro', MB_ICONERROR or MB_OK);
  end;

  FreeAndNil( vQryInsert );

end;
procedure TfrmAlterarCadastrado.Limpar;
begin
  edtId.Clear;
  edtPaciente.Clear;
  edtCPF.Clear;
  edtRG.Clear;
  edtDN.Clear;
  cbbTipoS.ItemIndex := 0;
  edtAcompanhante.Clear;
  edtEndereco.Clear;
  edtComplemento.Clear;
  edtTelefone.Clear;
  edtCelular.Clear;
  edtEmail.Clear;
  edtPaciente.SetFocus;
End;

procedure TfrmAlterarCadastrado.btnPesquisaPacienteClick(Sender: TObject);
var vQryConsulta: TSQLQuery;
begin
  if edtPaciente.Text = '' then
  begin
    ShowMessage('Insira o nome do paciente');
    Limpar;
  end
  else
  begin
    vQryConsulta := TSQLQuery.Create(Self);
    vQryConsulta.SQLConnection := aadm.dm.dbxDb;
    vQryConsulta.Close;

    vQryConsulta.Sql.Clear;
    vQryConsulta.Sql.Add('SELECT * ');
    vQryConsulta.Sql.Add('  FROM PACIENTES WHERE upper(NOME) CONTAINING(upper(:NOME))');
    vQryConsulta.ParamByName('NOME').AsString := Trim(edtPaciente.Text);
    vQryConsulta.Open;

    if Not(vQryConsulta.IsEmpty) then

    edtId.Text  := vQryConsulta.FieldByName('ID').AsString;
    edtPaciente.Text := vQryConsulta.FieldByName('Nome').AsString;
    edtDN.Text := vQryConsulta.FieldByName('DataNascimento').AsString;
    edtRG.Text := vQryConsulta.FieldByName('RG').AsString;
    edtCPF.Text  := vQryConsulta.FieldByName('CPF').AsString;
    edtAcompanhante.Text := vQryConsulta.FieldByName('Acompanhante').AsString;
    edtEndereco.Text := vQryConsulta.FieldByName('Endereco').AsString;
    edtComplemento.Text := vQryConsulta.FieldByName('Complemento').AsString;
    edtTelefone.Text := vQryConsulta.FieldByName('Telefone').AsString;
    edtCelular.Text := vQryConsulta.FieldByName('Celular').AsString;
    edtEmail.Text := vQryConsulta.FieldByName('Email').AsString;
    cbbTipoS.ItemIndex := vQryConsulta.FieldByName('TipoSanguineo').AsInteger;

    FreeAndNil( vQryConsulta );
  end;
end;

procedure TfrmAlterarCadastrado.btnAtualizarClick(Sender: TObject);
begin
  AtualizarPaciente;
  Limpar;
end;
procedure TfrmAlterarCadastrado.mSairClick(Sender: TObject);
begin
  close;
end;
end.
