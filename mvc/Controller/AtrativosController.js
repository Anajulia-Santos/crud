// const { path } = require('express/lib/application.js')
// const AtractionDAO = require('../DAO/AtractionsDAO.js')

// module.exports = (app) => {

//     app.get("/getAllAtrativos", async (req, res) => {        
//         const atractionDAO = new AtractionDAO()

//         res.setHeader("Access-Control-Allow-Origin", "*")
//         //Retorna no formato Json
//         res.json(await atractionDAO.consultarTodos())        
//     })
//         // app.get("/atrativos", async (req, res) => {    
//         //     res.sendFile(path.resolve() )    
//         // })
//     app.post("/atrativos",  async (req, res) => {})

//         app.delete("/atrativos/:id" , async (req, res) => {
//             res.setHeader("Access-Control-Allow-Origin", "*")
//             const atractionDAO = new AtractionDAO
//             const status = await atractionDAO.apagar(req.params.id)

//             res.json(
//                 status
//             )
//         })
// }
const AtratDAO = require('../DAO/AtractionsDAO.js')
const path = require('path')
const multer = require('multer');
const crypto = require('crypto');
const fs = require('fs').promises;

const storage = multer.diskStorage({
    destination: function (req, file, cb){
        cb(null, path.join(__dirname, '..', 'views', 'public', 'image', 'upload'))
    },
    filename: function(req, file, cb){
        const extensao = path.extname(file.originalname);
        const nomeArquivo = crypto.createHash('md5').update(file.originalname + Date.now().toString()).digest('hex') + extensao
        cb(null, nomeArquivo)
    },
});
const atratDAO = new AtratDAO();
const upload = multer({ storage: storage });

module.exports = (app) => {


    // Todos os gets
    app.get("/Atrativo", async (req, res) => {        
        const atratDAO = new AtratDAO()
        
        res.setHeader("Access-Control-Allow-Origin","*")
        res.json(await atratDAO.consultarTodos())        
    })
         
    app.get("/atrativos", (req, res) => {
        res.sendFile(path.resolve("mvc/views/ctrldev/atrativos/listattractions.html"))
    })

    app.get("/addatrativos", (req, res) => {
        res.sendFile(path.resolve("mvc/views/ctrldev/atrativos/addattractions.html"))
    })

    app.get("/alteratrativo/:id", async (req, res) =>{
        
        const atrativo = new AtratDAO()        
        const r = await atrativo.consultarUm(req.params.id)
        console.log(r)
        res.render('atrativos/alteratrativos', { r })
    })

    app.get("/addatrativo", (req, res) => {
        res.sendFile(path.resolve('mvc/views/ctrldev/Atrativos/addattractions.html')) 
    })



    // Todos os post
    app.post('/registraratrativo', upload.single('fileatrat'), async (req, res) => {
        console.log(req)
        try{
            const extensao = path.extname(req.file.originalname);
            const nomeArquivo = crypto.createHash('md5').update(req.file.originalname + Date.now().toString()).digest('hex') + extensao;

            const caminhoDestino = path.join(__dirname, '..', 'views', 'public', 'image', 'upload', nomeArquivo);

            await fs.rename(req.file.path, caminhoDestino);

            console.log('Upload Bem Sucedido!')

            console.log(req.body)
            const { 
            id: id,
            txtnameatrat: nome, 
            txtlatatrat: lat,
            txtlongatrat: long,
            txtdescatrat: desc  } = req.body;

            res.setHeader("Access-Control-Allow-Origin","*")
                
            let status;

            if(!id){
                status = await atratDAO.registraratrativo(nome, lat, long, nomeArquivo, desc)
            }
            else{
                status = await atratDAO.atualizar(id, nome, nomeArquivo, lat, long, desc)
            }   

       
            res.redirect("/atrativos")
            }catch(error){
                console.error(error);
                res.status(500).send('Erro ao realizar upload!');
            }
    })


    // Deletar
    app.delete("/atrativo/:id", async (req, res) => {
        res.setHeader("Access-Control-Allow-Origin","*")
        const atrativoDAO = new AtratDAO()

        const status = await atrativoDAO.apagar(req.params.id)

        res.json({
            status
        })
    })


    // Atualizar 
    app.put("/atrativos/:id", async (req, res) =>{
        const atrativoDAO = new AtratDAO()
        
        const {
            nome,
            desc,
            lat,
            long,
            image,
            id
        } = req.body;

        console.log({nome, desc, lat, long, image, id})
      
        if(id == req.params.id){
          const r =  await atrativoDAO.atualizar(nome, lat, long, image, desc, id)
          res.json({msg: "O total de linhas alteradas: "+ r})
        }
        else{
          res.json({msg:"ERRO."})
        }         
    })
}