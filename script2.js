// INFORMAÇÕES

document.addEventListener("DOMContentLoaded", () => {
  const imagens = document.querySelectorAll(".imagem-negativa");

  imagens.forEach((imagem) => {
    let rotacaoAtual = 0;

    imagem.addEventListener("click", () => {
      rotacaoAtual += 180;
      imagem.style.transform = `rotate(${rotacaoAtual}deg)`;

      const divAjuda = imagem.parentElement.nextElementSibling;

      if (divAjuda && divAjuda.classList.contains("lista-informacoes-ajuda")) {
        divAjuda.classList.toggle("ativa");
      }
    });
  });
});

// ABRIR CABECALHO
const menuCabecalho = document.querySelector(".tela-usuario");

function abrirCabecalho() {
  if (
    menuCabecalho.style.display === "none" ||
    menuCabecalho.style.display === ""
  ) {
    menuCabecalho.style.display = "flex";
  } else {
    menuCabecalho.style.display = "none";
  }
}

// MENU PRINCIPAL

function alternarMenu() {
  const menu = document.querySelector(".bloco-menu-principal");
  const botao = document.querySelector(".botao-seta-direita");
  menu.classList.toggle("fechar");
  if (menu.classList.contains("fechar")) {
    botao.src = "/Imagens/icone-seta-direita.png";
  } else {
    botao.src = "/Imagens/icone-seta-esquerda.png";
  }
}

document
  .querySelector(".botao-seta-direita")
  .addEventListener("click", alternarMenu);

// MENU FERRAMENTAS

function alternarMenu2() {
  const menu2 = document.querySelector(".bloco-menu-ferramentas");
  const botao2 = document.querySelector(".botao-seta-esquerda");
  menu2.classList.toggle("fechar2");

  if (menu2.classList.contains("fechar2")) {
    botao2.src = "/Imagens/icone-seta-esquerda.png";
  } else {
    botao2.src = "/Imagens/icone-seta-direita.png";
  }
}

document
  .querySelector(".botao-seta-esquerda")
  .addEventListener("click", alternarMenu2);

// FUNÇÃO ICONES MENU PRINCIPAL

const botoesMenuPrincipal = document.querySelectorAll(".botoes-menu-principal");
const telasMenuPrincipal = document.querySelectorAll(".tela-cadastro");

botoesMenuPrincipal.forEach((item) => {
  item.addEventListener("click", () => {
    const idProcurado = item.getAttribute("data-target");
    const divAberta = document.getElementById(idProcurado);

    telaFormularios.forEach((form) => form.classList.remove("ativo"));
    telaConsultas.forEach((form) => form.classList.remove("ativo"));
    telaFinanceiro.forEach((form) => form.classList.remove("ativo"));
    telaAlmoxarifado.forEach((form) => form.classList.remove("ativo"));
    telaUsuario.forEach((form) => form.classList.remove("ativa"));
    telaManutencao.forEach((form) => form.classList.remove("ativa"));

    if (divAberta.classList.contains("ativa")) {
      divAberta.classList.remove("ativa");
    } else {
      telasMenuPrincipal.forEach((div) => div.classList.remove("ativa"));
      divAberta.classList.add("ativa");
    }
  });
});

const botoesFormularios = document.querySelectorAll(".botao-cadastro");
const telaFormularios = document.querySelectorAll(".formularios");

botoesFormularios.forEach((botao) => {
  botao.addEventListener("click", () => {
    const idFormulario = botao.getAttribute("data-form");
    const formulario = document.getElementById(idFormulario);

    telasMenuPrincipal.forEach((tela) => tela.classList.remove("ativa"));

    telaFormularios.forEach((form) => form.classList.remove("ativo"));
    formulario.classList.add("ativo");
  });
});

const telaConsultas = document.querySelectorAll(".consultas");

botoesFormularios.forEach((botao) => {
  botao.addEventListener("click", () => {
    const idConsulta = botao.getAttribute("data-form");
    const consulta = document.getElementById(idConsulta);

    telasMenuPrincipal.forEach((tela) => tela.classList.remove("ativa"));

    telaConsultas.forEach((form) => form.classList.remove("ativo"));
    consulta.classList.add("ativo");
  });
});

const telaFinanceiro = document.querySelectorAll(".financeiro");

botoesFormularios.forEach((botao) => {
  botao.addEventListener("click", () => {
    const idFinanceiro = botao.getAttribute("data-form");
    const financeiro = document.getElementById(idFinanceiro);

    telasMenuPrincipal.forEach((tela) => tela.classList.remove("ativa"));

    telaFinanceiro.forEach((form) => form.classList.remove("ativo"));
    financeiro.classList.add("ativo");
  });
});

const telaAlmoxarifado = document.querySelectorAll(".almoxarifado");

botoesFormularios.forEach((botao) => {
  botao.addEventListener("click", () => {
    const idAlmoxarifado = botao.getAttribute("data-form");
    const almoxarifado = document.getElementById(idAlmoxarifado);

    telasMenuPrincipal.forEach((tela) => tela.classList.remove("ativa"));

    telaAlmoxarifado.forEach((form) => form.classList.remove("ativo"));
    almoxarifado.classList.add("ativo");
  });
});

const botoesUsuario = document.querySelectorAll(".botao-usuario");
const telaUsuario = document.querySelectorAll(".usuario");

botoesUsuario.forEach((botao) => {
  botao.addEventListener("click", () => {
    const idUsuario = botao.getAttribute("data-form");
    const usuario = document.getElementById(idUsuario);

    menuCabecalho.style.display = "none";
    telasMenuPrincipal.forEach((tela) => tela.classList.remove("ativa"));
    telaFormularios.forEach((form) => form.classList.remove("ativo"));
    telaConsultas.forEach((form) => form.classList.remove("ativo"));
    telaFinanceiro.forEach((form) => form.classList.remove("ativo"));
    telaAlmoxarifado.forEach((form) => form.classList.remove("ativo"));
    telaManutencao.forEach((form) => form.classList.remove("ativa"));

    telaUsuario.forEach((form) => form.classList.remove("ativa"));
    usuario.classList.add("ativa");
  });
});

const telaManutencao = document.querySelectorAll(".manutencao");

botoesFormularios.forEach((botao) => {
  botao.addEventListener("click", () => {
    const idManutencao = botao.getAttribute("data-form");
    const manutencao = document.getElementById(idManutencao);

    telasMenuPrincipal.forEach((tela) => tela.classList.remove("ativa"));

    telaManutencao.forEach((form) => form.classList.remove("ativa"));
    manutencao.classList.add("ativa");
  });
});

// SALVAR FORMULARIO

// FECHAR FORMULARIO

// CONSULTAS

function openTab(event, tabId) {
  var contents = document.querySelectorAll(".tab-content");
  contents.forEach(function (content) {
    content.classList.remove("active-content");
  });

  var tabs = document.querySelectorAll(".tab");
  tabs.forEach(function (tab) {
    tab.classList.remove("active-tab");
  });

  document.getElementById(tabId).classList.add("active-content");

  event.currentTarget.classList.add("active-tab");
}

// SAIR DO SISTEMA

const botaoSair = document.getElementById("botao-sair");

botaoSair.addEventListener("click", function () {
  window.location.href = "telaLogin.html";
});
