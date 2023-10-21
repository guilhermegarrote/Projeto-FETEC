program PFetec;

uses
  System.StartUpCopy,
  FMX.Forms,
  UMenu in 'UMenu.pas' {FrmMenu},
  UQuestions in 'UQuestions.pas' {FrmQuestions},
  UResult1 in 'UResult1.pas' {FrmResult1},
  UResult2 in 'UResult2.pas' {FrmResult2},
  UResult3 in 'UResult3.pas' {FrmResult3},
  UResult4 in 'UResult4.pas' {FrmResult4};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMenu, FrmMenu);
  Application.CreateForm(TFrmQuestions, FrmQuestions);
  Application.CreateForm(TFrmResult1, FrmResult1);
  Application.CreateForm(TFrmResult2, FrmResult2);
  Application.CreateForm(TFrmResult3, FrmResult3);
  Application.CreateForm(TFrmResult4, FrmResult4);
  Application.Run;
end.
