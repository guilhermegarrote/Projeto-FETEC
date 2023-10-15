program PFetec;

uses
  System.StartUpCopy,
  FMX.Forms,
  UMenu in 'UMenu.pas' {FrmMenu},
  UQuestions in 'UQuestions.pas' {FrmQuestions},
  UResult in 'UResult.pas' {FrmResult};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMenu, FrmMenu);
  Application.CreateForm(TFrmQuestions, FrmQuestions);
  Application.CreateForm(TFrmResult, FrmResult);
  Application.Run;
end.
