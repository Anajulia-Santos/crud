var mysql = require('mysql2')

class databaseMysql {

    #connection

    constructor() {
        this.#connection = mysql.createPool({
            host: 'localhost',
            user: 'root',
            password: '',
            database: 'bdgp'
        }).promise();
    }

    async selectSkin() {
        const query = await connection.query('select * from skin')
        return query[0]
    }
    async selectPersonagem() {
        const query = await connection.query('select * from personagem')
        return query[0]
    }

    async selectAtrativos() {
        const query = await this.#connection.query('select * from atrativos')
        return query[0]
    }

    async SelectCoins() {
        const query = await connection.query('select * from coins')
        return query[0]
    }
    async SelectMissoes() {
        const query = await connection.query('select * from missoes')
        return query[0]
    }

    async insertAtrativo(param) {
        const sql = `insert into atrativos (nome_atrativo, lat_atrativo, long_atrativo, desc_atrativo, image_atrativo)
         values ('${param.nome}','${param.latitude}','${param.longitude}','${param.descricao}','${param.imagem}')`

        const query = await this.#connection.execute(sql)
        return query[0]
    }
    async selectAtrativos() {
        const query = await this.#connection.query('select * from atrativos where id_atrativos =')
        return query[0]
    }
    async deleteAtrativos(id) {
        const sql = `delete from atrativos where id_atrativos =` + id

        const res = await this.#connection.execute(sql)
        return res[0]
    }

    async updateAtrativos(id, nome, lat, long, desc, image) {
        `update atrativo
            set nome_atrativo = ${nome},
                lat_atrativo = ${lat},
                long_atrativo = ${long},
                desc_atrativo = ${desc},
                image_atrativo = ${image}
                where id_atrativos = ${id}
        `

        const r = await this.#connection.execute(sql)
        return r[0]
    }
}

// var connection = mysql.createPool({
//     host: 'localhost',
//     user: 'root',
//     password: '',
//     database: 'bdgp'
// }).promise();

// function SelectPersonagem() {
//     connection.connect();

//     connection.query('SELECT PER_NOME FROM PERSONAGENS', function (error, results, fields) {
//         if (error) throw error;
//         console.log('The solution is: ', results[0].PER_NOME);
//     });

//     connection.end();
// }

// SelectPersonagem()

// function SelectItens() {
//     // Conexão ao banco de dados
//     connection.connect();

//     // Consulta dos bd
//     connection.query('SELECT * FROM item', (error, results, fields) => {
//         if (error) throw error;
//         console.log(results)
//     })
//     connection.end();
// }
// module.exports = {
//     SelectItens
// }



module.exports = databaseMysql
