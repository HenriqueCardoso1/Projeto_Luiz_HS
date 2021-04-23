unit CadPaciente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Menus, Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TfrmCadPaciente = class(TForm)
    mm1: TMainMenu;
    N: TMenuItem;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    edtPaciente: TEdit;
    edtDN: TEdit;
    edtCPF: TEdit;
    edtRG: TEdit;
    edtAcompanhante: TEdit;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    edtEndereco: TEdit;
    edtComplemento: TEdit;
    edtTelefone: TEdit;
    edtCelular: TEdit;
    edtEmail: TEdit;
    mmoSintomas: TMemo;
    lbl13: TLabel;
    edtId: TEdit;
    btnExcluir: TBitBtn;
    btnGravar: TBitBtn;
    cbbTipoS: TComboBox;
    procedure NClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    procedure Proximo_Id ;
    procedure GravaPaciente;
    procedure Limpar;

  public

  end;

var
  frmCadPaciente: TfrmCadPaciente;

implementation

uses SqlExpr, aadm;
{$R *.dfm}

procedure TfrmCadPaciente.btnExcluirClick(Sender: TObject);
begin
 Limpar;
 ShowMessage('Cadastro Cancelado');
end;

procedure TfrmCadPaciente.btnGravarClick(Sender: TObject);
begin
  GravaPaciente;
end;

procedure TfrmCadPaciente.Limpar;
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
  mmoSintomas.Clear;
  Proximo_Id;
  edtPaciente.SetFocus;
end;


procedure TfrmCadPaciente.GravaPaciente;
var vQryInsert: TSQLQuery;
begin
  vQryInsert := TSQLQuery.Create(Self);
  vQryInsert.SQLConnection := aadm.dm.dbxDb;
  vQryInsert.Close;

  vQryInsert.Sql.Clear;
  vQryInsert.Sql.Add('insert into Pacientes ( ID ');
  vQryInsert.Sql.Add('                      , NOME');
  vQryInsert.Sql.Add('                      , CPF');
  vQryInsert.Sql.Add('                      , RG');
  vQryInsert.Sql.Add('                      , DATANASCIMENTO');
  vQryInsert.Sql.Add('                      , TIPOSANGUINEO');
  vQryInsert.Sql.Add('                      , ACOMPANHANTE');
  vQryInsert.Sql.Add('                      , ENDERECO');
  vQryInsert.Sql.Add('                      , COMPLEMENTO');
  vQryInsert.Sql.Add('                      , TELEFONE');
  vQryInsert.Sql.Add('                      , CELULAR');
  vQryInsert.Sql.Add('                      , EMAIL');
  vQryInsert.Sql.Add('                      , SINTOMAS)');
  vQryInsert.Sql.Add('                      Values ');
  vQryInsert.Sql.Add('                      ( :ID ');
  vQryInsert.Sql.Add('                      , :NOME');
  vQryInsert.Sql.Add('                      , :CPF ');
  vQryInsert.Sql.Add('                      , :RG ');
  vQryInsert.Sql.Add('                      , :DATANASCIMENTO');
  vQryInsert.Sql.Add('                      , :TIPOSANGUINEO');
  vQryInsert.Sql.Add('                      , :ACOMPANHANTE');
  vQryInsert.Sql.Add('                      , :ENDERECO');
  vQryInsert.Sql.Add('                      , :COMPLEMENTO');
  vQryInsert.Sql.Add('                      , :TELEFONE');
  vQryInsert.Sql.Add('                      , :CELULAR');
  vQryInsert.Sql.Add('                      , :EMAIL');
  vQryInsert.Sql.Add('                      , :SINTOMAS)');

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
  vQryInsert.ParamByName('SINTOMAS').AsString:= mmoSintomas.Lines.Text;

  try
    vQryInsert.ExecSQL;
    MessageBox(Handle,'Gravado com sucesso','Sucesso', MB_ICONEXCLAMATION or MB_OK);
    Limpar;
  except
    MessageBox(Handle,'Erro ao Gravar','Erro', MB_ICONERROR or MB_OK);
  end;

  FreeAndNil( vQryInsert );
End;

procedure TfrmCadPaciente.FormShow(Sender: TObject);
begin
  Proximo_Id;
end;

procedure TfrmCadPaciente.NClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadPaciente.Proximo_Id ;
var vQry: TSQLQuery;
begin
  vQry := TSQLQuery.Create(Self);
  vQry.SQLConnection := aadm.dm.dbxDb;
  vQry.Close;

  vQry.Sql.Clear;
  vQry.Sql.Add('SELECT COALESCE(max(id),0) + 1 AS Proximo_Id ');
  vQry.Sql.Add('  FROM Pacientes ');

  vQry.Open;

  if Not(vQry.IsEmpty) then
    edtId.Text := vQry.FieldByName('Proximo_Id').AsString;

  FreeAndNil( vQry );
End;

end.
