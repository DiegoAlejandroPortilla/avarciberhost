import { db } from "../db.js"
import { format } from 'date-fns';

export const getAmenazasVulnerabilidades = (req, res) => {
    const q = "SELECT av.VUL_CODIGO, DATE(av.AMV_FECHA_INICION) AS AMV_FECHA_INICIO, vv.VUL_NOMBRE FROM amv_amenazavulnerabilidad av JOIN vul_vulnerabilidad vv ON av.VUL_CODIGO = vv.VUL_CODIGO GROUP BY av.VUL_CODIGO, DATE(av.AMV_FECHA_INICION), vv.VUL_NOMBRE;";

    db.query(q, (err, data) => {
        if (err) return res.status(500).send(err);
        return res.status(200).json(data);
    });
};

export const getFechaAmenazasVulnerabilidades = (req, res) => {
    // Modifica la consulta para incluir el valor del marcador de posición
    const q = "SELECT AMV_FECHA_INICION, VUL_CODIGO FROM mapadecalor.amv_amenazavulnerabilidad WHERE VUL_CODIGO = ?;";

    // Pasa un array de valores como segundo argumento en db.query
    db.query(q, [req.params.id], (err, data) => {
        if (err) return res.status(500).send(err);
        return res.status(200).json(data);
    });
};

export const getgroup = (req, res) => {
    const q = "SELECT av.VUL_CODIGO, DATE(av.AMV_FECHA_INICION) AS AMV_FECHA_INICIO, vv.VUL_NOMBRE FROM amv_amenazavulnerabilidad av JOIN vul_vulnerabilidad vv ON av.VUL_CODIGO = vv.VUL_CODIGO GROUP BY av.VUL_CODIGO, DATE(av.AMV_FECHA_INICION), vv.VUL_NOMBRE;";
    db.query(q, (err, data) => {
        if (err) {
            console.error(err);
            return res.status(500).send(err);
        }
        return res.status(200).json(data);
    });
};




export const getRangos = (req, res) => {
    const q = "SELECT * FROM mapadecalor.val_rangos;";

    db.query(q, [req.params.id], (err, data) => {
        if (err) return res.status(500).send(err);
        return res.status(200).json(data);
    });
};

export const getagrupacion = (req, res) => {
    const q = `
    WITH CTE AS (
        SELECT
            act.ACT_CODIGO,
            act.ACT_NOMBRE,
            vac.VUL_CODIGO AS VAC_VUL_CODIGO,
            vac.VAC_COSTO,
            vac.VAC_FECHA_INICIO,
            vul.VUL_NOMBRE,
            amv.VUL_CODIGO AS AMV_VUL_CODIGO,
            amv.AME_CODIGO,
            ame.AME_NOMBRE,
            vai.VAI_VALOR,
            ROW_NUMBER() OVER (PARTITION BY act.ACT_CODIGO, vul.VUL_CODIGO ORDER BY vac.VAC_FECHA_INICIO) AS RowNum
        FROM
            act_activo act
        JOIN
            vac_vulnerabilidadactivo vac ON act.ACT_CODIGO = vac.ACT_CODIGO
        JOIN
            vul_vulnerabilidad vul ON vac.VUL_CODIGO = vul.VUL_CODIGO
        JOIN
            amv_amenazavulnerabilidad amv ON vul.VUL_CODIGO = amv.VUL_CODIGO
        JOIN
            ame_amenaza ame ON amv.AME_CODIGO = ame.AME_CODIGO
        JOIN
            vai_valorimpacto vai ON act.ACT_CODIGO = vai.ACT_CODIGO AND vul.VUL_CODIGO = vai.VUL_CODIGO
    )
    SELECT
        ACT_CODIGO,
        ACT_NOMBRE,
        VAC_VUL_CODIGO AS VUL_CODIGO,
        VAC_COSTO,
        VAC_FECHA_INICIO,
        VUL_NOMBRE,
        AME_NOMBRE,
        VAI_VALOR
    FROM
        CTE
    WHERE
        RowNum = 1;
    `;
    db.query(q, [req.params.id], (err, data) => {
            if (err) return res.status(500).send(err);
    
            // Normaliza las fechas antes de enviar la respuesta
            const normalizedData = data.map(item => ({
                ...item,
                VAC_FECHA_INICIO: format(new Date(item.VAC_FECHA_INICIO), "yyyy-MM-dd'T'HH:mm:ss.SSSxxx"),
            }));
    
            return res.status(200).json(normalizedData);
        });
    };



export const getAmenazasVulnerabilidadesTotal = (req, res) => {
    const query = `
    WITH CTE AS (
        SELECT
            act.ACT_CODIGO,
            act.ACT_NOMBRE,
            vac.VUL_CODIGO AS VAC_VUL_CODIGO,
            vac.VAC_COSTO,
            vac.VAC_FECHA_INICIO,
            vul.VUL_NOMBRE,
            amv.VUL_CODIGO AS AMV_VUL_CODIGO,
            amv.AME_CODIGO,
            ame.AME_NOMBRE,
            amv.AMV_PROBABILIDAD,  
            vai.VAI_VALOR,
            DENSE_RANK() OVER (PARTITION BY act.ACT_CODIGO, vul.VUL_CODIGO ORDER BY vac.VAC_FECHA_INICIO) AS DenseRank
        FROM
            act_activo act
        JOIN
            vac_vulnerabilidadactivo vac ON act.ACT_CODIGO = vac.ACT_CODIGO
        JOIN
            vul_vulnerabilidad vul ON vac.VUL_CODIGO = vul.VUL_CODIGO
        JOIN
            amv_amenazavulnerabilidad amv ON vul.VUL_CODIGO = amv.VUL_CODIGO
        JOIN
            ame_amenaza ame ON amv.AME_CODIGO = ame.AME_CODIGO
        JOIN
            vai_valorimpacto vai ON act.ACT_CODIGO = vai.ACT_CODIGO AND vul.VUL_CODIGO = vai.VUL_CODIGO
    )
    SELECT
        ACT_CODIGO,
        ACT_NOMBRE,
        VAC_VUL_CODIGO AS VUL_CODIGO,
        VAC_COSTO,
        VAC_FECHA_INICIO,
        VUL_NOMBRE,
        AME_NOMBRE,
        AME_CODIGO,
        AMV_PROBABILIDAD,
        MAX(VAI_VALOR) AS VAI_VALOR,
        AVG(AVG(VAI_VALOR)) OVER (PARTITION BY ACT_CODIGO, VAC_VUL_CODIGO) AS PromedioGrupo
    FROM
        CTE
    WHERE
        DenseRank = 1  
    GROUP BY
        ACT_CODIGO, ACT_NOMBRE, VAC_VUL_CODIGO, VAC_COSTO, VAC_FECHA_INICIO, VUL_NOMBRE, AME_NOMBRE, AME_CODIGO, AMV_PROBABILIDAD;
        `;

    // Ejecuta la consulta en la base de datos usando la librería "db"
    db.query(query, (err, data) => {
        if (err) {
            // En caso de error, envía una respuesta con estado 500 y el mensaje de error
            return res.status(500).send(err);
        }

        // Normaliza las fechas antes de enviar la respuesta
        const normalizedData = data.map(item => ({
            ...item,
            VAC_FECHA_INICIO: format(new Date(item.VAC_FECHA_INICIO), "yyyy-MM-dd'T'HH:mm:ss.SSSxxx"),
        }));

        // En caso de éxito, envía una respuesta con estado 200 y los datos normalizados
        return res.status(200).json(normalizedData);
    });
};

export const tablaAmenazasCalculoFinal = (req, res) => {
    const q = `
    WITH CTE AS (
        SELECT
            act.ACT_CODIGO,
            act.ACT_NOMBRE,
            vac.VUL_CODIGO AS VAC_VUL_CODIGO,
            vac.VAC_COSTO,
            vac.VAC_FECHA_INICIO,
            vul.VUL_NOMBRE,
            amv.VUL_CODIGO AS AMV_VUL_CODIGO,
            amv.AME_CODIGO,
            ame.AME_NOMBRE,
            amv.AMV_PROBABILIDAD,  
            vai.VAI_VALOR,
            DENSE_RANK() OVER (PARTITION BY act.ACT_CODIGO, vul.VUL_CODIGO ORDER BY vac.VAC_FECHA_INICIO) AS DenseRank
        FROM
            act_activo act
        JOIN
            vac_vulnerabilidadactivo vac ON act.ACT_CODIGO = vac.ACT_CODIGO
        JOIN
            vul_vulnerabilidad vul ON vac.VUL_CODIGO = vul.VUL_CODIGO
        JOIN
            amv_amenazavulnerabilidad amv ON vul.VUL_CODIGO = amv.VUL_CODIGO
        JOIN
            ame_amenaza ame ON amv.AME_CODIGO = ame.AME_CODIGO
        JOIN
            vai_valorimpacto vai ON act.ACT_CODIGO = vai.ACT_CODIGO AND vul.VUL_CODIGO = vai.VUL_CODIGO
    )
    SELECT
        ACT_CODIGO,
        ACT_NOMBRE,
        VAC_VUL_CODIGO AS VUL_CODIGO,
        VAC_COSTO,
        VAC_FECHA_INICIO,
        VUL_NOMBRE,
        AME_NOMBRE,
        AME_CODIGO,
        AMV_PROBABILIDAD,
        MAX(VAI_VALOR) AS VAI_VALOR,
        AVG(AVG(VAI_VALOR)) OVER (PARTITION BY ACT_CODIGO, VAC_VUL_CODIGO) AS PromedioGrupo,
        AVG(AVG(VAI_VALOR)) OVER (PARTITION BY ACT_CODIGO, VAC_VUL_CODIGO, AME_CODIGO) AS PromedioGrupoPorAmenaza
    FROM
        CTE
    WHERE
        DenseRank = 1
        AND ACT_CODIGO = ?
        AND CAST(VAC_FECHA_INICIO AS DATE) <= ?
    GROUP BY
        ACT_CODIGO, ACT_NOMBRE, VAC_VUL_CODIGO, VAC_COSTO, VAC_FECHA_INICIO, VUL_NOMBRE, AME_NOMBRE, AME_CODIGO, AMV_PROBABILIDAD;
    `;
    db.query(q, [req.params.id, req.params.fecha], (err, data) => {
        if (err) return res.status(500).send(err);
        return res.status(200).json(data);
    });
};


export const getProceso = (req, res) => {
    const q = `
    SELECT
    InfoVul.AmenazaCodigo,
    InfoVul.AmenazaNombre,
    InfoVul.VulnerabilidadCodigo,
    InfoVul.VulnerabilidadNombre,
    InfoVul.CostoVulnerabilidad,
    InfoPromedio.ValorPromedioImpacto,
    date (InfoVul.VAC_FECHA_INICIO), -- Cambiamos Vac.VAC_FECHA_INICIO por InfoVul.VAC_FECHA_INICIO
    Act.Act_Codigo,
    Act.Act_Nombre,
    InfoVul.AMV_PROBABILIDAD
FROM (
    SELECT
        Vul.Vul_Codigo AS VulnerabilidadCodigo,
        Vul.Vul_Nombre AS VulnerabilidadNombre,
        Ame.Ame_Codigo AS AmenazaCodigo,
        Ame.Ame_Nombre AS AmenazaNombre,
        Vac.Vac_Costo AS CostoVulnerabilidad,
        Vac.VAC_FECHA_INICIO,
        amv.AMV_PROBABILIDAD
    FROM
        Amv_AmenazaVulnerabilidad AS amv
        INNER JOIN Ame_Amenaza AS Ame ON amv.Ame_Codigo = Ame.Ame_Codigo
        INNER JOIN Vul_Vulnerabilidad AS Vul ON amv.Vul_Codigo = Vul.Vul_Codigo
        INNER JOIN Vac_VulnerabilidadActivo AS Vac ON Vul.Vul_Codigo = Vac.Vul_Codigo
) AS InfoVul
INNER JOIN (
    SELECT
        Ame.Ame_Codigo AS AmenazaCodigo,
        Ame.Ame_Nombre AS AmenazaNombre,
        Vul.Vul_Codigo AS VulnerabilidadCode,
        SUM(vai.Vai_Valor) / COUNT(vai.Vai_Valor) AS ValorPromedioImpacto
    FROM
        Amv_AmenazaVulnerabilidad AS amv
        INNER JOIN Ame_Amenaza AS Ame ON amv.Ame_Codigo = Ame.Ame_Codigo
        INNER JOIN Vul_Vulnerabilidad AS Vul ON amv.Vul_Codigo = Vul.Vul_Codigo
        INNER JOIN Vac_VulnerabilidadActivo AS Vac ON Vul.Vul_Codigo = Vac.Vul_Codigo
        INNER JOIN vai_valorImpacto AS vai ON Vul.Vul_Codigo = vai.Vul_Codigo
    GROUP BY
        Ame.Ame_Codigo,
        Ame.Ame_Nombre,
        Vul.Vul_Codigo
) AS InfoPromedio
ON InfoVul.AmenazaCodigo = InfoPromedio.AmenazaCodigo AND InfoVul.VulnerabilidadCodigo = InfoPromedio.VulnerabilidadCode
INNER JOIN Vac_VulnerabilidadActivo AS VacAct ON InfoVul.VulnerabilidadCodigo = VacAct.Vul_Codigo
INNER JOIN Act_Activo AS Act ON VacAct.Act_Codigo = Act.Act_Codigo
INNER JOIN pro_probabilidad AS Pro ON InfoVul.AmenazaCodigo = Pro.AME_CODIGO WHERE act.ACT_CODIGO = ? AND DATE(InfoVul.VAC_FECHA_INICIO) <= ?;`;

    db.query(q, [req.params.id, req.params.fecha], (err, data) => {
        if (err) return res.status(500).send(err);
        return res.status(200).json(data);
    });
};



export const getAmenazaVulnerabilidadId = (req, res) => {
    const q =
        "SELECT * FROM mapadecalor.amv_amenazavulnerabilidad where `vul_codigo` = ? and `ame_codigo` = ?;";

    db.query(q, [req.params.id, req.params.id2], (err, data) => {
        if (err) return res.status(500).json(err);

        return res.status(200).json(data[0]);
    });
}

export const addAmenazaVulnerabilidad = (req, res) => {
    const q = "INSERT INTO mapadecalor.amv_amenazavulnerabilidad (VUL_CODIGO, AME_CODIGO,AMV_PROBABILIDAD,AMV_FECHA_INICION,AMV_FECHA_INACTIVIDAD,AMV_VALOR_DANO_PROMEDIO) VALUES (?,?,?,?,?,?)";
    const values = [
        req.body.VUL_CODIGO,
        req.body.AME_CODIGO,
        req.body.AMV_PROBABILIDAD,
        req.body.AMV_FECHA_INICION,
        req.body.AMV_FECHA_INACTIVIDAD,
        req.body.AMV_VALOR_DANO_PROMEDIO,
    ]
    console.log("amenaza", req.body);
    db.query(q, [req.body.VUL_CODIGO, req.body.AME_CODIGO, req.body.AMV_PROBABILIDAD, req.body.AMV_FECHA_INICION, req.body.AMV_FECHA_INACTIVIDAD, req.body.AMV_VALOR_DANO_PROMEDIO], (err, data) => {
        if (err) {
            console.log(err);
            return res.status(500).json(err);
        }
        return res.json("dato almacenado")
    });
}



export const deleteAmenazaVulnerabilidad = (req, res) => {
    const postId = [req.params.id, req.params.id2]
    const q = "delete from mapadecalor.amv_amenazavulnerabilidad where `vul_codigo` = ? and `ame_codigo` = ?";
    db.query(q, [postId], (err, data) => {
        return res.json("La amenaza-vulnerabilidad ha sido eliminada");
    })

};

export const updateAmenazaVulnerabilidad = (req, res) => {
    const postId = [req.params.id, req.params.id2];
    const q = "UPDATE mapadecalor.amv_amenazavulnerabilidad SET VUL_CODIGO = ?, AME_CODIGO = ?, AMV_PROBABILIDAD = ?, AME_FECHA_INICION = ?, AME_FECHA_INACTIVIDAD = ? WHERE VUL_CODIGO = ? and AME_CODIGO = ?";

    db.query(q, [req.body.CodigoVulnerabilidad, req.body.CodigoAmenaza, req.body.Probabilidad, req.body.FechaInicio, req.body.FechaInactividad, postId], (err, data) => {
        if (err) {
            console.log(err);
            return res.status(500).json(err);
        }
        return res.json("La amenaza-vulnerabilidad ha sido actualizada");
    });
};
