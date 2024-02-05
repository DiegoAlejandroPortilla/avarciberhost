import { db } from "../db.js"

export const getDimenVal = (req, res) => {
    const q = "SELECT * FROM mapadecalor.div_dimensionvaloracion;";

    db.query(q, (err, data) => {
        if (err) return res.status(500).send(err);
        return res.status(200).json(data);
    });
};

export const getTDimenValId = (req, res) => {
    const q =
        "SELECT * FROM mapadecalor.div_dimensionvaloracion where `DIV_CODIGO` = ?;";

    db.query(q, [req.params.id], (err, data) => {
        if (err) return res.status(500).json(err);

        return res.status(200).json(data[0]);
    });
}

export const addDimenVal = (req, res) => {
    const q = "INSERT INTO mapadecalor.div_dimensionvaloracion(DIV_NOMBRE, DIV_DESCRIPCION) VALUES (?,?)";
    const values = [
        req.body.Descripcion,
        req.body.Nombre,
    ]
    console.log(values)
    db.query(q, [req.body.Nombre, req.body.Descripcion], (err, data) => {
        if (err) {
            console.log(err);
            return (err)
        }
        return res.json("El tipo amenaza ha sido creado")
    });
}

export const deleteDimenVal = (req, res) => {
    const postId = req.params.id
    console.log(postId)
    const q = "delete from mapadecalor.div_dimensionvaloracion where `DIV_CODIGO` = ?";
    db.query(q, [postId], (err, data) => {
        return res.json("El tipo amenaza ha sido eliminado");
    })

};

export const updateDimenVal = (req, res) => {
    const postId = req.params.id;
    //const q = "UPDATE posts SET `title`=?,`desc`=?,`img`=?,`cat`=? WHERE `id` = ? AND `uid` = ?";
    const q = "UPDATE mapadecalor.div_dimensionvaloracion SET `DIV_NOMBRE` = ?, `DIV_DESCRIPCION` = ? WHERE `DIV_CODIGO` = ?";

    db.query(q, [req.body.Nombre, req.body.Descripcion, postId], (err, data) => {
        if (err) {
            console.log(err);
            return res.status(500).json(err);
        }
        return res.json("El tipo de amenaza ha sido actualizado");
    });
};
