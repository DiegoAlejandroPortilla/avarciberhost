import { Router } from "express";
import {
  addAmenaza,
  getAmenazas,
  getAmenazaId,
  deleteAmenaza,
  updateAmenaza,
} from "../controllers/amenaza.controller.js";

const router = Router();

router.get("/",getAmenazas);
router.get("/:id",getAmenazaId);
router.post("/",addAmenaza);
router.delete("/:id",deleteAmenaza);
router.put("/:id",updateAmenaza);
export default router;
