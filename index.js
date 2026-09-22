const express = require('express');
const mysql = require('mysql2/promise');
const cors = require('cors');

const app = express();
app.use(cors());
const port = 3000;

async function getDadosCrus() {
    const connection = await mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'imobiliaria'
    });

    const sql = `
        SELECT 
            p.id_venda,
            p.data_pagamento AS 'data_do_pagamento',
            p.valor_pagamento AS 'valor_do_pagamento',
            i.codigo_imovel,
            i.descricao_imovel AS 'descricao_imovel',
            t.nome_tipo AS 'tipo_imovel'
        FROM pagamento p
        JOIN imovel i ON p.codigo_imovel = i.codigo_imovel
        JOIN tipo_imovel t ON i.id_tipo = t.id_tipo;
    `;

    const [rows] = await connection.execute(sql);
    await connection.end();
    return rows;
}

function calcularAcumuladoPorImovel(dados) {
    const agrupado = dados.reduce((acc, item) => {
        const id = item.codigo_imovel;
        const valor = parseFloat(item.valor_do_pagamento);
        acc[id] = (acc[id] || 0) + valor;
        return acc;
    }, {});

    return Object.entries(agrupado).map(([id, total]) => ({ [id]: total }));
}

function calcularVendasMensais(dados) {
    const agrupado = dados.reduce((acc, item) => {
        const data = new Date(item.data_do_pagamento);
        const mesAno = `${String(data.getMonth() + 1).padStart(2, '0')}/${data.getFullYear()}`;
        const valor = parseFloat(item.valor_do_pagamento);
        
        acc[mesAno] = (acc[mesAno] || 0) + valor;
        return acc;
    }, {});

    return Object.entries(agrupado).map(([mesAno, total]) => ({ [mesAno]: total }));
}

function calcularPercentualPorTipo(dados) {
    const totalGeral = dados.reduce((acc, item) => acc + parseFloat(item.valor_do_pagamento), 0);

    const agrupado = dados.reduce((acc, item) => {
        const tipo = item.tipo_imovel;
        const valor = parseFloat(item.valor_do_pagamento);
        acc[tipo] = (acc[tipo] || 0) + valor;
        return acc;
    }, {});

    return Object.entries(agrupado).map(([tipo, total]) => {
        const percentual = ((total / totalGeral) * 100).toFixed(2) + '%';
        return { [tipo]: percentual };
    });
}

app.get('/api/imoveis/acumulado', async (req, res) => {
    try {
        const dados = await getDadosCrus();
        const resultado = calcularAcumuladoPorImovel(dados);
        res.json(resultado);
    } catch (error) {
        console.error("Erro na rota acumulado:", error);
        res.status(500).json({ erro: error.message });
    }
});

app.get('/api/vendas/mensais', async (req, res) => {
    try {
        const dados = await getDadosCrus();
        const resultado = calcularVendasMensais(dados);
        res.json(resultado);
    } catch (error) {
        console.error("Erro na rota mensais:", error);
        res.status(500).json({ erro: error.message });
    }
});

app.get('/api/vendas/percentual-tipo', async (req, res) => {
    try {
        const dados = await getDadosCrus();
        const resultado = calcularPercentualPorTipo(dados);
        res.json(resultado);
    } catch (error) {
        console.error("Erro na rota percentual:", error);
        res.status(500).json({ erro: error.message });
    }
});

app.listen(port, () => {
    console.log(`API rodando em http://localhost:${port}`);
});