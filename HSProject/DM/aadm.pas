unit aadm;

interface

uses
  SysUtils, Classes, DB, SqlExpr, IBScript, LbCipher, LbClass,
  IBSQL, IBDatabase, IBCustomDataSet, IBTable,
  Windows, Messages, Variants, Graphics, Controls, Forms,
  Dialogs, ImgList, Mask, ExtCtrls, DBCtrls, StdCtrls,
  Buttons, Grids, DBGrids, ComCtrls, ToolWin, DBClient, ibQuery,
  IBServices, inifiles, DateUtils, IBDatabaseInfo,
  shellApi,
  OverbyteIcsWndControl, OverbyteIcsHttpProt,  Data.DBXFirebird,
  DbxDevartInterBase, DbxDevartMySql, Data.DBXDataSnap, IPPeerClient, Data.DBXCommon, Datasnap.DSConnect;

type
  Tdm = class(TDataModule)
    cripto: TLbBlowfish;
    dbxDb: TSQLConnection;
    procedure DataModuleCreate(Sender: TObject);

    procedure ExecScript(scrp: TIBScript);
    procedure dbxDBBeforeConnect(Sender: TObject);

  private
    function LeConfIni(var vpHost, vpBanco, vpSenha: string; var isSQLServer: Boolean; var vpCep: string): Boolean;
    function ConectaBancoDBX(var banco: TSQLConnection): Boolean;
    procedure setapropriedadesFireCrLabs(dbxDB: TSQLConnection; pHost, pBanco, pSenha: string);

  public

  end;

var
  dm: Tdm;
  jaSetouBD: Boolean = false; // para o before conect saber se está lá porque tinha q estar mesmo, ou foi por causa de BD gravado aberto
  vCont: integer; // usado para contar as tentativas de conexão
  vsenhaib: string; // usado para guardar a senha correta do interbase..
  vtipoerro: string; // usado para guardar qual tipo de erro ocorreu com o sistema...

implementation

uses funcoes;

{$R *.dfm}


function Tdm.LeConfIni(var vpHost: string; var vpBanco: string; var vpSenha: string; var isSQLServer: Boolean;
  var vpCep: string): Boolean;
var
  inibd: tinifile;
  cripto: TLbBlowfish;
begin

  inibd := tinifile.create(ExtractFilePath(Application.ExeName) + 'conf.ini');
  cripto := TLbBlowfish.create(nil);

  isSQLServer := false;

  // Guarda alguns valores do INI para uso no DBX
  vpHost := inibd.ReadString('dados', 'host', '');
  vpBanco := inibd.ReadString('dados', 'caminho', '');
  vpSenha := cripto.DecryptString(inibd.ReadString('dados', 'senha', ''));
  vpCep := inibd.ReadString('dados', 'caminhoCEP', '');

  cripto.Free;
  inibd.Free;
end;

procedure Tdm.DataModuleCreate(Sender: TObject);
var
  inibd: TIniFile;
  vpHost, vpBanco, vpSenha, vpCEP: string;
  vhostRemotoRemot, vBdremotoRemot, VsenhaRemotaRemot: string;
  isSQLServer: Boolean;
begin
  if not(FileExists(ExtractFilePath(Application.ExeName) + 'conf.ini')) then
  begin
    ShowMessage('Não foi encontrado conf.ini!');
    exitprocess(0);
  end;
  LeConfIni(vpHost, vpBanco, vpSenha, isSQLServer, vpCEP);
  jaSetouBD := true;
  if not ConectaBancoDBX(dbxDB) then
  begin
    MessageDlg('Erro ao se conectar ao banco DBX !', mtError, [mbOK], 0);
    exitprocess(0);
  end;

end;

function Tdm.ConectaBancoDBX(var banco: TSQLConnection): Boolean;
var
  vpHost, vpBanco, vpSenha, vpCep: string;
  isSQLServer: Boolean;
begin

  LeConfIni(vpHost, vpBanco, vpSenha, isSQLServer, vpCep);

  setapropriedadesFireCrLabs(banco, vpHost, vpBanco, vpSenha);
  banco.Tag := 1;

  try
    banco.Open;
    result := True;
  except
    on e: Exception do
      ShowMessage(e.Message);
  end;
end;

procedure Tdm.setapropriedadesFireCrLabs(dbxDB: TSQLConnection; pHost, pBanco, pSenha: string);
begin
  dbxDB.ConnectionName := 'Devart InterBase';
  DBXdB.DriverName := 'DevartInterBase';
  dbxDB.LoginPrompt := false;
  dbxDB.Params.Clear;
  dbxDB.Params.Add('DriverName=DevartInterBase');
  dbxDB.Params.Add('DataBase=' + pHost + ':' + pBanco);
  dbxDB.Params.Add('RoleName=');
  dbxDB.Params.Add('User_Name=SYSDBA');
  dbxDB.Params.Add('Password=' + pSenha);
  dbxDB.Params.Add('SQLDialect=3');
  dbxDB.Params.Add('BlobSize=-1');
  dbxDB.Params.Add('LocaleCode=0000');
  dbxDB.Params.Add('UseUnicode=false');

end;

procedure Tdm.ExecScript(scrp: TIBScript);
begin
  scrp.Script.Text := Upper(scrp.Script.Text);
  scrp.ExecuteScript;
end;

procedure Tdm.dbxDBBeforeConnect(Sender: TObject);
var
  vpHost, vpBanco, vpSenha, vpCEP: string;
  isSQLServer: Boolean;
begin
  if not jaSetouBD then
  begin
    LeConfIni(vpHost, vpBanco, vpSenha, isSQLServer, vpCEP);
    setapropriedadesFireCrLabs(dm.dbxDB, vpHost, vpBanco, vpSenha);
  end;
end;

end.
