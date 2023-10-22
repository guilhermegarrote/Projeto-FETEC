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
  perguntas[0, 0] := 'Um governo está considerando implementar uma lei que proíba a venda de refrigerantes em escolas.';
  perguntas[0, 1] := 'Uma empresa está pensando em oferecer ginástica laboral para os funcionários durante o expediente.';
  perguntas[0, 2] := 'Uma cidade está discutindo a possibilidade de proibir o uso de cigarros em espaços públicos.';
  perguntas[0, 3] := 'Um debate surge sobre a regulamentação da venda de alimentos ultraprocessados.';

  perguntas[1, 0] := 'Você acredita que a prática regular de atividades físicas é importante para a saúde?';
  perguntas[1, 1] := 'Você concorda que uma boa noite de sono e a prática de técnicas de relaxamento, como a meditação, contribuem para o seu bem-estar?';
  perguntas[1, 2] := 'Você acha necessário realizar check-ups médicos regularmente, mesmo quando não está doente? ';
  perguntas[1, 3] := 'Você acredita que equilibrar o tempo entre trabalho e vida pessoal, bem como manter relacionamentos saudáveis, é crucial para uma vida plena e saudável?';

  perguntas[2, 0] := 'Uma cidade está planejando a construção de um novo shopping center em uma área verde significativa.';
  perguntas[2, 1] := 'Uma empresa deseja implementar uma política de redução de plástico, proibindo o uso de sacolas plásticas em suas lojas.';
  perguntas[2, 2] := 'Uma comunidade está considerando a construção de uma ciclovia extensa para promover o uso de bicicletas como meio de transporte.';
  perguntas[2, 3] := 'Um governo está avaliando a liberação da caça controlada como medida para gerenciar a população de uma espécie que ameaça outras na região.';

  perguntas[3, 0] := 'Você acredita que a internet facilita a comunicação entre as pessoas e fortalece os laços sociais?';
  perguntas[3, 1] := 'Você concorda que a internet é uma ferramenta poderosa para disseminar informações e conscientizar as pessoas sobre questões importantes?';
  perguntas[3, 2] := 'Você acha que a internet contribui para o aumento da polarização e dos conflitos na sociedade?';
  perguntas[3, 3] := 'Você concorda que a internet deve ser regulamentada para proteger a sociedade contra ameaças online, como desinformação e cyberbullying?';

  // Inicializar a matriz de respostas (16 linhas e 4 colunas)
  SetLength(respostas, 4, 16);

  // Preencher a matriz de respostas com strings de exemplo
  respostas[0, 0] := 'Sim, para combater a obesidade infantil e promover hábitos alimentares saudáveis.';
  respostas[0, 1] := 'Não, isso infringe a liberdade de escolha dos alunos.';
  respostas[0, 2] := 'Sim, desde que se ofereçam opções mais saudáveis.';
  respostas[0, 3] := 'Não, é responsabilidade dos pais controlar a dieta de seus filhos.';
  respostas[0, 4] := 'Sim, para melhorar a saúde dos funcionários e aumentar a produtividade.';
  respostas[0, 5] := 'Não, isso pode interferir no tempo de trabalho efetivo.';
  respostas[0, 6] := 'Sim, desde que a participação seja voluntária.';
  respostas[0, 7] := 'Não, cada pessoa deve cuidar de sua saúde fora do ambiente de trabalho.';
  respostas[0, 8] := 'Sim, para proteger não fumantes dos efeitos prejudiciais do tabagismo passivo.';
  respostas[0, 9] := 'Não, isso viola o direito dos fumantes de escolherem seu comportamento.';
  respostas[0, 10] := 'Sim, desde que sejam criadas áreas designadas para fumantes.';
  respostas[0, 11] := 'Não, a educação sobre os riscos do tabagismo é suficiente.';
  respostas[0, 12] := 'Sim, para combater problemas de saúde relacionados à alimentação não saudável.';
  respostas[0, 13] := 'Não, cada pessoa é responsável por suas escolhas alimentares.';
  respostas[0, 14] := 'Sim, desde que a regulamentação não seja excessivamente restritiva.';
  respostas[0, 15] := 'Não, isso pode prejudicar a indústria alimentícia e a liberdade de escolha.';

  respostas[1, 0] := 'Sim, é crucial praticar atividades físicas regularmente. O exercício não só fortalece o corpo, mas também melhora o humor e reduz o estresse, contribuindo para uma vida mais saudável. ';
  respostas[1, 1] := 'Sim, cuidar da alimentação é essencial para a saúde. Uma dieta equilibrada fornece os nutrientes necessários para o funcionamento adequado do corpo, prevenindo doenças e promovendo o bem-estar.';
  respostas[1, 2] := 'Não acho necessário se preocupar com exercícios. O importante é aproveitar a vida, sem se preocupar com atividades físicas.';
  respostas[1, 3] := 'Não vejo como a alimentação está relacionada à saúde. Comer o que gosto me faz feliz, e isso é o que importa.';
  respostas[1, 4] := 'Sim, dormir o suficiente é fundamental para o bom funcionamento do corpo e da mente. Uma boa noite de sono contribui para a recuperação física e mental, promovendo a saúde e o bem-estar.';
  respostas[1, 5] := 'Sim, é importante reservar tempo para relaxar e desestressar. Práticas como a meditação podem melhorar a saúde mental, reduzir a ansiedade e promover um equilíbrio emocional.';
  respostas[1, 6] := 'Não vejo a necessidade de dormir tanto. Prefiro aproveitar a noite com atividades divertidas.';
  respostas[1, 7] := 'Não acredito em métodos como a meditação. Não vejo como sentar-se quieto pode fazer diferença na saúde.';
  respostas[1, 8] := 'Sim, é importante fazer check-ups médicos regularmente. Essas visitas ajudam na detecção precoce de problemas de saúde, permitindo tratamentos mais eficazes e contribuindo para uma vida mais saudável.';
  respostas[1, 9] := 'Sim, a prevenção é a chave para uma vida saudável. Adotar medidas preventivas, como vacinação e hábitos saudáveis, pode evitar doenças e melhorar a qualidade de vida.';
  respostas[1, 10] := 'Não vejo por que deveria ir ao médico se não estou doente. Isso só faz sentido quando há problemas.';
  respostas[1, 11] := 'Não confio muito na medicina preventiva. Acho que o corpo se cura naturalmente. ';
  respostas[1, 12] := 'Sim, manter relacionamentos saudáveis é crucial para o bem-estar emocional. O apoio social pode ajudar a lidar com o estresse e promover uma sensação de pertencimento e felicidade. ';
  respostas[1, 13] := 'Sim, é importante equilibrar o trabalho e a vida pessoal. O excesso de trabalho pode levar ao esgotamento, afetando negativamente a saúde física e mental.';
  respostas[1, 14] := 'Não vejo como os relacionamentos podem influenciar a saúde. Cada um deve cuidar de si mesmo.';
  respostas[1, 15] := 'Não vejo problemas em dedicar a maior parte do tempo ao trabalho. Isso é o que traz realização.';

  respostas[2, 0] := 'Sim, para impulsionar a economia local e criar empregos.';
  respostas[2, 1] := 'Não, preservar a área verde é essencial para o equilíbrio ecológico.';
  respostas[2, 2] := 'Sim, desde que haja um plano de compensação ambiental';
  respostas[2, 3] := 'Não, é possível encontrar locais urbanos mais apropriados para o shopping.';
  respostas[2, 4] := 'Sim, para diminuir a poluição e o impacto ambiental.';
  respostas[2, 5] := 'Não, os clientes podem preferir a conveniência das sacolas plásticas.';
  respostas[2, 6] := 'Sim, desde que sejam oferecidas alternativas sustentáveis.';
  respostas[2, 7] := 'Não, a proibição pode afetar negativamente a lucratividade da empresa.';
  respostas[2, 8] := 'Sim, para incentivar um estilo de vida saudável e reduzir a emissão de gases.';
  respostas[2, 9] := 'Não, a construção pode causar perturbações no trânsito atual.';
  respostas[2, 10] := 'Sim, desde que haja investimento em educação sobre segurança no trânsito.';
  respostas[2, 11] := 'Não, o dinheiro pode ser melhor utilizado em outras necessidades da comunidade.';
  respostas[2, 12] := 'Sim, a caça controlada é uma solução eficaz para manter o equilíbrio ecológico.';
  respostas[2, 13] := 'Não, existem métodos mais éticos de controle populacional.';
  respostas[2, 14] := 'Sim, desde que seja estritamente regulamentada para evitar abusos.';
  respostas[2, 15] := 'Não, a intervenção humana pode ter consequências imprevisíveis no ecossistema.';

  respostas[3, 0] := 'Sim, a internet permite que as pessoas se comuniquem instantaneamente, o que fortalece os laços sociais, conectando amigos e familiares independentemente da distância.';
  respostas[3, 1] := 'Sim, as redes sociais e plataformas online são espaços onde as pessoas podem compartilhar experiências e se apoiar, contribuindo para uma comunidade mais unida.';
  respostas[3, 2] := 'Não acho que a internet contribua para a comunicação. Muitas vezes, as interações online são superficiais e não têm significado real.';
  respostas[3, 3] := 'Não vejo como a internet pode fortalecer laços sociais. Ela pode, na verdade, isolar as pessoas do mundo real.';
  respostas[3, 4] := 'Sim, a internet é uma poderosa ferramenta de disseminação de informações. Permite a conscientização sobre questões sociais, promovendo mudanças positivas na sociedade.';
  respostas[3, 5] := 'Sim, plataformas online oferecem espaço para discussões abertas e compartilhamento de perspectivas, criando uma consciência coletiva sobre diversos problemas.';
  respostas[3, 6] := 'Não acredito que a internet tenha impacto na conscientização. Muitas informações são distorcidas, e as pessoas não conseguem discernir o que é verdadeiro. ';
  respostas[3, 7] := 'Não vejo como a internet pode ser eficaz na conscientização. As pessoas geralmente ignoram informações importantes online.';
  respostas[3, 8] := 'Sim, a internet cria bolhas informativas, onde as pessoas são expostas apenas a perspectivas semelhantes, o que intensifica a polarização e os conflitos.';
  respostas[3, 9] := 'Sim, as redes sociais muitas vezes amplificam opiniões extremas, criando divisões na sociedade e aumentando o risco de conflitos. ';
  respostas[3, 10] := 'Não acredito que a internet tenha impacto na polarização. As pessoas têm escolhas e podem buscar informações diversas se quiserem.';
  respostas[3, 11] := 'Não vejo como as redes sociais poderiam contribuir para conflitos. Elas são apenas plataformas de expressão individual.';
  respostas[3, 12] := 'Sim, a regulamentação é necessária para proteger a sociedade contra ameaças online, garantindo um ambiente seguro para todos.';
  respostas[3, 13] := 'Sim, a internet precisa de regras para evitar o abuso e garantir que as pessoas possam usufruir dela sem medo de ameaças e assédio.';
  respostas[3, 14] := 'Não acho que a internet precise de regulamentação. Isso pode limitar a liberdade online e impedir a expressão individual.';
  respostas[3, 15] := 'Não vejo ameaças significativas na internet que justifiquem regulamentação. As pessoas devem ser responsáveis por suas próprias ações online.';
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
