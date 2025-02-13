const { Client } = require("pg");

const client = new Client({
  host: "banco-de-dados-1.cbc2awwuyh7t.us-east-1.rds.amazonaws.com", // Somente o endpoint
  port: 5432,
  user: "admin1",
  password: "teste_2025",
  database: "banco-de-dados-1",
});

client
  .connect()
  .then(() => console.log("✅ Conexão bem-sucedida!"))
  .catch((err) => console.error("❌ Erro ao conectar:", err))
  .finally(() => client.end());
