unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.Objects, idHashSHA;

type
  TFrmCadastro = class(TForm)
    LayoutCentral: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Edit1: TEdit;
    Image2: TImage;
    Button1: TButton;
    Image3: TImage;
    Image1: TImage;
    ToolBarSuperior: TToolBar;
    LayoutInferior: TLayout;
    LayoutIcon: TLayout;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function SHA1(AString:string):string;
  end;

var
  FrmCadastro: TFrmCadastro;

implementation

{$R *.fmx}

uses Unit3, Unit2, Unit4;


procedure TFrmCadastro.Button1Click(Sender: TObject);
begin
  dm.FDQueryPessoa.Close;
  dm.FDQueryPessoa.Open();

  if(Edit1.text = EmptyStr) or(Edit2.text = EmptyStr) then
  Abort;

  dm.FDQueryPessoa.Append;
  dm.FDQueryPessoaEmail.AsString:= Edit1.Text;
  dm.FDQueryPessoaSenha.AsString:= SHA1(Edit2.text);
  dm.FDQueryPessoa.Post;
  dm.FDConnection1.CommitRetaining;

  FrmLogin.Show();
  FrmCadastro.Hide();
  end;

function TFrmCadastro.SHA1(AString: string): string;
var
SenhaSH1: TIDhASHsha1;
begin
SenhaSH1 := TIDhASHsha1.Create;
  TRY
    Result:= SenhaSH1.HashStringAsHex(AString);
  FINALLY
    SenhaSH1.Free;
  END;
end;

end.
