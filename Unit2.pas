unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Actions,
  FMX.ActnList, FMX.Layouts, FMX.ExtCtrls, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Objects, FMX.Edit, idHashSHA;

type
  TFrmLogin = class(TForm)
    ToolBarSuperior: TToolBar;
    Label1: TLabel;
    LayoutIcon: TLayout;
    Image1: TImage;
    LayoutInferior: TLayout;
    LayoutCentral: TLayout;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Edit1: TEdit;
    Image2: TImage;
    Button1: TButton;
    Image3: TImage;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function SHA1(AString:string):string;
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.fmx}
uses Unit3, Unit4, Unit5;

procedure TFrmLogin.Button1Click(Sender: TObject);
var
senha:String;
begin
  senha := SHA1(Edit2.Text);
  if(Edit1.Text = dm.FDQueryPessoaEmail.AsString) and
  (Edit2.Text = dm.FDQueryPessoaSenha.AsString)then
  begin
    if not Assigned(FrmLista) then
    Application.CreateForm(TFrmLista, FrmLista);
    FrmLista.Show;
  end
  else
  begin
    ShowMessage('Login ou senha incorretos');
  end;
end;

function TFrmLogin.SHA1(AString: string): string;
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
