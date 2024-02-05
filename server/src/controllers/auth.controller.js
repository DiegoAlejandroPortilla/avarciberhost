import { db } from "../db.js";
import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";
import { TOKEN_SECRET } from "../config.js";

export const register = (req, res) => {
  const { email, password, nombre, apellido} = req.body;
  // verificación de usuario existente
  const q = "SELECT * FROM usu_usuarios WHERE usu_email = ?";

  db.query(q, [email, password,nombre,apellido], (err, data) => {
    if (err) return res.status(500).json(err);
    if (data.length) return res.status(409).json(["Usuario ya existe!"]);
    //Encriptado de contraseña
    const salt = bcrypt.genSaltSync(10);
    const hash = bcrypt.hashSync(password, salt);
    //Insersion de datos
    const q =
      "INSERT INTO usu_usuarios(`usu_nombre`,`usu_apellido`,`usu_rol`,`usu_email`,`usu_password`) VALUES (?)";
    const values = [nombre,apellido,"usuario",email,hash];
    db.query(q, [values], (err, data) => {
      if (err) return res.status(500).json(err);
      return res.status(200).json("Se creo el usuario");
    });
  });
};

export const login = (req, res) => {
  const q = "SELECT * FROM usu_usuarios WHERE usu_email = ?";

  db.query(q, req.body.email, (err, data) => {
    if (err) return res.status(500).json(err);
    if (data.length === 0)
      return res.status(404).json(["Usuario no registrado!"]);
    //Comparación de contraseña
    //console.log(data[0].USU_PASSWORD)
    const isPasswordCorrect = bcrypt.compareSync(
      req.body.password,
      //Nombre del atributo como está en la base
      data[0].USU_PASSWORD
    );
    //Comprobación de contraseña
    if (!isPasswordCorrect)
      return res.status(400).json(["Usuario o contraseña incorrectos"]);
    //Generación de Token
    const token = jwt.sign({ id: data[0].USU_CODIGO }, TOKEN_SECRET);
    //Copia toda la información menos el primer atributo establecido
    const { usu_password, ...other } = data[0];
    //Token guardado en una cookie
    res
      .cookie("token", token)
      .status(200)
      .json(other);
  });
};

export const logout = (req, res) => {
  //Limpieza de las cookies
  res
    .clearCookie("token", {
      sameSite: "none",
      secure: true,
      expires: new Date(0),
    })
    .status(200)
    .json("User has been logged out.");
};

export const verifyToken = async(req,res)=>{
  const{token} = req.cookies;
  if (!token) return res.send(false);
  jwt.verify(token,TOKEN_SECRET,(err,user)=>{
    if(err) return res.status(401).json("Acceso denegado")
    const q = "SELECT * FROM usu_usuarios WHERE usu_codigo = ?";
    db.query(q, user.id, (err, data) => {
      console.log(err)
  
      if (err) return res.status(500).json(err);
      return res.json({
        //información que se recopila
        id: data[0].USU_CODIGO,
        nombre: data[0].USU_NOMBRE,
        apellido:data[0].USU_APELLIDO,
        email: data[0].USU_EMAIL,
      });
    });
  })
}

export const profile = (req, res) => {
  //Acceder al la página de perfil con Id
  const id = req.user.id;
  const q = "SELECT * FROM usu_usuario WHERE usu_codigo = ?";
  //Llamado a la base de datos
  db.query(q, id, (err, data) => {
    if (err) return res.status(500).json(err);
    return res.json({
      //información que se recopila
      id: data[0].USU_CODIGO,
      nombre: data[0].USU_NOMBRE,
      apellido:data[0].USU_APELLIDO,
      email: data[0].USU_EMAIL,
    });
  });
};
