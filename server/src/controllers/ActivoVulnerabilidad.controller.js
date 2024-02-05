import { db } from "../db.js"

export const getActivos = (req, res) => {
    const q = "SELECT * FROM mapadecalor.vac_vulnerabilidadactivo;";

    db.query(q, (err, data) => {
        if (err) return res.status(500).send(err);
        return res.status(200).json(data);
    });
};

export const getActivoId = (req, res) => {
    const q =
        "SELECT * FROM mapadecalor.vac_vulnerabilidadactivo where `act_codigo` = ?;";

    db.query(q, [req.params.id], (err, data) => {
        if (err) return res.status(500).json(err);

        return res.status(200).json(data[0]);
    });
}

export const postVulActivo = (req, res) => {
    const q = "INSERT INTO mapadecalor.vac_vulnerabilidadactivo (VUL_CODIGO,ACT_CODIGO,VAC_COSTO,VAC_FECHA_INICIO,VAC_FECHA_INACTIVIDAD) VALUES (?,?,?,?,?)";
    const values = [
        req.body.VUL_CODIGO,
        req.body.ACT_CODIGO,
        req.body.VAC_COSTO,
        req.body.VAC_FECHA_INICIO,
        req.body.VAC_FECHA_INACTIVIDAD,
    ]
    console.log("puto mathias",req.body);
    db.query(q, [req.body.VUL_CODIGO, req.body.ACT_CODIGO, req.body.VAC_COSTO, req.body.VAC_FECHA_INICIO, req.body.VAC_FECHA_INACTIVIDAD], (err, data) => {
        if (err)
        {   console.log(err);
            return res.status(500).json(err);}
        return res.json("dato almacenado")
    });
}

export const deleteVulActivo = (req, res) => {
    const postId = req.params.id
    const q = "delete from mapadecalor.vac_vulnerabilidadactivo where `act_codigo` = ?";
    db.query(q, [postId], (err, data) => {
        return res.json("El activo ha sido eliminado");
    })

}

export const updateVulActivo = (req, res) => {
    const postId = req.params.id;
    const q = "UPDATE mapadecalor.vac.vulnerabilidadactivo SET ? where `act_codigo` = ?;";

    db.query(q, [req.body, postId], (err, data) => {
        if (err) {
            console.log(err);
            return res.status(500).json(err);
        }
        return res.json("El activo ha sido actualizado");
    })
}


