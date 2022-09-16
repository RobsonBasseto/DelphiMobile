program Project1;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {FrmCadastro},
  Unit2 in 'Unit2.pas' {FrmLogin},
  Unit3 in 'Unit3.pas' {dm: TDataModule},
  Unit4 in 'Unit4.pas' {FrmPrincipal},
  Unit5 in 'Unit5.pas' {FrmLista};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmCadastro, FrmCadastro);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmLista, FrmLista);
  Application.Run;
end.
