import { db } from "../db.js"

export const getActivos = (req, res) => {
    const q = "SELECT * FROM mapadecalor.act_activo;";

    db.query(q, (err, data) => {
        if (err) return res.status(500).send(err);
        return res.status(200).json(data);
    });
};

export const getActivoId = (req, res) => {
    const q =
        "SELECT * FROM mapadecalor.act_activo where `act_codigo` = ?;";

    db.query(q, [req.params.id], (err, data) => {
        if (err) return res.status(500).json(err);

        return res.status(200).json(data[0]);
    });
}


export const getActivoIdporNombre = (req, res) => {
    const q =
        "SELECT ACT_CODIGO FROM mapadecalor.act_activo WHERE ACT_NOMBRE = ?;";

    db.query(q, [req.params.nombre], (err, data) => {
        if (err) return res.status(500).json(err);

        return res.status(200).json(data[0]);
    });
}



export const addActivo = (req, res) => {
    const q = "INSERT INTO mapadecalor.act_activo (ACT_ACT_CODIGO, TAC_CODIGO, ACT_FECHA_INICIO, ACT_IDENTIFICACION, ACT_NOMBRE, ACT_DESCRIPCION, ACT_FECHA_INACTIVIDAD, ACT_OBSERVACION, ACT_VALOR) VALUES (?,?,?,?,?,?,?,?,?)";
    const values = [
        req.body.Tipo,
        req.body.FechaInicio,
        req.body.Identificacion,
        req.body.Nombre,
        req.body.Descripción,
        req.body.Observacion,
        req.body.Valor,
        req.body.FechaInactividad,
    ]

    db.query(q, [null, req.body.Tipo, req.body.FechaInicio, req.body.Identificacion, req.body.Nombre, req.body.Descripción, req.body.FechaInactividad, req.body.Observacion, req.body.Valor], (err, data) => {
        if (err)
        {   console.log(err);
            return res.status(500).json(err);}
        return res.json("El activo ha sido creado")
    });
}

export const deleteActivo = (req, res) => {
    const postId = req.params.id
    const q = "delete from mapadecalor.act_activo where `act_codigo` = ?";
    db.query(q, [postId], (err, data) => {
        return res.json("El activo ha sido eliminado");
    })

};

export const updateActivo = (req, res) => {
    const postId = req.params.id;
    const q = "UPDATE mapadecalor.act_activo SET TAC_CODIGO = ?, ACT_FECHA_INICIO = ?, ACT_IDENTIFICACION = ?, ACT_NOMBRE = ?, ACT_DESCRIPCION = ?, ACT_FECHA_INACTIVIDAD = ?, ACT_OBSERVACION = ?, ACT_VALOR = ? WHERE ACT_CODIGO = ?";

    db.query(q, [req.body.Tipo, req.body.FechaInicio, req.body.Identificacion, req.body.Nombre, req.body.Descripción, req.body.FechaInactividad, req.body.Observacion, req.body.Valor, postId], (err, data) => {
        if (err) {
            console.log(err);
            return res.status(500).json(err);
        }
        return res.json("El activo ha sido actualizado");
    });
};
