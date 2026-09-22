# api-dashboard-imobiliaria
API e painel web para processamento de dados financeiros, transformando registros de vendas em dashboards para gestão imobiliária.

# 🏢 API para Dashboard Imobiliário

## Sobre o Projeto
Sistema backend desenvolvido para processar o fluxo de caixa de uma construtora/imobiliária, transformando milhares de registros de vendas em dados mastigados para visualização gráfica da diretoria.

## Tecnologias Utilizadas
* **Node.js + Express:** Construção da API REST.
* **MySQL:** Banco de dados relacional contendo o histórico de vendas, tipos de imóveis e pagamentos.
* **JavaScript (Programação Funcional):** Uso intensivo de `map` e `reduce` na memória do servidor para agregar dados financeiros (Acumulado por imóvel, Vendas Mensais e Percentual por Tipo) de forma performática, sem sobrecarregar o banco de dados.
* **HTML/JS (Fetch API):** Painel web simulando o consumo dos dados em JSON.

## Como rodar este projeto
1. Importe o arquivo `imobiliaria.sql` no seu banco de dados MySQL.
2. Altere as credenciais de acesso ao banco no arquivo `index.js`.
3. No terminal, rode `npm install` para baixar as dependências.
4. Inicie o servidor com `node index.js`.
5. Abra o arquivo `painel.html` no navegador para visualizar os dados.
