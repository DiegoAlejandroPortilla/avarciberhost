import { db } from "../db.js"


export const getUnidades = (req, res) => {
    const q = "SELECT * FROM mapadecalor.uni_unidad;";
    db.query(q, (err, data) => {
        if (err) return res.status(500).send(err);
        return res.status(200).json(data);
    });
};

export const getUnidadesId = (req, res) => {
    const q =
        "SELECT * FROM mapadecalor.uni_unidad where `uni_codigo` = ?;";
    db.query(q, [req.params.id], (err, data) => {
        if (err) return res.status(500).json(err);
        return res.status(200).json(data[0]);
    });
};

export const addUnidades = (req, res) => {
    const q = `INSERT INTO mapadecalor.uni_unidad (UNI_CODIGO,EMP_CODIGO,UNI_NOMBRE) VALUES (?,?,?)`;
      db.query(q,[req.body.UNI_CODIGO,req.body.EMP_CODIGO,req.body.UNI_NOMBRE], (err, data) => {
        console.log(err)
        if (err) return err;
        return res.json("La unidad ha sido creada")
    }
    );
};

export const deleteUnidades = (req, res) => {
    const postId = req.params.id
    console.log(postId)
    const q = "delete from mapadecalor.uni_unidad where `UNI_CODIGO` = ?";
    db.query(q, [postId], (err, data) => {
        return res.json("La unidad ha sido eliminada");
    })

};

export const updateUnidades = async (req, res) => {
    const postId = req.params.id
    const { UNI_CODIGO, EMP_CODIGO, UNI_NOMBRE } = req.body;
    const q = "UPDATE mapadecalor.uni_unidad SET EMP_CODIGO = ?, UNI_NOMBRE = ? WHERE UNI_CODIGO = ?;";
    db.query(q, [req.body.EMP_CODIGO,req.body.UNI_NOMBRE,postId], (err, data) => {
        if (err) {
        console.log(err)
        return res.status(500).json(err);
        }
        return res.json("La unidad ha sido actualizada");
    });
  };

export const getUnidadesByEmpresa = (req, res) => {

    const q = "SELECT * FROM mapadecalor.uni_unidad where `EMP_CODIGO` = ?;";
    db.query(q, [req.params.id], (err, data) => {
        if (err) return res.status(500).json(err);
        return res.status(200).json(data);
    });
};


    
