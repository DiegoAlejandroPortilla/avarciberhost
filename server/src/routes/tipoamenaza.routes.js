import { Router } from "express";
import {
addTAmenaza,
deleteTAmenaza,
updateTAmenaza,
getTAmenazaId,
getTAmenazas,
} from "../controllers/tipoamenaza.controller.js";
const router = Router();

router.get("/",getTAmenazas);
router.get("/:id",getTAmenazaId);
router.post("/",addTAmenaza);
router.delete("/:id",deleteTAmenaza);
router.put("/:id",updateTAmenaza);
export default router;