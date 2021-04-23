unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

type
  TfrmPrincipal = class(TForm)
    mmMenu1: TMainMenu;
    NovoPaciente1: TMenuItem;
    AlterarCadastrado: TMenuItem;
    Sair: TMenuItem;
    mnFichas: TMenuItem;
    procedure NovoPaciente1Click(Sender: TObject);
    procedure SairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);    
    procedure AlterarCadastradoClick(Sender: TObject);
    procedure mnFichasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses CadPaciente,
     AlterarCadastrado,
     Fichas;

{$R *.dfm}

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  frmPrincipal.WindowState := wsMaximized;
  frmPrincipal.Refresh;
end;

procedure TfrmPrincipal.mnFichasClick(Sender: TObject);
begin
  TfrmFichas.Create(Application);
  frmFichas.ShowModal;
end;

procedure TfrmPrincipal.AlterarCadastradoClick(Sender: TObject);
begin
  TfrmAlterarCadastrado.Create(Application);
  frmAlterarCadastrado.ShowModal;
end;

procedure TfrmPrincipal.NovoPaciente1Click(Sender: TObject);
begin
  TfrmCadPaciente.Create(Application);
  frmCadPaciente.ShowModal;
end;


procedure TfrmPrincipal.SairClick(Sender: TObject);
begin
  Application.terminate;
end;

end.
