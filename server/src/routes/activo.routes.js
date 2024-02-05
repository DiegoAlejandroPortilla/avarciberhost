import { Router } from "express";
import {
  addActivo,
  getActivos,
  getActivoId,
  deleteActivo,
  updateActivo,
  getActivoIdporNombre,
} from "../controllers/activo.controller.js";

const router = Router();

router.get("/",getActivos);
router.get("/:id",getActivoId);
router.post("/",addActivo);
router.delete("/:id",deleteActivo);
router.put("/:id",updateActivo);
router.get("/nombre/:nombre",getActivoIdporNombre);
export default router;
