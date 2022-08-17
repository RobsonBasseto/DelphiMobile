unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Actions,
  FMX.ActnList, FMX.Layouts, FMX.ExtCtrls, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Objects, FMX.Edit;

type
  TFrmCadastroCompleto = class(TForm)
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
    Button2: TButton;
    Button3: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroCompleto: TFrmCadastroCompleto;

implementation

{$R *.fmx}

end.
