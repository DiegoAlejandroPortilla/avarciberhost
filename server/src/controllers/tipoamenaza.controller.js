import { db } from "../db.js"

export const getTAmenazas = (req, res) => {
    const q = "SELECT * FROM mapadecalor.tia_tipoamenaza;";

    db.query(q, (err, data) => {
        if (err) return res.status(500).send(err);
        return res.status(200).json(data);
    });
};

export const getTAmenazaId = (req, res) => {
    const q =
        "SELECT * FROM mapadecalor.tia_tipoamenaza where `tia_codigo` = ?;";

    db.query(q, [req.params.id], (err, data) => {
        if (err) return res.status(500).json(err);

        return res.status(200).json(data[0]);
    });
}

export const addTAmenaza = (req, res) => {
    const q = "INSERT INTO mapadecalor.tia_tipoamenaza(TIA_DESCRIPCION) VALUES (?)";
    const values = [
        req.body.Descripcion,
    ]
    db.query(q, [req.body.Descripcion], (err, data) => {
        if (err)
        {
            console.log(err);
            return err;
        } 
        return res.json("El tipo amenaza ha sido creado")
    });
}

export const deleteTAmenaza = (req, res) => {
    const postId = req.params.id
    console.log(postId)
    const q = "delete from mapadecalor.tia_tipoamenaza where `TIA_CODIGO` = ?";
    db.query(q, [postId], (err, data) => {
        return res.json("El tipo amenaza ha sido eliminado");
    })

};

export const updateTAmenaza = (req, res) => {
    const postId = req.params.id
    //const q = "UPDATE posts SET `title`=?,`desc`=?,`img`=?,`cat`=? WHERE `id` = ? AND `uid` = ?";
    const q = "update mapadecalor.tia_tipoamenaza set `TIA_DESCRIPCION` = ? where `TIA_CODIGO` = ?;";

    const values = [
        req.body.Descripcion,
    ]
    db.query(q, [req.body.Descripcion, postId], (err, data) => {
        if (err) {
            console.log(err)
            return res.status(500).json(err);
        }
        return res.json("El tipo amenaza ha sido actualizado")

    });
}