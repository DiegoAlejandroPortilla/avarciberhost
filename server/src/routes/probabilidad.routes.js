import { Router } from "express";
import {
  getProbabilidadId,
  deleteProbabilidad,
    updateProbabilidad,
    addProbabilidad,
    getProbabilidad,

} from "../controllers/probabilidad.controller.js";
const router = Router();

router.get("/",getProbabilidad);
router.get("/:id",getProbabilidadId);
router.post("/",addProbabilidad);
router.delete("/:id",deleteProbabilidad);
router.put("/:id",updateProbabilidad);
export default router;
