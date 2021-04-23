Program HSProject;

uses
  Vcl.Forms,
  Login in 'Login.pas' {frmLogin},
  Principal in 'Principal.pas' {frmPrincipal},
  CadPaciente in 'CadPaciente.pas' {frmCadPaciente},
  aadm in 'DM\aadm.pas' {dm: TDataModule},
  NovoUsuario in 'NovoUsuario.pas' {frmNovoUsuario},
  Fichas in 'Fichas.pas' {frmFichas},
  AlterarCadastrado in 'AlterarCadastrado.pas' {frmAlterarCadastrado};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadPaciente, frmCadPaciente);
  Application.CreateForm(TfrmNovoUsuario, frmNovoUsuario);
  Application.CreateForm(TfrmFichas, frmFichas);
  Application.CreateForm(TfrmAlterarCadastrado, frmAlterarCadastrado);
  Application.Run;
end.
