import { db } from "../db.js"

export const getAmenazas = (req, res) => {
    const q = "SELECT * FROM mapadecalor.ame_amenaza;";

    db.query(q, (err, data) => {
        if (err) return res.status(500).send(err);
        return res.status(200).json(data);
    });
};

export const getAmenazaId = (req, res) => {
    const q =
        "SELECT * FROM mapadecalor.ame_amenaza where `ame_codigo` = ?;";

    db.query(q, [req.params.id], (err, data) => {
        if (err) return res.status(500).json(err);

        return res.status(200).json(data[0]);
    });
}

export const addAmenaza = (req, res) => {
    const q = "INSERT INTO mapadecalor.ame_amenaza (TIA_CODIGO, PRO_CODIGO, AME_FECHA_INICIO, AME_IDENTIFICACION, AME_NOMBRE, AME_DESCRIPCION, AME_FECHA_INACTIVIDAD, AME_OBSERVACION) VALUES (?,?,?,?,?,?,?,?)";
    const values = [
        req.body.Tipo,
        req.body.Probabilidad,
        req.body.FechaInicio,
        req.body.Identificacion,
        req.body.Nombre,
        req.body.Descripción,
        req.body.FechaInactividad,
        req.body.Observacion,
    ]

    db.query(q, [req.body.Tipo, null, req.body.FechaInicio, req.body.Identificacion, req.body.Nombre, req.body.Descripción, req.body.FechaInactividad, req.body.Observacion], (err, data) => {
        if (err)
        {   console.log(err);
            return res.status(500).json(err);}
        return res.json("La amenaza ha sido creada")
    });
}

export const deleteAmenaza = (req, res) => {
    const postId = req.params.id
    const q = "delete from mapadecalor.ame_amenaza where `ame_codigo` = ?";
    db.query(q, [postId], (err, data) => {
        return res.json("La amenaza ha sido eliminada");
    })

};

export const updateAmenaza = (req, res) => {
    const postId = req.params.id;
    const q = "UPDATE mapadecalor.ame_amenaza SET TIA_CODIGO = ?, PRO_CODIGO = ?, AME_FECHA_INICIO = ?, AME_IDENTIFICACION = ?, AME_NOMBRE = ?, AME_DESCRIPCION = ?, AME_FECHA_INACTIVIDAD = ?, AME_OBSERVACION = ? WHERE AME_CODIGO = ?";

    db.query(q, [req.body.Tipo, req.body.Probabilidad, req.body.FechaInicio, req.body.Identificacion, req.body.Nombre, req.body.Descripción, req.body.FechaInactividad, req.body.Observacion, postId], (err, data) => {
        if (err) {
            console.log(err);
            return res.status(500).json(err);
        }
        return res.json("La amenaza ha sido actualizada");
    });
};
