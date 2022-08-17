program Project1;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {FrmCadastro},
  Unit2 in 'Unit2.pas' {FrmCadastroCompleto},
  Unit3 in 'Unit3.pas' {dm: TDataModule},
  Unit4 in 'Unit4.pas' {FrmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmCadastro, FrmCadastro);
  Application.CreateForm(TFrmCadastroCompleto, FrmCadastroCompleto);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
