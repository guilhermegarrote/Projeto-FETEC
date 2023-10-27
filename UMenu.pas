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
  perguntas[0, 0] := 'Para você, qual o papel da educação na formação e evolução de um indivíduo?';
  perguntas[0, 1] := 'Qual é sua opinião sobre a acessibilidade à educação de qualidade para todos, não importando a situação de vida das pessoas (classes sociais)?';
  perguntas[0, 2] := 'Como você vê o papel das tecnologias educacionais avançadas no processo de aprendizagem?';
  perguntas[0, 3] := 'Como você avalia a importância de estar sempre estudando ao longo da vida?';

  perguntas[1, 0] := 'Você acredita que a prática regular de atividades físicas é importante para a saúde?';
  perguntas[1, 1] := 'Você concorda que uma boa noite de sono e a prática de técnicas de relaxamento, como a meditação, contribuem para o seu bem-estar?';
  perguntas[1, 2] := 'Você acha necessário realizar check-ups médicos regularmente, mesmo quando não está doente? ';
  perguntas[1, 3] := 'Você acredita que equilibrar o tempo entre trabalho e vida pessoal, bem como manter relacionamentos saudáveis, é crucial para uma vida plena e saudável?';

  perguntas[2, 0] := 'Para você, qual a importância da redução do uso de plástico no seu dia a dia?';
  perguntas[2, 1] := 'Como você avalia o seu consumo de energia em casa?';
  perguntas[2, 2] := 'Qual é sua opinião sobre o desmatamento para evoluir no desenvolvimento econômico?';
  perguntas[2, 3] := 'Qual o nível de importância em conservar as áreas verdes urbanas em sua comunidade?';

  perguntas[3, 0] := 'Você acredita que a internet facilita a comunicação entre as pessoas e fortalece os laços sociais?';
  perguntas[3, 1] := 'Você concorda que a internet é uma ferramenta poderosa para disseminar informações e conscientizar as pessoas sobre questões importantes?';
  perguntas[3, 2] := 'Você acha que a internet contribui para o aumento da polarização e dos conflitos na sociedade?';
  perguntas[3, 3] := 'Você concorda que a internet deve ser regulamentada para proteger a sociedade contra ameaças online, como desinformação e cyberbullying?';

  // Inicializar a matriz de respostas (16 linhas e 4 colunas)
  SetLength(respostas, 4, 16);

  // Preencher a matriz de respostas com strings de exemplo
  respostas[0, 0] := 'Acredito que a educação desempenha um papel crucial no desenvolvimento e evolução global de uma pessoa.';
  respostas[0, 1] := 'Reconheço sua importância, mas às vezes priorizo outras habilidades práticas ao invés da educação formal.';
  respostas[0, 2] := 'Apoio a educação, desde que esteja alinhada com as necessidades práticas da vida de cada um.';
  respostas[0, 3] := 'Não vejo a educação como essencial para o desenvolvimento individual.';
  respostas[0, 4] := 'Defendo totalmente a ideia de que todos devem ter acesso igualitário à educação de qualidade.';
  respostas[0, 5] := 'Concordo com a importância, mas reconheço que há desafios práticos na implementação.';
  respostas[0, 6] := 'Apoio, desde que haja esforços para melhorar a qualidade da educação em todos os níveis.';
  respostas[0, 7] := 'Não considero a acessibilidade à educação um problema significativo no mundo atualmente.';
  respostas[0, 8] := 'Acredito que as tecnologias educacionais são ferramentas valiosas para melhorar o ensino e aprendizado.';
  respostas[0, 9] := 'Reconheço sua utilidade, mas acredito que a abordagem tradicional ainda é mais eficaz.';
  respostas[0, 10] := 'Apoio, desde que as tecnologias sejam usadas de maneira equilibrada com métodos tradicionais.';
  respostas[0, 11] := 'Não vejo a necessidade ou benefícios significativos nas tecnologias educacionais.';
  respostas[0, 12] := 'Acredito que a aprendizagem ao longo da vida é essencial para se manter atualizado e crescer como pessoa.';
  respostas[0, 13] := 'Reconheço sua importância, mas acho difícil dedicar tempo regularmente à educação contínua.';
  respostas[0, 14] := 'Apoio, desde que haja flexibilidade e opções adequadas para a educação contínua.';
  respostas[0, 15] := 'Não vejo muito valor na busca constante por conhecimento ao longo da vida.';

  respostas[1, 0] := 'Sim, praticar exercícios regularmente é crucial, fortalece o corpo, melhora o humor e reduz o estresse para uma vida mais saudável. ';
  respostas[1, 1] := 'Sim, cuidar da alimentação é vital. Uma dieta equilibrada fornece nutrientes, prevenindo doenças e promovendo o bem-estar.';
  respostas[1, 2] := 'Não acho necessário se preocupar com exercícios. O importante é aproveitar a vida, sem se preocupar com atividades físicas.';
  respostas[1, 3] := 'Não vejo como a alimentação está relacionada à saúde. Comer o que gosto me faz feliz, e isso é o que importa.';
  respostas[1, 4] := 'Sim, ter um sono adequado promove saúde e bem-estar através da recuperação física e mental durante a noite.';
  respostas[1, 5] := 'Sim, é crucial reservar tempo para relaxar. A meditação por exemplo melhora a saúde mental e promove equilíbrio emocional.';
  respostas[1, 6] := 'Não vejo a necessidade de dormir tanto. Prefiro aproveitar a noite com atividades divertidas.';
  respostas[1, 7] := 'Não acredito em métodos como a meditação. Não vejo como sentar-se quieto pode fazer diferença na saúde.';
  respostas[1, 8] := 'Sim, check-ups regulares detectam problemas de saúde precocemente, permitindo tratamentos eficazes para uma vida mais saudável.';
  respostas[1, 9] := 'Sim, prevenção é crucial. Vacinação e hábitos saudáveis evitam doenças, melhorando a qualidade de vida.';
  respostas[1, 10] := 'Não vejo por que deveria ir ao médico se não estou doente. Isso só faz sentido quando há problemas.';
  respostas[1, 11] := 'Não confio muito na medicina preventiva. Acho que o corpo se cura naturalmente. ';
  respostas[1, 12] := 'Sim, relacionamentos saudáveis são cruciais para o bem-estar emocional. Apoio social ajuda a lidar com o estresse, promovendo felicidade.';
  respostas[1, 13] := 'Sim, equilibrar trabalho e vida pessoal é essencial. O excesso de trabalho pode causar esgotamento, afetando a saúde física e mental.';
  respostas[1, 14] := 'Não vejo como os relacionamentos podem influenciar a saúde. Cada um deve cuidar de si mesmo.';
  respostas[1, 15] := 'Não vejo problemas em dedicar a maior parte do tempo ao trabalho. Isso é o que traz realização.';

  respostas[2, 0] := 'Reconheço e pratico ativamente a redução para diminuir a poluição.';
  respostas[2, 1] := 'Entendo a necessidade, mas às vezes escolho a conveniência do plástico.';
  respostas[2, 2] := 'Apoio a redução, desde que haja alternativas sustentáveis disponíveis.';
  respostas[2, 3] := 'Não vejo a necessidade de mudar meus hábitos em relação ao plástico.';
  respostas[2, 4] := 'Adoto medidas consistentes para reduzir meu consumo de energia.';
  respostas[2, 5] := 'Faço alguns esforços, mas às vezes priorizo conveniência sobre eficiência energética.';
  respostas[2, 6] := 'Apoio a ideia, desde que não comprometa muito meu conforto.';
  respostas[2, 7] := 'Não presto muita atenção ao meu consumo de energia.';
  respostas[2, 8] := 'Discordo totalmente, priorizando a preservação ambiental sobre o desenvolvimento.';
  respostas[2, 9] := 'Tenho reservas e acredito que deve haver um equilíbrio entre desenvolvimento e preservação.';
  respostas[2, 10] := 'Concordo com o desenvolvimento, desde que haja esforços para replantar áreas desmatadas.';
  respostas[2, 11] := 'Concordo, considerando o desenvolvimento econômico mais importante que a preservação ambiental.';
  respostas[2, 12] := 'Defendo ativamente a preservação, reconhecendo os benefícios para o meio ambiente e a qualidade de vida.';
  respostas[2, 13] := 'Apoio a ideia, mas acredito que o desenvolvimento urbano também é importante.';
  respostas[2, 14] := 'Concordo, desde que haja esforços para compensar ambientalmente qualquer desenvolvimento.';
  respostas[2, 15] := 'Não vejo muita importância em conservar áreas verdes urbanas.';

  respostas[3, 0] := 'Sim, internet facilita a comunicação instantânea, fortalecendo laços sociais entre amigos e familiares, independentemente da distância.';
  respostas[3, 1] := 'Sim, redes sociais e plataformas online são espaços para compartilhar experiências e apoio, contribuindo para uma comunidade mais unida.';
  respostas[3, 2] := 'Não acho que a internet contribua para a comunicação. Muitas vezes, as interações online são superficiais e não têm significado real.';
  respostas[3, 3] := 'Não vejo como a internet pode fortalecer laços sociais. Ela pode, na verdade, isolar as pessoas do mundo real.';
  respostas[3, 4] := 'Sim, a internet ajuda a disseminar informações, conscientizando e promovendo mudanças significativas na sociedade.';
  respostas[3, 5] := 'Sim, plataformas online permitem discussões e compartilhamento de perspectivas, gerando consciência coletiva sobre diversos problemas.';
  respostas[3, 6] := 'Não vejo a internet impactando na conscientização. Muitas informações são distorcidas, dificultando diferir a verdade da mentira. ';
  respostas[3, 7] := 'Não vejo como a internet pode ser eficaz na conscientização. As pessoas geralmente ignoram informações importantes online.';
  respostas[3, 8] := 'Sim, a internet cria bolhas informativas, expondo as pessoas a perspectivas semelhantes, intensificando a polarização e os conflitos.';
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
