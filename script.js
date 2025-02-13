// SERVIDOR

const { Client } = require("pg");

// Configurações de conexão
const client = new Client({
  connectionString:
    "postgres://admin1:minhasenha@banco-de-dados-1.cbc2awwuyh7t.us-east-1.rds.amazonaws.com:5432/banco-de-dados-1",
});

// Conectar ao banco de dados
client
  .connect()
  .then(() => {
    console.log("Conexão bem-sucedida!");

    // Realizar uma consulta simples (exemplo)
    return client.query("SELECT NOW()");
  })
  .then((res) => {
    console.log("Resultado da consulta:", res.rows);
  })
  .catch((err) => {
    console.error("Erro ao conectar ao banco de dados:", err.stack);
  })
  .finally(() => {
    // Fechar a conexão quando terminar
    client.end();
  });

// import http from 'node:http';
// import url from 'node:url';

// const server = http.createServer();

// server.on('request', (request,response) => {

// })

// server.listen(8000);

// TELA LOGIN

const formLogin = document.getElementById("form-login");
const botaoLogin = document.getElementById("botao-login");
const entradaUsuario = document.getElementById("usuario");
const entradaSenha = document.getElementById("senha");

botaoLogin.addEventListener("click", (e) => {
  e.preventDefault();

  const usuario = entradaUsuario.value.trim();
  const senha = entradaSenha.value.trim();

  if (usuario && senha) {
    if (usuario === "admin" && senha === "123") {
      // alert('Login efetuado com sucesso!');
      window.location.href = "projetoWeb.html";
    } else {
      alert("Usuário ou senha inválidos");
    }
  } else {
    alert("Preencha todos os campos!");
  }
});
