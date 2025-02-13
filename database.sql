CREATE DATABASE sistema_web_db;

-- CADASTRO DE CLIENTE

CREATE TABLE IF NOT EXISTS public.clientes(
  id_cliente SERIAL PRIMARY KEY,
  origem_cliente TEXT REFERENCES origem_clientes(nome_origem_cliente) NOT NULL,
  cadastro_cliente DATE NOT NULL,
  tipo_cliente TEXT NOT NULL,
  cnpj_cliente CHAR NOT NULL,
  ie_cliente VARCHAR NOT NULL,
  rt_cliente TEXT NOT NULL,
  razao_cliente TEXT NOT NULL,
  nome_cliente TEXT NOT NULL,
  cep_cliente CHAR NOT NULL,
  endereco_cliente TEXT NOT NULL,
  n_cliente TEXT,
  complemento_cliente TEXT,
  bairro_cliente TEXT NOT NULL,
  cidade_cliente TEXT NOT NULL,
  uf_cliente TEXT NOT NULL,
  situacao_cliente BOOLEAN,
  segmentos_cliente TEXT NOT NULL,
  email_principal_cliente VARCHAR NOT NULL,
  email_nfe_cliente VARCHAR NOT NULL,
  email_md_cliente VARCHAR NOT NULL,
  grupo_cliente TEXT,
  vendedor_cliente TEXT NOT NULL,
  cobranca_cliente TEXT NOT NULL,
  comissao_cliente BOOLEAN,
  obrigatorias_cliente TEXT,
  forma_pgto_cliente TEXT REFERENCES forma_pagamento(nome_pagamento) NOT NULL,
  forma_lib_cliente TEXT REFERENCES forma_liberacao(nome_pagamento) NOT NULL,
  projecao_cliente BOOLEAN,
  valor_projecao_cliente NUMBER,
  score_cliente NUMBER,
  ultima_compra_cliente DATE,
  limite_credito_cliente NUMBER,
  limite_total_cliente NUMBER,
  bloqueio_cliente TEXT
)

CREATE TABLE IF NOT EXISTS public.forma_pagamento(
  id_pagamento SERIAL PRIMARY KEY,
  nome_pagamento TEXT NOT NULL
)

CREATE TABLE IF NOT EXISTS public.forma_liberacao(
  id_liberacao SERIAL PRIMARY KEY,
  nome_liberacao TEXT NOT NULL
)

CREATE TABLE IF NOT EXISTS public.origem_cliente(
  id_origem_cliente SERIAL PRIMARY KEY,
  nome_origem_cliente TEXT NOT NULL
)

CREATE TABLE IF NOT EXISTS public.transportadoras_cliente(
  cnpj TEXT REFERENCES transportadoras(cnpj_transportadora) NOT NULL,
  transportadora TEXT REFERENCES transportadoras(nome_transportadora) NOT NULL,
  telefone CHAR REFERENCES contatos.transportadora(celular_Transportadora) NOT NULL
)

CREATE TABLE IF NOT EXISTS public.referencias_cliente(
  cnpj_referencia CHAR NOT NULL,
  razao_referencia TEXT NOT NULL,
  credito_referencia NUMBER NOT NULL
)

CREATE TABLE IF NOT EXISTS public.contas_cliente(
  banco TEXT NOT NULL,
  agencia NUMBER NOT NULL,
  conta NUMBER NOT NULL,
  tipo TEXT NOT NULL,
  titular TEXT NOT NULL,
  chave_pix TEXT
)

CREATE TABLE IF NOT EXISTS public.consulta_serasa(
  data_consulta DATE NOT NULL,
  n_consulta NUMBER NOT NULL,
  fundacao_abertura DATE NOT NULL,
  banco TEXT NOT NULL,
  observacao TEXT
)

CREATE TABLE IF NOT EXISTS public.pontuacao_score(
  observacao TEXT NOT NULL,
  pontuacao NUMBER NOT NULL
)

CREATE TABLE IF NOT EXISTS public.contatos_cliente(
  setor_c TEXT NOT NULL,
  nome_c TEXT NOT NULL,
  celular_c CHAR NOT NULL,
  email_c VARCHAR NOT NULL
)

-- CADASTRO DE GRUPO

CREATE TABLE IF NOT EXISTS public.grupos(
  id_grupo SERIAL PRIMARY KEY,
  tipo_grupo TEXT NOT NULL,
  nome_grupo TEXT NOT NULL
)

CREATE TABLE IF NOT EXISTS public.clientes_grupo(
  cnpj_g CHAR REFERENCES clientes(cnpj_cliente) NOT NULL,
  razao_g TEXT REFERENCES clientes(razao_cliente) NOT NULL,
  limite_credito_g NUMBER REFERENCES clientes(limite_credito_cliente),
  projecao_g NUMBER REFERENCES clientes(projecao_cliente),
  limite_total_g NUMBER REFERENCES clientes(limite_total_cliente)
)

-- CADASTRO DE FORNECEDOR

CREATE TABLE IF NOT EXISTS public.fornecedores(
  id_fornecedor SERIAL PRIMARY KEY,
  cnpj_fornecedor CHAR NOT NULL,
  ie_fornecedor VARCHAR NOT NULL,
  rt_fornecedor TEXT NOT NULL,
  razao_fornecedor TEXT NOT NULL,
  nome_fornecedor TEXT NOT NULL,
  cep_fornecedor CHAR NOT NULL,
  endereco_fornecedor TEXT NOT NULL,
  n_fornecedor TEXT,
  complemento_fornecedor TEXT,
  bairro_fornecedor TEXT NOT NULL,
  cidade_fornecedor TEXT NOT NULL,
  uf_fornecedor TEXT NOT NULL,
  situacao_fornecedor BOOLEAN,
  segmentos_fornecedor TEXT NOT NULL,
  faturamento_fornecedor TEXT NOT NULL,
  minimo_fornecedor NUMBER NOT NULL,
  periodo_fornecedor TEXT NOT NULL,
  defeitos_fornecedor BOOLEAN,
  defeitos_condicao_fornecedor TEXT,
  ipi_fornecedor TEXT NOT NULL,
  boleto_fornecedor TEXT NOT NULL,
  st_fornecedor TEXT NOT NULL,
  troca_fornecedor TEXT NOT NULL,
  desconto_troca_fornecedor NUMBER,
  tabelas_fornecedor TEXT,
  cx_aberta_fornecedor BOOLEAN,
  cx_aberta_condicao_fornecedor TEXT,
  cif_fornecedor BOOLEAN,
  onde_fornecedor TEXT,
  antecipado_fornecedor TEXT,
  avista_fornecedor TEXT,
  aprazo_fornecedor TEXT NOT NULL,
  progressivo_fornecedor TEXT,
  informacoes_fornecedor TEXT,
  envio_fornecedor TEXT NOT NULL,
  comissao_fornecedor NUMBER NOT NULL,
  posicao_fornecedor TEXT NOT NULL,
  mostruario_fornecedor TEXT REFERENCES funcionarios(nome_funcionario) NOT NULL,
  vales_fornecedor TEXT REFERENCES funcionarios(nome_funcionario) NOT NULL,
  email_sim_fornecedor BOOLEAN,
  email_pedido_fornecedor VARCHAR NOT NULL,
  pgto_comissao_fornecedor TEXT NOT NULL,
  baixa_boleto_fornecedor TEXT NOT NULL,
  condicoes_fornecedor TEXT
)

CREATE TABLE IF NOT EXISTS public.formulas_fornecedor(
  fornecedor_tabela TEXT NOT NULL,
  calculo_tabela NUMBER NOT NULL,
  fator_operador TEXT NOT NULL,
  formula_tabela TEXT NOT NULL,
  acrescimo_reducao NUMBER,
  desconto NUMBER,
  fator_cobranca NUMBER NOT NULL,
  fator_operador_2 TEXT NOT NULL,
  formula TEXT NOT NULL,
  observacao TEXT,
  inativo BOOLEAN
)

CREATE TABLE IF NOT EXISTS public.contatos_fornecedor(
  setor_f TEXT NOT NULL,
  nome_f TEXT NOT NULL,
  celular_f CHAR NOT NULL,
  email_f VARCHAR NOT NULL
)

-- CADASTRO DE PRODUTOS

CREATE TABLE IF NOT EXISTS public.produtos(
  id_produto SERIAL PRIMARY KEY,
  categoria_produto TEXT NOT NULL,
  fornecedor_produto TEXT REFERENCES fornecedores(nome_fornecedor) NOT NULL,
  un_produto BOOLEAN,
  descricao_produto TEXT NOT NULL,
  referencia_produto TEXT NOT NULL,
  qtde_produto NUMBER NOT NULL,
  preco_produto NUMBER NOT NULL,
  embalagem_produto TEXT REFERENCES embalagens(nome_embalagem) NOT NULL,
  ipi_produto NUMBER,
  promo_produto NUMBER,
  sortimento_produto TEXT NOT NULL,
  posicao_produto TEXT REFERENCES posicoes(nome_posicao) NOT NULL,
  observacao_produto TEXT,
  inmetro_produto BOOLEAN,
  indisponivel_produto BOOLEAN,
  nconformidade_produto BOOLEAN
)

CREATE TABLE IF NOT EXISTS public.embalagens(
  id_embalagem SERIAL PRIMARY KEY,
  nome_embalagem TEXT NOT NULL
)

CREATE TABLE IF NOT EXISTS public.posicoes(
  id_posicao SERIAL PRIMARY KEY,
  nome_posicao TEXT NOT NULL
)

-- PEDIDOS / PROSPECÇÕES

CREATE TABLE IF NOT EXISTS public.pedidos(
  id_pedido SERIAL PRIMARY KEY,
  tipo_pedido TEXT NOT NULL,
  programacao_pedido DATE,
  grupo_pedido BOOLEAN,
  nome_grupo_pedido TEXT REFERENCES grupos(nome_grupo),
  cnpj_cliente_pedido CHAR REFERENCES clientes(cnpj_cliente) NOT NULL,
  razao_cliente_pedido TEXT REFERENCES clientes(nome_cliente) NOT NULL,
  fornecedor_pedido TEXT REFERENCES fornecedores (nome_fornecedor) NOT NULL,
  tipo_tabela_pedido TEXT NOT NULL,
  desconto1_pedido NUMBER,
  desconto2_pedido NUMBER,
  desconto3_pedido NUMBER,
  desconto4_pedido NUMBER,
  media_pedido NUMBER,
  titular_pedido TEXT REFERENCES funcionarios(nome_funcionario) NOT NULL,
  origem_pedido TEXT REFERENCES origem_pedido(nome_origem_cliente) NOT NULL,
  sazonal_pedido BOOLEAN,
  tipo_sazonal_pedido TEXT REFERENCES sazonal(nome_sazonal),
  frete_pedido TEXT NOT NULL,
  saldo_pedido BOOLEAN,
  faturar_pedido DATE,
  despachar_pedido DATE,
  cnpj_transportadora_pedido CHAR REFERENCES transportadoras(cnpj_transportadora),
  razao_transportadora_pedido TEXT REFERENCES transportadoras(razao_transportadora),
  condicao_pedido TEXT NOT NULL,
  boleto_pedido TEXT,
  prazoe_pedido TEXT,
  observacao_pedido TEXT
)

CREATE TABLE IF NOT EXISTS public.origem_pedido(
  id_origem_pedido SERIAL PRIMARY KEY,
  nome_origem_pedido TEXT NOT NULL
)

CREATE TABLE IF NOT EXISTS public.sazonal(
  id_sazonal SERIAL PRIMARY KEY,
  nome_sazonal TEXT NOT NULL
)

CREATE TABLE IF NOT EXISTS public.produtos_pedido(
  nº SERIAL,
  referencia TEXT NOT NULL,
  descricao TEXT NOT NULL,
  qtd NUMBER NOT NULL,
  un TEXT NOT NULL,
  preco NUMBER NOT NULL,
  ipi NUMBER NOT NULL,
  promo NUMBER NOT NULL,
  desc NUMBER NOT NULL,
  total NUMBER NOT NULL
)

CREATE TABLE IF NOT EXISTS public.prospeccoes(
  id_prospeccao SERIAL PRIMARY KEY,
  cnpj_prospeccao CHAR REFERENCES clientes(cnpj_cliente) NOT NULL,
  razao_prospeccao TEXT REFERENCES clientes(razao_cliente) NOT NULL,
  contato_prospeccao TEXT NOT NULL,
  data_prospeccao DATE NOT NULL,
  retorno_prospeccao DATE NOT NULL,
  vendedor_prospeccao TEXT NOT NULL,
  assunto_prospeccao TEXT NOT NULL
)

-- CADASTRO DE TRANSPORTADORA

CREATE TABLE IF NOT EXISTS public.transportadoras(
  id_transportadora SERIAL PRIMARY KEY,
  cnpj_transportadora CHAR NOT NULL,
  ie_transportadora VARCHAR NOT NULL,
  razao_transportadora TEXT NOT NULL,
  nome_transportadora TEXT NOT NULL,
  cep_transportadora CHAR NOT NULL,
  endereco_transportadora TEXT NOT NULL,
  n_transportadora TEXT,
  complemento_transportadora TEXT,
  bairro_transportadora TEXT NOT NULL,
  cidade_transportadora TEXT NOT NULL,
  uf_transportadora TEXT NOT NULL,
  situacao_transportadora BOOLEAN
)

CREATE TABLE IF NOT EXISTS public.contatos_transportadora(
  nº SERIAL,
  setor TEXT  NOT NULL,
  nome TEXT NOT NULL,
  celular CHAR NOT NULL, 
  ramal NUMBER,
  email VARCHAR NOT NULL
)

-- CADASTRO DE FUNCIONARIOS

CREATE TABLE IF NOT EXISTS public.funcionarios(
  id_funcionario SERIAL PRIMARY KEY,
  cpf_funcionario CHAR NOT NULL,
  rg_funcionario VARCHAR NOT NULL,
  nascimento_funcionario DATE NOT NULL,
  nome_funcionario TEXT NOT NULL,
  sexo_funcionario TEXT NOT NULL,
  cep_funcionario CHAR NOT NULL,
  endereco_funcionario TEXT NOT NULL,
  n_funcionario TEXT,
  complemento_funcionario TEXT,
  bairro_funcionario TEXT NOT NULL,
  cidade_funcionario TEXT  NOT NULL,
  uf_funcionario TEXT  NOT NULL,
  celular1_funcionario CHAR NOT NULL,
  celular2_funcionario CHAR,
  email_funcionario VARCHAR NOT NULL,
  situacao_funcionario BOOLEAN,
  usuario_funcionario TEXT NOT NULL,
  emailinterno_funcionario VARCHAR NOT NULL,
  contratacao_funcionario DATE NOT NULL,
  setor_funcionario TEXT NOT NULL,
  funcao_funcionario TEXT NOT NULL,
  categoria_funcionario TEXT,
  demissao_funcionario DATE
)

CREATE TABLE IF NOT EXISTS public.contatos_funcionario(
  nome_fc TEXT NOT NULL,
  celular_fc CHAR NOT NULL,
  parentesco TEXT NOT NULL
)














