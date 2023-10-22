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
  perguntas[0, 0] := 'Um governo est� considerando implementar uma lei que pro�ba a venda de refrigerantes em escolas.';
  perguntas[0, 1] := 'Uma empresa est� pensando em oferecer gin�stica laboral para os funcion�rios durante o expediente.';
  perguntas[0, 2] := 'Uma cidade est� discutindo a possibilidade de proibir o uso de cigarros em espa�os p�blicos.';
  perguntas[0, 3] := 'Um debate surge sobre a regulamenta��o da venda de alimentos ultraprocessados.';

  perguntas[1, 0] := 'Voc� acredita que a pr�tica regular de atividades f�sicas � importante para a sa�de?';
  perguntas[1, 1] := 'Voc� concorda que uma boa noite de sono e a pr�tica de t�cnicas de relaxamento, como a medita��o, contribuem para o seu bem-estar?';
  perguntas[1, 2] := 'Voc� acha necess�rio realizar check-ups m�dicos regularmente, mesmo quando n�o est� doente? ';
  perguntas[1, 3] := 'Voc� acredita que equilibrar o tempo entre trabalho e vida pessoal, bem como manter relacionamentos saud�veis, � crucial para uma vida plena e saud�vel?';

  perguntas[2, 0] := 'Uma cidade est� planejando a constru��o de um novo shopping center em uma �rea verde significativa.';
  perguntas[2, 1] := 'Uma empresa deseja implementar uma pol�tica de redu��o de pl�stico, proibindo o uso de sacolas pl�sticas em suas lojas.';
  perguntas[2, 2] := 'Uma comunidade est� considerando a constru��o de uma ciclovia extensa para promover o uso de bicicletas como meio de transporte.';
  perguntas[2, 3] := 'Um governo est� avaliando a libera��o da ca�a controlada como medida para gerenciar a popula��o de uma esp�cie que amea�a outras na regi�o.';

  perguntas[3, 0] := 'Voc� acredita que a internet facilita a comunica��o entre as pessoas e fortalece os la�os sociais?';
  perguntas[3, 1] := 'Voc� concorda que a internet � uma ferramenta poderosa para disseminar informa��es e conscientizar as pessoas sobre quest�es importantes?';
  perguntas[3, 2] := 'Voc� acha que a internet contribui para o aumento da polariza��o e dos conflitos na sociedade?';
  perguntas[3, 3] := 'Voc� concorda que a internet deve ser regulamentada para proteger a sociedade contra amea�as online, como desinforma��o e cyberbullying?';

  // Inicializar a matriz de respostas (16 linhas e 4 colunas)
  SetLength(respostas, 4, 16);

  // Preencher a matriz de respostas com strings de exemplo
  respostas[0, 0] := 'Sim, para combater a obesidade infantil e promover h�bitos alimentares saud�veis.';
  respostas[0, 1] := 'N�o, isso infringe a liberdade de escolha dos alunos.';
  respostas[0, 2] := 'Sim, desde que se ofere�am op��es mais saud�veis.';
  respostas[0, 3] := 'N�o, � responsabilidade dos pais controlar a dieta de seus filhos.';
  respostas[0, 4] := 'Sim, para melhorar a sa�de dos funcion�rios e aumentar a produtividade.';
  respostas[0, 5] := 'N�o, isso pode interferir no tempo de trabalho efetivo.';
  respostas[0, 6] := 'Sim, desde que a participa��o seja volunt�ria.';
  respostas[0, 7] := 'N�o, cada pessoa deve cuidar de sua sa�de fora do ambiente de trabalho.';
  respostas[0, 8] := 'Sim, para proteger n�o fumantes dos efeitos prejudiciais do tabagismo passivo.';
  respostas[0, 9] := 'N�o, isso viola o direito dos fumantes de escolherem seu comportamento.';
  respostas[0, 10] := 'Sim, desde que sejam criadas �reas designadas para fumantes.';
  respostas[0, 11] := 'N�o, a educa��o sobre os riscos do tabagismo � suficiente.';
  respostas[0, 12] := 'Sim, para combater problemas de sa�de relacionados � alimenta��o n�o saud�vel.';
  respostas[0, 13] := 'N�o, cada pessoa � respons�vel por suas escolhas alimentares.';
  respostas[0, 14] := 'Sim, desde que a regulamenta��o n�o seja excessivamente restritiva.';
  respostas[0, 15] := 'N�o, isso pode prejudicar a ind�stria aliment�cia e a liberdade de�escolha.';

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

  respostas[2, 0] := 'Sim, para impulsionar a economia local e criar empregos.';
  respostas[2, 1] := 'N�o, preservar a �rea verde � essencial para o equil�brio ecol�gico.';
  respostas[2, 2] := 'Sim, desde que haja um plano de compensa��o ambiental';
  respostas[2, 3] := 'N�o, � poss�vel encontrar locais urbanos mais apropriados para o shopping.';
  respostas[2, 4] := 'Sim, para diminuir a polui��o e o impacto ambiental.';
  respostas[2, 5] := 'N�o, os clientes podem preferir a conveni�ncia das sacolas pl�sticas.';
  respostas[2, 6] := 'Sim, desde que sejam oferecidas alternativas sustent�veis.';
  respostas[2, 7] := 'N�o, a proibi��o pode afetar negativamente a lucratividade da empresa.';
  respostas[2, 8] := 'Sim, para incentivar um estilo de vida saud�vel e reduzir a emiss�o de gases.';
  respostas[2, 9] := 'N�o, a constru��o pode causar perturba��es no tr�nsito atual.';
  respostas[2, 10] := 'Sim, desde que haja investimento em educa��o sobre seguran�a no tr�nsito.';
  respostas[2, 11] := 'N�o, o dinheiro pode ser melhor utilizado em outras necessidades da comunidade.';
  respostas[2, 12] := 'Sim, a ca�a controlada � uma solu��o eficaz para manter o equil�brio ecol�gico.';
  respostas[2, 13] := 'N�o, existem m�todos mais �ticos de controle populacional.';
  respostas[2, 14] := 'Sim, desde que seja estritamente regulamentada para evitar abusos.';
  respostas[2, 15] := 'N�o, a interven��o humana pode ter consequ�ncias imprevis�veis no ecossistema.';

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
    FrmQuestions.posicaoPergunta := 0;
    InicializarMatrizes;
    FrmQuestions.ExecuteQuestions;
  end;
end;
end.
