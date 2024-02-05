import { Router } from "express";
import {
  addValorImpacto,
  getValorImpacto,
  getValorImpactoId,
  deleteValorImpacto,
  updateValorImpacto,
  addValValoracion,
} from "../controllers/valorimpacto.controller.js";

const router = Router();

router.get("/",getValorImpacto);
router.get("/:id",getValorImpactoId);
router.post("/",addValorImpacto);
router.delete("/:id",deleteValorImpacto);
router.put("/:id",updateValorImpacto);
router.post("/val",addValValoracion);
export default router;
