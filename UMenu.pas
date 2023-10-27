unit UMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.ExtCtrls;

type
  TFrmMenu = class(TForm)
    LayoutMain: TLayout;
    LayoutMid: TLayout;
    Layout1: TLayout;
    Layout2: TLayout;
    W: TImage;
    Image3: TImage;
    Layout3: TLayout;
    Image2: TImage;
    Layout4: TLayout;
    Image4: TImage;
    LayoutGroup: TLayout;
    Line1: TLayout;
    Layout6: TLayout;
    FndSaude: TImage;
    TextSaude: TImage;
    SaudeApertado: TImage;
    TextSaudeApertado: TImage;
    BtnSaude: TButton;
    Layout7: TLayout;
    FndEducacao: TImage;
    TextEducacao: TImage;
    EducacaoApertado: TImage;
    TextEducacaoApertado: TImage;
    BtnEducacao: TButton;
    Line2: TLayout;
    Layout8: TLayout;
    FundoMeioAmbiente: TImage;
    TextMeioAmbiente: TImage;
    BtnMeioAmbiente: TButton;
    MeioAmbienteApertado: TImage;
    TextMeioAmbienteApertado: TImage;
    LayoutSociedade: TLayout;
    FundoSociedade: TImage;
    TextSociedade: TImage;
    SociedadeApertado: TImage;
    TextSocidadeAperto: TImage;
    BtnSociedade: TButton;
    Layout5: TLayout;
    Image7: TImage;
    Image8: TImage;
    BtnJogar: TSpeedButton;
    LblAlert: TLabel;
    LayoutLogo: TLayout;
    Image1: TImage;
    procedure InicializarMatrizes;
    procedure BtnSaudeClick(Sender: TObject);
    procedure BtnEducacaoClick(Sender: TObject);
    procedure BtnMeioAmbienteClick(Sender: TObject);
    procedure BtnSociedadeClick(Sender: TObject);
    procedure BtnJogarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
  public
    perguntas: array of array of string;
    respostas: array of array of string;
    coluna: integer;
  end;

var
  FrmMenu: TFrmMenu;

implementation

{$R *.fmx}

uses UQuestions;

procedure TFrmMenu.InicializarMatrizes;
begin
  // Inicializar a matriz de perguntas (4 linhas e 4 colunas)
  SetLength(perguntas, 4, 4);

  // Preencher a matriz de perguntas com strings de exemplo
  perguntas[0, 0] := 'Para voc�, qual o papel da educa��o na forma��o e evolu��o de um indiv�duo?';
  perguntas[0, 1] := 'Qual � sua opini�o sobre a acessibilidade � educa��o de qualidade para todos, n�o importando a situa��o de vida das pessoas (classes sociais)?';
  perguntas[0, 2] := 'Como voc� v� o papel das tecnologias educacionais avan�adas no processo de aprendizagem?';
  perguntas[0, 3] := 'Como voc� avalia a import�ncia de estar sempre estudando ao longo da vida?';

  perguntas[1, 0] := 'Voc� acredita que a pr�tica regular de atividades f�sicas � importante para a sa�de?';
  perguntas[1, 1] := 'Voc� concorda que uma boa noite de sono e a pr�tica de t�cnicas de relaxamento, como a medita��o, contribuem para o seu bem-estar?';
  perguntas[1, 2] := 'Voc� acha necess�rio realizar check-ups m�dicos regularmente, mesmo quando n�o est� doente? ';
  perguntas[1, 3] := 'Voc� acredita que equilibrar o tempo entre trabalho e vida pessoal, bem como manter relacionamentos saud�veis, � crucial para uma vida plena e saud�vel?';

  perguntas[2, 0] := 'Para voc�, qual a import�ncia da redu��o do uso de pl�stico no seu dia a dia?';
  perguntas[2, 1] := 'Como voc� avalia o seu consumo de energia em casa?';
  perguntas[2, 2] := 'Qual � sua opini�o sobre o desmatamento para evoluir no desenvolvimento econ�mico?';
  perguntas[2, 3] := 'Qual o n�vel de import�ncia em conservar as �reas verdes urbanas em sua comunidade?';

  perguntas[3, 0] := 'Voc� acredita que a internet facilita a comunica��o entre as pessoas e fortalece os la�os sociais?';
  perguntas[3, 1] := 'Voc� concorda que a internet � uma ferramenta poderosa para disseminar informa��es e conscientizar as pessoas sobre quest�es importantes?';
  perguntas[3, 2] := 'Voc� acha que a internet contribui para o aumento da polariza��o e dos conflitos na sociedade?';
  perguntas[3, 3] := 'Voc� concorda que a internet deve ser regulamentada para proteger a sociedade contra amea�as online, como desinforma��o e cyberbullying?';

  // Inicializar a matriz de respostas (16 linhas e 4 colunas)
  SetLength(respostas, 4, 16);

  // Preencher a matriz de respostas com strings de exemplo
  respostas[0, 0] := 'Acredito que a educa��o desempenha um papel crucial no desenvolvimento e evolu��o global de uma pessoa.';
  respostas[0, 1] := 'Reconhe�o sua import�ncia, mas �s vezes priorizo outras habilidades pr�ticas ao inv�s da educa��o formal.';
  respostas[0, 2] := 'Apoio a educa��o, desde que esteja alinhada com as necessidades pr�ticas da vida de cada um.';
  respostas[0, 3] := 'N�o vejo a educa��o como essencial para o desenvolvimento individual.';
  respostas[0, 4] := 'Defendo totalmente a ideia de que todos devem ter acesso igualit�rio � educa��o de qualidade.';
  respostas[0, 5] := 'Concordo com a import�ncia, mas reconhe�o que h� desafios pr�ticos na implementa��o.';
  respostas[0, 6] := 'Apoio, desde que haja esfor�os para melhorar a qualidade da educa��o em todos os n�veis.';
  respostas[0, 7] := 'N�o considero a acessibilidade � educa��o um problema significativo no mundo atualmente.';
  respostas[0, 8] := 'Acredito que as tecnologias educacionais s�o ferramentas valiosas para melhorar o ensino e aprendizado.';
  respostas[0, 9] := 'Reconhe�o sua utilidade, mas acredito que a abordagem tradicional ainda � mais eficaz.';
  respostas[0, 10] := 'Apoio, desde que as tecnologias sejam usadas de maneira equilibrada com m�todos tradicionais.';
  respostas[0, 11] := 'N�o vejo a necessidade ou benef�cios significativos nas tecnologias educacionais.';
  respostas[0, 12] := 'Acredito que a aprendizagem ao longo da vida � essencial para se manter atualizado e crescer como pessoa.';
  respostas[0, 13] := 'Reconhe�o sua import�ncia, mas acho dif�cil dedicar tempo regularmente � educa��o cont�nua.';
  respostas[0, 14] := 'Apoio, desde que haja flexibilidade e op��es adequadas para a educa��o cont�nua.';
  respostas[0, 15] := 'N�o vejo muito valor na busca constante por conhecimento ao�longo�da�vida.';

  respostas[1, 0] := 'Sim, praticar exerc�cios regularmente � crucial, fortalece o corpo, melhora o humor e reduz o estresse para uma vida mais saud�vel. ';
  respostas[1, 1] := 'Sim, cuidar da alimenta��o � vital. Uma dieta equilibrada fornece nutrientes, prevenindo doen�as e promovendo o bem-estar.';
  respostas[1, 2] := 'N�o acho necess�rio se preocupar com exerc�cios. O importante � aproveitar a vida, sem se preocupar com atividades f�sicas.';
  respostas[1, 3] := 'N�o vejo como a alimenta��o est� relacionada � sa�de. Comer o que gosto me faz feliz, e isso � o que importa.';
  respostas[1, 4] := 'Sim, ter um sono adequado promove sa�de e bem-estar atrav�s da recupera��o f�sica e mental durante a noite.';
  respostas[1, 5] := 'Sim, � crucial reservar tempo para relaxar. A medita��o por exemplo melhora a sa�de mental e promove equil�brio emocional.';
  respostas[1, 6] := 'N�o vejo a necessidade de dormir tanto. Prefiro aproveitar a noite com atividades divertidas.';
  respostas[1, 7] := 'N�o acredito em m�todos como a medita��o. N�o vejo como sentar-se quieto pode fazer diferen�a na sa�de.';
  respostas[1, 8] := 'Sim, check-ups regulares detectam problemas de sa�de precocemente, permitindo tratamentos eficazes para uma vida mais saud�vel.';
  respostas[1, 9] := 'Sim, preven��o � crucial. Vacina��o e h�bitos saud�veis evitam doen�as, melhorando a qualidade de vida.';
  respostas[1, 10] := 'N�o vejo por que deveria ir ao m�dico se n�o estou doente. Isso s� faz sentido quando h� problemas.';
  respostas[1, 11] := 'N�o confio muito na medicina preventiva. Acho que o corpo se cura naturalmente. ';
  respostas[1, 12] := 'Sim, relacionamentos saud�veis s�o cruciais para o bem-estar emocional. Apoio social ajuda a lidar com o estresse, promovendo felicidade.';
  respostas[1, 13] := 'Sim, equilibrar trabalho e vida pessoal � essencial. O excesso de trabalho pode causar esgotamento, afetando a sa�de f�sica e mental.';
  respostas[1, 14] := 'N�o vejo como os relacionamentos podem influenciar a sa�de. Cada um deve cuidar de si mesmo.';
  respostas[1, 15] := 'N�o vejo problemas em dedicar a maior parte do tempo ao trabalho. Isso � o que traz realiza��o.';

  respostas[2, 0] := 'Reconhe�o e pratico ativamente a redu��o para diminuir a polui��o.';
  respostas[2, 1] := 'Entendo a necessidade, mas �s vezes escolho a conveni�ncia do pl�stico.';
  respostas[2, 2] := 'Apoio a redu��o, desde que haja alternativas sustent�veis dispon�veis.';
  respostas[2, 3] := 'N�o vejo a necessidade de mudar meus h�bitos em rela��o ao pl�stico.';
  respostas[2, 4] := 'Adoto medidas consistentes para reduzir meu consumo de energia.';
  respostas[2, 5] := 'Fa�o alguns esfor�os, mas �s vezes priorizo conveni�ncia sobre efici�ncia energ�tica.';
  respostas[2, 6] := 'Apoio a ideia, desde que n�o comprometa muito meu conforto.';
  respostas[2, 7] := 'N�o presto muita aten��o ao meu consumo de energia.';
  respostas[2, 8] := 'Discordo totalmente, priorizando a preserva��o ambiental sobre o desenvolvimento.';
  respostas[2, 9] := 'Tenho reservas e acredito que deve haver um equil�brio entre desenvolvimento e preserva��o.';
  respostas[2, 10] := 'Concordo com o desenvolvimento, desde que haja esfor�os para replantar �reas desmatadas.';
  respostas[2, 11] := 'Concordo, considerando o desenvolvimento econ�mico mais importante que a preserva��o ambiental.';
  respostas[2, 12] := 'Defendo ativamente a preserva��o, reconhecendo os benef�cios para o meio ambiente e a qualidade de vida.';
  respostas[2, 13] := 'Apoio a ideia, mas acredito que o desenvolvimento urbano tamb�m � importante.';
  respostas[2, 14] := 'Concordo, desde que haja esfor�os para compensar ambientalmente qualquer desenvolvimento.';
  respostas[2, 15] := 'N�o vejo muita import�ncia em conservar �reas�verdes�urbanas.';

  respostas[3, 0] := 'Sim, internet facilita a comunica��o instant�nea, fortalecendo la�os sociais entre amigos e familiares, independentemente da dist�ncia.';
  respostas[3, 1] := 'Sim, redes sociais e plataformas online s�o espa�os para compartilhar experi�ncias e apoio, contribuindo para uma comunidade mais unida.';
  respostas[3, 2] := 'N�o acho que a internet contribua para a comunica��o. Muitas vezes, as intera��es online s�o superficiais e n�o t�m significado real.';
  respostas[3, 3] := 'N�o vejo como a internet pode fortalecer la�os sociais. Ela pode, na verdade, isolar as pessoas do mundo real.';
  respostas[3, 4] := 'Sim, a internet ajuda a disseminar informa��es, conscientizando e promovendo mudan�as significativas na sociedade.';
  respostas[3, 5] := 'Sim, plataformas online permitem discuss�es e compartilhamento de perspectivas, gerando consci�ncia coletiva sobre diversos problemas.';
  respostas[3, 6] := 'N�o vejo a internet impactando na conscientiza��o. Muitas informa��es s�o distorcidas, dificultando diferir a verdade da mentira. ';
  respostas[3, 7] := 'N�o vejo como a internet pode ser eficaz na conscientiza��o. As pessoas geralmente ignoram informa��es importantes online.';
  respostas[3, 8] := 'Sim, a internet cria bolhas informativas, expondo as pessoas a perspectivas semelhantes, intensificando a polariza��o e os conflitos.';
  respostas[3, 9] := 'Sim, as redes sociais muitas vezes amplificam opini�es extremas, criando divis�es na sociedade e aumentando o risco de conflitos. ';
  respostas[3, 10] := 'N�o acredito que a internet tenha impacto na polariza��o. As pessoas t�m escolhas e podem buscar informa��es diversas se quiserem.';
  respostas[3, 11] := 'N�o vejo como as redes sociais poderiam contribuir para conflitos. Elas s�o apenas plataformas de express�o individual.';
  respostas[3, 12] := 'Sim, a regulamenta��o � necess�ria para proteger a sociedade contra amea�as online, garantindo um ambiente seguro para todos.';
  respostas[3, 13] := 'Sim, a internet precisa de regras para evitar o abuso e garantir que as pessoas possam usufruir dela sem medo de amea�as e ass�dio.';
  respostas[3, 14] := 'N�o acho que a internet precise de regulamenta��o. Isso pode limitar a liberdade online e impedir a express�o individual.';
  respostas[3, 15] := 'N�o vejo amea�as significativas na internet que justifiquem regulamenta��o. As pessoas devem ser respons�veis por suas pr�prias a��es online.';
end;

procedure TFrmMenu.BtnEducacaoClick(Sender: TObject);
begin
  if ((SaudeApertado.Visible = True) or (MeioAmbienteApertado.Visible = True) or
    (SociedadeApertado.Visible = True)) then
  begin
    SaudeApertado.Visible := False;
    MeioAmbienteApertado.Visible := False;
    SociedadeApertado.Visible := False;
  end;
  EducacaoApertado.Visible := True;
  coluna := 0;
end;

procedure TFrmMenu.BtnSaudeClick(Sender: TObject);
begin
  if ((EducacaoApertado.Visible = True) or (MeioAmbienteApertado.Visible = True) or
    (SociedadeApertado.Visible = True)) then
  begin
    EducacaoApertado.Visible := False;
    MeioAmbienteApertado.Visible := False;
    SociedadeApertado.Visible := False;
  end;
  SaudeApertado.Visible := True;
  coluna := 1;
end;

procedure TFrmMenu.BtnMeioAmbienteClick(Sender: TObject);
begin
  if ((SaudeApertado.Visible = True) or (EducacaoApertado.Visible = True) or
    (SociedadeApertado.Visible = True)) then
  begin
    SaudeApertado.Visible := False;
    EducacaoApertado.Visible := False;
    SociedadeApertado.Visible := False;
  end;
  MeioAmbienteApertado.Visible := True;
  coluna := 2;
end;

procedure TFrmMenu.BtnSociedadeClick(Sender: TObject);
begin
  if ((SaudeApertado.Visible = True) or (MeioAmbienteApertado.Visible = True) or
    (EducacaoApertado.Visible = True)) then
  begin
    SaudeApertado.Visible := False;
    MeioAmbienteApertado.Visible := False;
    EducacaoApertado.Visible := False;
  end;
  SociedadeApertado.Visible := True;
  coluna := 3;
end;

procedure TFrmMenu.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
if(Key=vkHardwareBack) then
  begin
    Key:=0;
  end;
end;

procedure TFrmMenu.FormShow(Sender: TObject);
begin
SaudeApertado.Visible:=False;
EducacaoApertado.Visible:=False;
SociedadeApertado.Visible:=False;
MeioAmbienteApertado.Visible:=False;
end;

procedure TFrmMenu.BtnJogarClick(Sender: TObject);
begin
  if ((SaudeApertado.Visible = False) and (EducacaoApertado.Visible = False) and
    (SociedadeApertado.Visible = False)) and (MeioAmbienteApertado.Visible = False) then
  begin
    LblAlert.Visible:=True;
  end;
  if ((SaudeApertado.Visible = True) or (EducacaoApertado.Visible = True) or
    (SociedadeApertado.Visible = True)) or (MeioAmbienteApertado.Visible = True) then
  begin
    FrmQuestions.posicaoPergunta := 0;
    InicializarMatrizes;
    FrmQuestions.ExecuteQuestions;
  end;
end;
end.
