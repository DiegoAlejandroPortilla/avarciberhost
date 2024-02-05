import { db } from "../db.js"

export const getVAAc = (req, res) => {
    const q = `
        SELECT 
            a.act_nombre as Activo_Nombre,
            vul.VUL_CODIGO AS Vulnerabilidad_ID,
            vul.VUL_NOMBRE AS Vulnerabilidad_Nombre,
            ame.AME_CODIGO AS Amenaza_ID,
            ame.AME_NOMBRE as Amenaza_Nombre
        FROM act_activo AS a
        INNER JOIN vac_vulnerabilidadactivo AS vac ON a.ACT_CODIGO = vac.ACT_CODIGO
        INNER JOIN vul_vulnerabilidad AS vul ON vac.VUL_CODIGO = vul.VUL_CODIGO
        INNER JOIN amv_amenazavulnerabilidad AS amv ON vul.VUL_CODIGO = amv.VUL_CODIGO
        INNER JOIN ame_amenaza AS ame ON amv.AME_CODIGO = ame.AME_CODIGO
        WHERE a.ACT_CODIGO = ?;
    `;

    db.query(q, [req.params.id], (err, data) => {
        if (err) {
            console.error("Error executing query:", err);
            return res.status(500).json({ error: "Internal server error" });
        }
        return res.status(200).json(data);
    });
};
