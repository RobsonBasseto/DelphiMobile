unit Unit5;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.MultiView,
  FMX.StdCtrls, FMX.Controls.Presentation;

type
  TFrmLista = class(TForm)
    ToolBar1: TToolBar;
    Button1: TButton;
    MultiView1: TMultiView;
    Button2: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLista: TFrmLista;

implementation

{$R *.fmx}

end.
