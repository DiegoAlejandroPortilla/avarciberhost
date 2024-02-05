import { Router } from "express";
import {
  addTVulnerabilidad,
  deleteTVulnerabilidad,
  updateTVulnerabilidad,
  getTVulnerabilidadId,
  getTVulneravilidad,
} from "../controllers/tipovulnerabilidad.controller.js";

const router = Router();

router.get("/",getTVulneravilidad);
router.get("/:id",getTVulnerabilidadId);
router.post("/",addTVulnerabilidad);
router.delete("/:id",deleteTVulnerabilidad);
router.put("/:id",updateTVulnerabilidad);
export default router;