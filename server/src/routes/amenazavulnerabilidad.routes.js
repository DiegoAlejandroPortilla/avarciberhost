import { Router } from "express";
import {
  addAmenazaVulnerabilidad,
  getAmenazasVulnerabilidadesTotal,
  getAmenazasVulnerabilidades,
  getAmenazaVulnerabilidadId,
  getRangos,
  getProceso,
  deleteAmenazaVulnerabilidad,
  updateAmenazaVulnerabilidad,
  getFechaAmenazasVulnerabilidades,
  getagrupacion,
  tablaAmenazasCalculoFinal,
  getgroup
} from "../controllers/amenazavulnerabilidad.controller.js";

const router = Router();

router.get("/",getAmenazasVulnerabilidades);
router.get("/rangos",getRangos);
router.get("/total",getAmenazasVulnerabilidadesTotal);
router.get("/:id",getAmenazaVulnerabilidadId);
router.post("/",addAmenazaVulnerabilidad);
router.get("/proceso/:id/:fecha", getProceso);
router.delete("/:id",deleteAmenazaVulnerabilidad);
router.put("/:id",updateAmenazaVulnerabilidad);
router.get("/fecha/:id",getFechaAmenazasVulnerabilidades);
router.get("/agrupacion/:id",getagrupacion);
router.get("/tabla/:id/:fecha",tablaAmenazasCalculoFinal);
router.get("/group",getgroup);
export default router;
