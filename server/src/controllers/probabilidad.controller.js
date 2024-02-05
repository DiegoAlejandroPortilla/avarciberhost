import { db } from "../db.js"

export const getProbabilidad = (req, res) => {
    const q = "SELECT * FROM mapadecalor.pro_probabilidad;";

    db.query(q, (err, data) => {
        if (err) return res.status(500).send(err);
        return res.status(200).json(data);
    });
};

export const getProbabilidadId = (req, res) => {
    const q =
        "SELECT * FROM mapadecalor.pro_probabilidad where `pro_codigo` = ?;";

    db.query(q, [req.params.id], (err, data) => {
        if (err) return res.status(500).json(err);

        return res.status(200).json(data[0]);
    });
}

export const addProbabilidad = (req, res) => {
    const q = "INSERT INTO mapadecalor.PRO_PROBABILIDAD (PRO_DESCRIPCION) VALUES (?)";
    const values = [
        req.body.PRO_DESCRIPCION,
    ]
    db.query(q,values, (err, data) => {
        if (err) return err;
        return res.json("La probabilidad ha sido creada")
    });
}

export const deleteProbabilidad = (req, res) => {
    const postId = req.params.id
    console.log(postId)
    const q = "delete from mapadecalor.pro_probabilidad where `PRO_CODIGO` = ?";
    db.query(q, [postId], (err, data) => {
        return res.json("La probabilidad ha sido eliminada");
    })

};

export const updateProbabilidad = (req, res) => {
    const postId = req.params.id
    const { PRO_CODIGO, PRO_DESCRIPCION, PRO_RANGOS } = req.body;
    const q = "update mapadecalor.pro_probabilidad set PRO_DESCRIPCION = ?, PRO_RANGOS = ? where PRO_CODIGO = ?;";
    db.query(q, [req.body.PRO_DESCRIPCION,req.body.PRO_RANGOS,postId], (err, data) => {
        if (err) {
            console.log(err)
            return res.status(500).json(err);
        }
        return res.json("La probabilidad ha sido actualizada")

    });
}