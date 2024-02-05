import { db } from "../db.js";

export const getIncidente = (req, res) => {
  const q = "SELECT * FROM mapadecalor.inc_incidente;";

  db.query(q, (err, data) => {
    if (err) return res.status(500).send(err);
    return res.status(200).json(data);
  });
};

export const getIncidenteId = (req, res) => {
  const q = "SELECT * FROM mapadecalor.inc_incidente where `inc_codigo` = ?;";

  db.query(q, [req.params.id], (err, data) => {
    if (err) return res.status(500).json(err);

    return res.status(200).json(data[0]);
  });
};

export const addIncidente = (req, res) => {
  const q = "INSERT INTO inc_incidente  VALUES (?,?,?,?,?,?)";
  const values = [
    req.body.codigo,
    req.body.fecha,
    req.body.identificacion,
    req.body.nombre,
    req.body.descripcion,
    req.body.observacion,
  ];
  db.query(q, values, (err, data) => {
    if (err) return err;
    return res.json("El incidente ha sido creado");
  });
};

export const deleteIncidente = (req, res) => {
  const postId = req.params.id;
  console.log(postId);
  const q = "delete from mapadecalor.inc_incidente where `INC_CODIGO` = ?";
  db.query(q, [postId], (err, data) => {
    return res.json("El incidente ha sido eliminado");
  });
};

export const updateIncidente = (req, res) => {
  const postId = req.params.id;
  //const q = "UPDATE posts SET `title`=?,`desc`=?,`img`=?,`cat`=? WHERE `id` = ? AND `uid` = ?";
  const q =
    "update mapadecalor.inc_incidente set `INC_FECHA` = ?,`INC_IDENTIFICAION` = ?,`INC_NOMBRE`=?,`INC_DESCRIPCION`=?,`INC_OBSERVACION`=? where `INC_CODIGO` = ?;";

  const values = [
    req.body.fecha,
    req.body.identificacion,
    req.body.nombre,
    req.body.descripcion,
    req.body.observacion,
  ];
  db.query(
    q,
    [
      req.body.fecha,
      req.body.identificacion,
      req.body.nombre,
      req.body.descripcion,
      req.body.observacion,
      postId,
    ],
    (err, data) => {
      if (err) {
        console.log(err);
        return res.status(500).json(err);
      }
      return res.json("El incidente ha sido actualizado");
    }
  );
};
