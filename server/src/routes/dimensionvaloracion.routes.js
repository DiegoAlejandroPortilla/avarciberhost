import { Router } from "express";
import {
  addDimenVal,
    deleteDimenVal,
    getDimenVal,
    getTDimenValId,
    updateDimenVal,
} from "../controllers/dimensionvaloracion.controller.js";
const router = Router();

router.get("/",getDimenVal);
router.get("/:id",getTDimenValId);
router.post("/",addDimenVal);
router.delete("/:id",deleteDimenVal);
router.put("/:id",updateDimenVal);
export default router;
