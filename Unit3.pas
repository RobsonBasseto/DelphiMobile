unit Unit3;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, IOUtils;

type
  Tdm = class(TDataModule)
    FDConnection1: TFDConnection;
    FDQueryPessoa: TFDQuery;
    FDQueryProduto: TFDQuery;
    FDQueryProdutoid: TFDAutoIncField;
    FDQueryProdutonome: TStringField;
    FDQueryProdutodescricao: TStringField;
    FDQueryProdutovalor: TBCDField;
    FDQueryProdutoquantidade: TIntegerField;
    FDQueryProdutoimg_produto: TBlobField;
    FDQueryPessoaid: TFDAutoIncField;
    FDQueryPessoanome: TStringField;
    FDQueryPessoacpf: TStringField;
    FDQueryPessoacelular: TStringField;
    FDQueryPessoaendereco: TStringField;
    FDQueryPessoacidade: TStringField;
    FDQueryPessoauf: TStringField;
    FDQueryPessoabairro: TStringField;
    FDQueryPessoaemail: TStringField;
    FDQueryPessoasenha: TStringField;
    FDQueryPessoaimg_usuario: TBlobField;
    procedure FDConnection1BeforeConnect(Sender: TObject);
    procedure FDConnection1AfterConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure Tdm.FDConnection1AfterConnect(Sender: TObject);
var
  strSQL: string;
begin
  strSQL:= 'create table IF NOT EXISTS pessoa( '+
  'id integer not null primary key autoincrement,'+
  'nome varchar(40),'+
  'cpf varchar(11),'  +
  'celular varchar(13),'+
  'endereco varchar(60),'+
  'cidade varchar(60),'+
  'uf char(2),'+
  'bairro varchar(60),'+
  'email varchar(60),'+
  'senha varchar(40),'+
  'img_usuario blob)';

  FDConnection1.ExecSQL(strSQL);

  strSQL := EmptyStr;
  strSQL := 'create table IF NOT EXISTS produto('+
  'id integer not null primary key autoincrement,'+
  'nome varchar(20),'+
  'descricao varchar(200),'+
  'valor numeric(14,2),'+
  'quantidade integer,'+
  'img_produto blob)';
  FDConnection1.ExecSQL(strSQL);

  FDQueryPessoa.Active:=true;
  FDQueryProduto.Active:=true;
end;

procedure Tdm.FDConnection1BeforeConnect(Sender: TObject);
var
strPath: string;
begin
  {$IF DEFINED(iOS) or DEFINED(ANDROID)}
       strPath:= System.IOUtils.Tpath.Combine(System.IOUtils.TPath.GetDocumentPath,
       'Banco.bd');
  {$ENDIF}
  {$IFDEF MSWINDOWS}
      strPath := System.IOUtils.Tpath.Combine('D:\Users\rrobasseto\Desktop\Mobile\BD','banco.db');
  {$ENDIF}
       FDconnection1.Params.Values['UseUnicode'] :='False';
       FDconnection1.Params.Values['DATABASE'] :=strPath;

end;
end.
