import { db } from "../db.js"

export const getValorImpacto = (req, res) => {
    const q = "SELECT * FROM mapadecalor.vai_valorimpacto;";

    db.query(q, (err, data) => {
        if (err) return res.status(500).send(err);
        return res.status(200).json(data);
    });
};

export const getValorImpactoId = (req, res) => {
    const q =
        "SELECT * FROM mapadecalor.vai_valorimpacto where `VAI_CODIGO` = ?;";

    db.query(q, [req.params.id], (err, data) => {
        if (err) return res.status(500).json(err);

        return res.status(200).json(data[0]);
    });
}

export const addValorImpacto = (req, res) => {
    const q = "INSERT INTO mapadecalor.vai_valorimpacto ( ACT_CODIGO, DIV_CODIGO, VUL_CODIGO, VAI_FECHA, VAI_VALOR) VALUES (?,?,?,?,?)";
    const values = [
        req.body.ACT_CODIGO,
        req.body.DIV_CODIGO,
        req.body.VUL_CODIGO,
        req.body.VAI_FECHA,
        req.body.VAI_VALOR,        
    ]

    db.query(q, [req.body.ACT_CODIGO, req.body.DIV_CODIGO, req.body.VUL_CODIGO, req.body.VAI_FECHA, req.body.VAI_VALOR], (err, data) => {
        if (err)
        {   console.log(err);
            return res.status(500).json(err);}
        return res.json("El activo ha sido creado")
    });
}

export const deleteValorImpacto = (req, res) => {
    const postId = req.params.id
    const q = "delete from mapadecalor.vai_valorimpacto where `VAI_CODIGO` = ?";
    db.query(q, [postId], (err, data) => {
        return res.json("El valor impacto ha sido eliminado");
    })

};

export const updateValorImpacto = (req, res) => {
    const postId = req.params.id;
    const q = "UPDATE mapadecalor.vai_valorimpacto SET ACT_CODIGO = ?, DIV_CODIGO = ?, VUL_CODIGO = ?, VAI_FECHA = ?, VAI_VALOR = ?";

    db.query(q, [req.body.Activo, req.body.Dimension, req.body.Vulnerabilidad, req.body.Fecha, req.body.Valor, postId], (err, data) => {
        if (err) {
            console.log(err);
            return res.status(500).json(err);
        }
        return res.json("El activo ha sido actualizado");
    });
};

export const addValValoracion = (req, res) => {
    const q = "INSERT INTO mapadecalor.val_valoracion (VAL_CODIGO, AME_CODIGO, VAL_IMPACTO, VAL_RIESGO, VAL_FECHA_VALORACION, VA_FRECUENCIA, VA_COSTO) VALUES (?,?,?,?,?,?,?)";
    const values = [
        req.body.AME_CODIGO,
        req.body.VAL_IMPACTO,
        req.body.VAL_RIESGO,
        req.body.VAL_FECHA_VALORACION,
        req.body.VA_FRECUENCIA,
        req.body.VA_COSTO,     
    ]
    db.query(q, [null,req.body.AME_CODIGO, req.body.VAL_IMPACTO, req.body.VAL_RIESGO, req.body.VAL_FECHA_VALORACION, req.body.VA_FRECUENCIA, req.body.VA_COSTO], (err, data) => {
        if (err)
        {   console.log(err);
            return res.status(500).json(err);}
        return res.json("El activo ha sido creado")
    });

}
    