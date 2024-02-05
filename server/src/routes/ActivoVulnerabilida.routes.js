import { Router } from "express";
import {
    getActivos,
    getActivoId,
    postVulActivo,
    updateVulActivo,
    deleteVulActivo,

} from "../controllers/ActivoVulnerabilidad.controller.js";

const router = Router();

router.get("/", getActivos);
router.get("/:id", getActivoId);
router.post("/", postVulActivo);
router.put("/:id", updateVulActivo);
router.delete("/:id", deleteVulActivo);


export default router;
