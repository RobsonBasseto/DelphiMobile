unit UCadastro;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.Objects, idHashSHA,
  FMX.TabControl, System.Actions, FMX.ActnList;

type
  TFrmCadastro = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    Image1: TImage;
    TabItem2: TTabItem;
    LayoutCentral: TLayout;
    Label2: TLabel;
    Label3: TLabel;
    editSenhaCadastro: TEdit;
    editUsuarioCadastro: TEdit;
    Image2: TImage;
    BtnCadastro: TButton;
    ToolBarSuperior: TToolBar;
    Label1: TLabel;
    LayoutIcon: TLayout;
    Image4: TImage;
    TabItem3: TTabItem;
    ToolBar1: TToolBar;
    Label4: TLabel;
    Layout2: TLayout;
    Image5: TImage;
    Layout3: TLayout;
    Label5: TLabel;
    Label6: TLabel;
    editSenhaLogin: TEdit;
    editUsuarioLogin: TEdit;
    Image6: TImage;
    BtnLogin: TButton;
    Layout1: TLayout;
    LabelPular: TLabel;
    Image8: TImage;
    ActionList1: TActionList;
    ChangeTabAction1: TChangeTabAction;
    ChangeTabAction2: TChangeTabAction;
    ChangeTabAction3: TChangeTabAction;
    Layout4: TLayout;
    Image_exibir: TImage;
    Image_esconder: TImage;
    Layout5: TLayout;
    ImageEsconder: TImage;
    ImageExibir: TImage;
    procedure Image8Click(Sender: TObject);
    procedure LabelPularClick(Sender: TObject);
    procedure BtnCadastroClick(Sender: TObject);
    procedure BtnLoginClick(Sender: TObject);
    procedure Image_esconderClick(Sender: TObject);
    procedure Image_exibirClick(Sender: TObject);
    procedure ImageEsconderClick(Sender: TObject);
    procedure ImageExibirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function SHA1(AString: string): string;
  end;

var
  FrmCadastro: TFrmCadastro;

implementation

{$R *.fmx}

uses UDM, Unit4, UPrincipal;

procedure TFrmCadastro.BtnCadastroClick(Sender: TObject);
var
  senha: string;
begin
  dm.FDQueryPessoa.Close;
  dm.FDQueryPessoa.Open();

  if (editUsuarioCadastro.text = EmptyStr) or (editSenhaCadastro.text = EmptyStr)
  then
    Abort;

  dm.FDQueryPessoa.Append;
  dm.FDQueryPessoaEmail.AsString := editUsuarioCadastro.text;
  dm.FDQueryPessoaSenha.AsString := SHA1(editSenhaCadastro.text);
  dm.FDQueryPessoa.Post;
  dm.FDConnection1.CommitRetaining;

  ChangeTabAction3.Execute;
end;

procedure TFrmCadastro.BtnLoginClick(Sender: TObject);
var
  senha: String;
begin
  senha := SHA1(editSenhaLogin.text);
  dm.FDQueryPessoa.Close;
  dm.FDQueryPessoa.ParamByName('pnome').AsString := editUsuarioLogin.text;
  dm.FDQueryPessoa.Open();

  if not(dm.FDQueryPessoa.IsEmpty) and (dm.FDQueryPessoaSenha.AsString = senha)
  then
  begin
    if not Assigned(FrmPrincipal) then
      Application.CreateForm(TFrmPrincipal, FrmPrincipal);
    FrmPrincipal.Show;
  end
  else
  begin
    ShowMessage('Login ou senha incorretos');
  end;
end;

procedure TFrmCadastro.ImageEsconderClick(Sender: TObject);
begin
  ImageEsconder.Visible := false;
  ImageExibir.Visible := True;
  editSenhaLogin.Password := false;
end;

procedure TFrmCadastro.ImageExibirClick(Sender: TObject);
begin
  ImageEsconder.Visible := True;
  ImageExibir.Visible := false;
  editSenhaLogin.Password := True;
end;

procedure TFrmCadastro.Image8Click(Sender: TObject);
begin
  case TabControl1.TabIndex of
    0:
      ChangeTabAction2.Execute;
    1:
      ChangeTabAction3.Execute;

  end;
end;

procedure TFrmCadastro.Image_esconderClick(Sender: TObject);
begin
  Image_esconder.Visible := false;
  Image_exibir.Visible := True;
  editSenhaCadastro.Password := false;
end;

procedure TFrmCadastro.Image_exibirClick(Sender: TObject);
begin
  Image_esconder.Visible := True;
  Image_exibir.Visible := false;
  editSenhaCadastro.Password := True;
end;

procedure TFrmCadastro.LabelPularClick(Sender: TObject);
begin
  ChangeTabAction3.Execute;
end;

function TFrmCadastro.SHA1(AString: string): string;
var
  SenhaSH1: TIDhASHsha1;
begin
  SenhaSH1 := TIDhASHsha1.Create;
  TRY
    Result := SenhaSH1.HashStringAsHex(AString);
  FINALLY
    SenhaSH1.Free;
  END;
end;

end.
