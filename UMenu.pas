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
    LayoutLogo: TLayout;
    Layout1: TLayout;
    LayoutGroup: TLayout;
    Line1: TLayout;
    Line2: TLayout;
    Image1: TImage;
    Layout2: TLayout;
    W: TImage;
    Image3: TImage;
    Layout3: TLayout;
    Layout4: TLayout;
    Image2: TImage;
    Image4: TImage;
    Layout5: TLayout;
    Image7: TImage;
    Image8: TImage;
    Layout6: TLayout;
    RecSaude: TRectangle;
    FndSaude: TImage;
    TextSaude: TImage;
    BtnJogar: TSpeedButton;
    BtnSaude: TButton;
    Layout7: TLayout;
    RecEducacao: TRectangle;
    FndEducacao: TImage;
    TextEducacao: TImage;
    BtnEducacao: TButton;
    Layout8: TLayout;
    RecMeioAmbiente: TRectangle;
    FundoMeioAmbiente: TImage;
    TextMeioAmbiente: TImage;
    BtnMeioAmbiente: TButton;
    LayoutSociedade: TLayout;
    RecSociedade: TRectangle;
    FundoSociedade: TImage;
    TextSociedade: TImage;
    BtnSociedade: TButton;
    procedure InicializarMatrizes;
    procedure BtnSaudeClick(Sender: TObject);
    procedure BtnEducacaoClick(Sender: TObject);
    procedure BtnMeioAmbienteClick(Sender: TObject);
    procedure BtnSociedadeClick(Sender: TObject);
    procedure BtnJogarClick(Sender: TObject);
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
  perguntas[0, 0] := '1';
  perguntas[0, 1] := '2';
  perguntas[0, 2] := '3';
  perguntas[0, 3] := '4';

  perguntas[1, 0] := 'Voc� acredita que a pr�tica regular de atividades f�sicas � importante para a sa�de?';
  perguntas[1, 1] := 'Voc� concorda que uma boa noite de sono e a pr�tica de t�cnicas de relaxamento, como a medita��o, contribuem para o seu bem-estar?';
  perguntas[1, 2] := 'Voc� acha necess�rio realizar check-ups m�dicos regularmente, mesmo quando n�o est� doente? ';
  perguntas[1, 3] := 'Voc� acredita que equilibrar o tempo entre trabalho e vida pessoal, bem como manter relacionamentos saud�veis, � crucial para uma vida plena e saud�vel?';

  perguntas[2, 0] := 'a';
  perguntas[2, 1] := 'a';
  perguntas[2, 2] := 'a';
  perguntas[2, 3] := 'a';

  perguntas[3, 0] := 'Voc� acredita que a internet facilita a comunica��o entre as pessoas e fortalece os la�os sociais?';
  perguntas[3, 1] := 'Voc� concorda que a internet � uma ferramenta poderosa para disseminar informa��es e conscientizar as pessoas sobre quest�es importantes?';
  perguntas[3, 2] := 'Voc� acha que a internet contribui para o aumento da polariza��o e dos conflitos na sociedade?';
  perguntas[3, 3] := 'Voc� concorda que a internet deve ser regulamentada para proteger a sociedade contra amea�as online, como desinforma��o e cyberbullying?';

  // Inicializar a matriz de respostas (16 linhas e 4 colunas)
  SetLength(respostas, 4, 16);

  // Preencher a matriz de respostas com strings de exemplo
  respostas[0, 0] := 'a';
  respostas[0, 1] := 'b';
  respostas[0, 2] := 'v';
  respostas[0, 3] := 'c';
  respostas[0, 4] := 'd';
  respostas[0, 5] := 's';
  respostas[0, 6] := 'a';
  respostas[0, 7] := 'd';
  respostas[0, 8] := 'f';
  respostas[0, 9] := 'w';
  respostas[0, 10] := 'a';
  respostas[0, 11] := 'g';
  respostas[0, 12] := 'b';
  respostas[0, 13] := 'v';
  respostas[0, 14] := 's';
  respostas[0, 15] := 's';

  respostas[1, 0] := 'Sim, � crucial praticar atividades f�sicas regularmente. O exerc�cio n�o s� fortalece o corpo, mas tamb�m melhora o humor e reduz o estresse, contribuindo para uma vida mais saud�vel. ';
  respostas[1, 1] := 'Sim, cuidar da alimenta��o � essencial para a sa�de. Uma dieta equilibrada fornece os nutrientes necess�rios para o funcionamento adequado do corpo, prevenindo doen�as e promovendo o bem-estar.';
  respostas[1, 2] := 'N�o acho necess�rio se preocupar com exerc�cios. O importante � aproveitar a vida, sem se preocupar com atividades f�sicas.';
  respostas[1, 3] := 'N�o vejo como a alimenta��o est� relacionada � sa�de. Comer o que gosto me faz feliz, e isso � o que importa.';
  respostas[1, 4] := 'Sim, dormir o suficiente � fundamental para o bom funcionamento do corpo e da mente. Uma boa noite de sono contribui para a recupera��o f�sica e mental, promovendo a sa�de e o bem-estar.';
  respostas[1, 5] := 'Sim, � importante reservar tempo para relaxar e desestressar. Pr�ticas como a medita��o podem melhorar a sa�de mental, reduzir a ansiedade e promover um equil�brio emocional.';
  respostas[1, 6] := 'N�o vejo a necessidade de dormir tanto. Prefiro aproveitar a noite com atividades divertidas.';
  respostas[1, 7] := 'N�o acredito em m�todos como a medita��o. N�o vejo como sentar-se quieto pode fazer diferen�a na sa�de.';
  respostas[1, 8] := 'Sim, � importante fazer check-ups m�dicos regularmente. Essas visitas ajudam na detec��o precoce de problemas de sa�de, permitindo tratamentos mais eficazes e contribuindo para uma vida mais saud�vel.';
  respostas[1, 9] := 'Sim, a preven��o � a chave para uma vida saud�vel. Adotar medidas preventivas, como vacina��o e h�bitos saud�veis, pode evitar doen�as e melhorar a qualidade de vida.';
  respostas[1, 10] := 'N�o vejo por que deveria ir ao m�dico se n�o estou doente. Isso s� faz sentido quando h� problemas.';
  respostas[1, 11] := 'N�o confio muito na medicina preventiva. Acho que o corpo se cura naturalmente. ';
  respostas[1, 12] := 'Sim, manter relacionamentos saud�veis � crucial para o bem-estar emocional. O apoio social pode ajudar a lidar com o estresse e promover uma sensa��o de pertencimento e felicidade. ';
  respostas[1, 13] := 'Sim, � importante equilibrar o trabalho e a vida pessoal. O excesso de trabalho pode levar ao esgotamento, afetando negativamente a sa�de f�sica e mental.';
  respostas[1, 14] := 'N�o vejo como os relacionamentos podem influenciar a sa�de. Cada um deve cuidar de si mesmo.';
  respostas[1, 15] := 'N�o vejo problemas em dedicar a maior parte do tempo ao trabalho. Isso � o que traz realiza��o.';

  respostas[2, 0] := 'a';
  respostas[2, 1] := 'a';
  respostas[2, 2] := 'a';
  respostas[2, 3] := 'a';
  respostas[2, 4] := 'a';
  respostas[2, 5] := 'a';
  respostas[2, 6] := 'a';
  respostas[2, 7] := 'a';
  respostas[2, 8] := 'a';
  respostas[2, 9] := 'a';
  respostas[2, 10] := 'a';
  respostas[2, 11] := 'a';
  respostas[2, 12] := 'a';
  respostas[2, 13] := 'a';
  respostas[2, 14] := 'a';
  respostas[2, 15] := 'a';

  respostas[3, 0] := 'Sim, a internet permite que as pessoas se comuniquem instantaneamente, o que fortalece os la�os sociais, conectando amigos e familiares independentemente da dist�ncia.';
  respostas[3, 1] := 'Sim, as redes sociais e plataformas online s�o espa�os onde as pessoas podem compartilhar experi�ncias e se apoiar, contribuindo para uma comunidade mais unida.';
  respostas[3, 2] := 'N�o acho que a internet contribua para a comunica��o. Muitas vezes, as intera��es online s�o superficiais e n�o t�m significado real.';
  respostas[3, 3] := 'N�o vejo como a internet pode fortalecer la�os sociais. Ela pode, na verdade, isolar as pessoas do mundo real.';
  respostas[3, 4] := 'Sim, a internet � uma poderosa ferramenta de dissemina��o de informa��es. Permite a conscientiza��o sobre quest�es sociais, promovendo mudan�as positivas na sociedade.';
  respostas[3, 5] := 'Sim, plataformas online oferecem espa�o para discuss�es abertas e compartilhamento de perspectivas, criando uma consci�ncia coletiva sobre diversos problemas.';
  respostas[3, 6] := 'N�o acredito que a internet tenha impacto na conscientiza��o. Muitas informa��es s�o distorcidas, e as pessoas n�o conseguem discernir o que � verdadeiro. ';
  respostas[3, 7] := 'N�o vejo como a internet pode ser eficaz na conscientiza��o. As pessoas geralmente ignoram informa��es importantes online.';
  respostas[3, 8] := 'Sim, a internet cria bolhas informativas, onde as pessoas s�o expostas apenas a perspectivas semelhantes, o que intensifica a polariza��o e os conflitos.';
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
  if ((RecSaude.Visible = True) or (RecMeioAmbiente.Visible = True) or
    (RecSociedade.Visible = True)) then
  begin
    RecSaude.Visible := False;
    RecMeioAmbiente.Visible := False;
    RecSociedade.Visible := False;
  end;
  RecEducacao.Visible := True;
  coluna := 0;
end;

procedure TFrmMenu.BtnSaudeClick(Sender: TObject);
begin
  if ((RecEducacao.Visible = True) or (RecMeioAmbiente.Visible = True) or
    (RecSociedade.Visible = True)) then
  begin
    RecEducacao.Visible := False;
    RecMeioAmbiente.Visible := False;
    RecSociedade.Visible := False;
  end;
  RecSaude.Visible := True;
  coluna := 1;
end;

procedure TFrmMenu.BtnMeioAmbienteClick(Sender: TObject);
begin
  if ((RecSaude.Visible = True) or (RecEducacao.Visible = True) or
    (RecSociedade.Visible = True)) then
  begin
    RecSaude.Visible := False;
    RecEducacao.Visible := False;
    RecSociedade.Visible := False;
  end;
  RecMeioAmbiente.Visible := True;
  coluna := 2;
end;

procedure TFrmMenu.BtnSociedadeClick(Sender: TObject);
begin
  if ((RecSaude.Visible = True) or (RecMeioAmbiente.Visible = True) or
    (RecEducacao.Visible = True)) then
  begin
    RecSaude.Visible := False;
    RecMeioAmbiente.Visible := False;
    RecEducacao.Visible := False;
  end;
  RecSociedade.Visible := True;
  coluna := 3;
end;

procedure TFrmMenu.BtnJogarClick(Sender: TObject);
begin
  if ((RecSaude.Visible = True) or (RecEducacao.Visible = True) or
    (RecSociedade.Visible = True)) or (RecMeioAmbiente.Visible = True) then
  begin
    InicializarMatrizes;
    FrmQuestions.ExecuteQuestions;
  end;
end;
end.
