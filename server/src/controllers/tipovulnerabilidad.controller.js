import { db } from "../db.js"

export const getTVulneravilidad = (req, res) => {
    const q = "SELECT * FROM mapadecalor.tvu_tipovulnerabilidad;";

    db.query(q, (err, data) => {
        if (err) return res.status(500).send(err);
        return res.status(200).json(data);
    });
};

export const getTVulnerabilidadId = (req, res) => {
    const q =
        "SELECT * FROM mapadecalor.tvu_tipovulnerabilidad where `TVU_CODIGO` = ?;";

    db.query(q, [req.params.id], (err, data) => {
        if (err) return res.status(500).json(err);

        return res.status(200).json(data[0]);
    });
};

export const addTVulnerabilidad = (req, res) => {
    const q = "INSERT INTO mapadecalor.tvu_tipovulnerabilidad(TVU_DESCRIPCION) VALUES (?)";
    const values = [
        req.body.Descripcion,
    ]
    db.query(q, [values], (err, data) => {
        if (err) return err;
        return res.json("El tipo de vulnerabilidad ha sido creado")
    });
};

export const deleteTVulnerabilidad = (req, res) => {
    const postId = req.params.id
    console.log(postId)
    const q = "delete from mapadecalor.tvu_tipovulnerabilidad where `TVU_CODIGO` = ?";
    db.query(q, [postId], (err, data) => {
        return res.json("El tipo de vulnerabilidad ha sido eliminado");
    })

};

export const updateTVulnerabilidad = (req, res) => {
    const postId = req.params.id
    //const q = "UPDATE posts SET `title`=?,`desc`=?,`img`=?,`cat`=? WHERE `id` = ? AND `uid` = ?";
    const q = "update mapadecalor.tvu_tipovulnerabilidad set `TVU_DESCRIPCION` = ? where `TVU_CODIGO` = ?;";

    const values = [
        req.body.Descripcion,
    ]
    db.query(q, [req.body.Descripcion, postId], (err, data) => {
        if (err) {
            console.log(err)
            return res.status(500).json(err);
        }
        return res.json("La vulnerabilidad ha sido actualizada")

    });
};