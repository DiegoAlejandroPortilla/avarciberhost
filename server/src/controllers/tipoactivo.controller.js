import { db } from "../db.js"

export const getTActivos = (req, res) => {
    const q = "SELECT * FROM mapadecalor.tac_tipoactivo;";

    db.query(q, (err, data) => {
        if (err) return res.status(500).send(err);
        return res.status(200).json(data);
    });
};

export const getTActivoId = (req, res) => {
    const q =
        "SELECT * FROM mapadecalor.tac_tipoactivo where `tac_codigo` = ?;";

    db.query(q, [req.params.id], (err, data) => {
        if (err) return res.status(500).json(err);

        return res.status(200).json(data[0]);
    });
}

export const addTActivo = (req, res) => {
    const q = "INSERT INTO mapadecalor.tac_tipoactivo(TAC_DESCRIPCION) VALUES (?)";
    const values = [
        req.body.Descripcion,
    ]
    db.query(q, [values], (err, data) => {
        if (err) return err;
        return res.json("El tipo activo ha sido creado")
    });
}

export const deleteTActivo = (req, res) => {
    const postId = req.params.id
    console.log(postId)
    const q = "delete from mapadecalor.tac_tipoactivo where `TAC_CODIGO` = ?";
    db.query(q, [postId], (err, data) => {
        return res.json("El tipo activo ha sido eliminado");
    })

};

export const updateTActivo = (req, res) => {
    const postId = req.params.id
    //const q = "UPDATE posts SET `title`=?,`desc`=?,`img`=?,`cat`=? WHERE `id` = ? AND `uid` = ?";
    const q = "update mapadecalor.tac_tipoactivo set `TAC_DESCRIPCION` = ? where `TAC_CODIGO` = ?;";

    const values = [
        req.body.Descripcion,
    ]
    db.query(q, [req.body.Descripcion, postId], (err, data) => {
        if (err) {
            console.log(err)
            return res.status(500).json(err);
        }
        return res.json("El activo ha sido actualizado")

    });
}