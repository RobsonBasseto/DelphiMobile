program Project1;

uses
  System.StartUpCopy,
  FMX.Forms,
  UCadastro in 'UCadastro.pas' {FrmCadastro},
  UDM in 'UDM.pas' {dm: TDataModule},
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmCadastro, FrmCadastro);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
