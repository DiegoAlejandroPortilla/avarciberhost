import { Router } from "express";
import {
  addVulnerabilidades,
  getVulnerabilidades,
  getVulnerabilidadesId,
  deleteVulnerabilidades,
  updateVulnerabilidades,
} from "../controllers/vulnerabilidad.controller.js";

const router = Router();

router.get("/",getVulnerabilidades);
router.get("/:id",getVulnerabilidadesId);
router.post("/",addVulnerabilidades);
router.delete("/:id",deleteVulnerabilidades);
router.put("/:id",updateVulnerabilidades);
export default router;
