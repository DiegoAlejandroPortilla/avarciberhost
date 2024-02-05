import { db } from "../db.js"

export const getVulnerabilidades = (req, res) => {
    const q = "SELECT * FROM mapadecalor.vul_vulnerabilidad;";

    db.query(q, (err, data) => {
        if (err) return res.status(500).send(err);
        return res.status(200).json(data);
    });
};

export const getVulnerabilidadesId = (req, res) => {
    const q =
        "SELECT * FROM mapadecalor.vul_vulnerabilidad where `vul_codigo` = ?;";

    db.query(q, [req.params.id], (err, data) => {
        if (err) return res.status(500).json(err);

        return res.status(200).json(data[0]);
    });
}

export const addVulnerabilidades = (req, res) => {
    const q = "INSERT INTO mapadecalor.vul_vulnerabilidad (TVU_CODIGO, VUL_FECHA_INICIO, VUL_IDENTIFICACION, VUL_NOMBRE, VUL_DESCRIPCION, VUL_OBSERVACION, VUL_FECHA_INACTIVIDAD) VALUES (?,?,?,?,?,?,?)";
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

    db.query(q, [req.body.Tipo, req.body.FechaInicio, req.body.Identificacion, req.body.Nombre, req.body.Descripción, req.body.Observacion, req.body.FechaInactividad], (err, data) => {
        if (err)
        {   console.log(err);
            return res.status(500).json(err);}
        return res.json("La Vulnerabilidad ha sido creado")
    });
}

export const deleteVulnerabilidades = (req, res) => {
    const postId = req.params.id
    const q = "delete from mapadecalor.vul_vulnerabilidad where `VUL_CODIGO` = ?";
    db.query(q, [postId], (err, data) => {
        return res.json("La Vulnerabilidad ha sido eliminado");
    })

};

export const updateVulnerabilidades = (req, res) => {
    const postId = req.params.id;
    const q = "UPDATE mapadecalor.vul_vulnerabilidad SET TVU_CODIGO = ?, VUL_FECHA_INICIO = ?, VUL_IDENTIFICACION = ?, VUL_NOMBRE = ?, VUL_DESCRIPCION = ?, VUL_OBSERVACION = ?, VUL_FECHA_INACTIVIDAD = ? WHERE VUL_CODIGO = ?";

    db.query(q, [req.body.Tipo, req.body.FechaInicio, req.body.Identificacion, req.body.Nombre, req.body.Descripción, req.body.Observacion, req.body.FechaInactividad, postId], (err, data) => {
        if (err) {
            console.log(err);
            return res.status(500).json(err);
        }
        return res.json("La Vulnerabilidad ha sido actualizado");
    });
};
