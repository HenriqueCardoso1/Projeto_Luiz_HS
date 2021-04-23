unit Fichas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB, Datasnap.DBClient, Vcl.Grids,
   Vcl.DBGrids, Datasnap.Provider, Data.FMTBcd, Data.SqlExpr, Vcl.Menus;

type
  TfrmFichas = class(TForm)
    lbl1: TLabel;
    edtPesquisaPaciente: TEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    edtPesquisaCpf: TEdit;
    btnPesquisa: TBitBtn;
    lbl4: TLabel;
    grp1: TGroupBox;
    dbgrd1: TDBGrid;
    dsFichas: TDataSource;
    cdsFichas: TClientDataSet;
    cdsFichasNOME: TStringField;
    cdsFichasCPF: TStringField;
    cdsFichasRG: TStringField;
    cdsFichasSINTOMAS: TStringField;
    cdsFichasINFORMACOESADD: TStringField;
    cdsFichasMEDICACOES: TStringField;
    pm1: TPopupMenu;
    VisualizarCadastro1: TMenuItem;
    procedure btnPesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFichas: TfrmFichas;

implementation

uses aadm;

{$R *.dfm}

procedure TfrmFichas.btnPesquisaClick(Sender: TObject);
  procedure pesquisar;
  var vQryConsulta: TSQLQuery;
  begin
    vQryConsulta := TSQLQuery.Create(Self);
    vQryConsulta.SQLConnection := aadm.dm.dbxDb;
    vQryConsulta.Close;

    vQryConsulta.Sql.Clear;
    vQryConsulta.Sql.Add('SELECT * ');
    vQryConsulta.Sql.Add('  FROM PACIENTES ');
    vQryConsulta.Sql.Add(' WHERE 1 = 1');

    if Trim(edtPesquisaPaciente.Text)<> '' then
    begin
      vQryConsulta.Sql.Add('   AND upper(NOME) CONTAINING(upper(:NOME))');
      vQryConsulta.ParamByName('NOME').AsString := Trim(edtPesquisaPaciente.Text);
    end;

    if Trim(edtPesquisaCpf.Text) <> '' then
    begin
      vQryConsulta.Sql.Add('   AND CPF = :CPF');
      vQryConsulta.ParamByName('CPF' ).AsString := Trim(edtPesquisaCpf.Text);
    end;

    vQryConsulta.Open;
    cdsFichas.EmptyDataSet;

    vQryConsulta.First;
    while NOT (vQryConsulta.Eof) do
    begin
      cdsFichas.Insert;
      cdsFichasNOME.AsString := vQryConsulta.FieldByName('Nome').AsString;
      cdsFichasCPF.AsString := vQryConsulta.FieldByName('CPF').AsString;
      cdsFichasRG.AsString := vQryConsulta.FieldByName('RG').AsString;
      cdsFichasSINTOMAS.AsString := vQryConsulta.FieldByName('Sintomas').AsString;
      cdsFichasINFORMACOESADD.AsString := vQryConsulta.FieldByName('IA').AsString;
      cdsFichasMEDICACOES.AsString := vQryConsulta.FieldByName('PM').AsString;
      cdsFichas.Post;
      vQryConsulta.Next;
    end;
    FreeAndNil( vQryConsulta );
  end;

begin
  Pesquisar;
end;
end.
