import express from 'express';
import morgan from 'morgan';
import authRoutes from "./routes/auth.routes.js"
import cookieParser from 'cookie-parser';
import cors from 'cors';
import activoRoutes from "./routes/activo.routes.js"
import tactivoRoutes from "./routes/tipoactivo.routes.js"
import tvulnerabilidadRoutes from "./routes/tipovulnerabilidad.routes.js"
import amenazaRoutes from "./routes/amenaza.routes.js"
import amenazavulnerabilidadRoutes from "./routes/amenazavulnerabilidad.routes.js"
import probabilidadRoutes from './routes/probabilidad.routes.js'
import incidenteRoutes from './routes/incidente.routes.js'
import valorimpactoRoutes from './routes/valorimpacto.routes.js'
import unidades from './routes/unidades.routes.js'
import vulnerabilidades from './routes/vulnerabilidad.routes.js'
import tipoamenanaza from './routes/tipoamenaza.routes.js'
import dimensionvaloracion from './routes/dimensionvaloracion.routes.js'
import vulnerabilidadActivo from './routes/ActivoVulnerabilida.routes.js'



const app = express();
const corsOptions = {
    origin: 'http://localhost:3000', // Replace this with your frontend domain
    credentials: true, // Allow sending credentials (cookies)
  };
  
  // Use the CORS middleware with the defined options
app.use(cors(corsOptions));
//Midleware
app.use(morgan('dev'));
//Lectura formatos json
app.use(express.json());
//Lectura de cookies
app.use(cookieParser());
//Rutas
app.use("/api",authRoutes);
app.use("/api/activos",activoRoutes);
app.use("/api/tiposactivos",tactivoRoutes);
app.use("/api/tiposvulnerabilidad",tvulnerabilidadRoutes);
app.use("/api/amenazas", amenazaRoutes);
app.use("/api/amenazasvulnerabilidades", amenazavulnerabilidadRoutes);
app.use("/api/probabilidad", probabilidadRoutes);
app.use("/api/incidente", incidenteRoutes);
app.use("/api/valorimpacto", valorimpactoRoutes);
app.use("/api/unidades", unidades);
app.use("/api/vulnerabilidades", vulnerabilidades);
app.use("/api/tipoamenaza", tipoamenanaza);
app.use("/api/dimensionvaloracion", dimensionvaloracion);
app.use("/api/vulnerabilidadActivo", vulnerabilidadActivo);

export default app;