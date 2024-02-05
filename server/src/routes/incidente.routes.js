import { Router } from "express";
import {
getIncidente,
getIncidenteId,
deleteIncidente,
updateIncidente,
addIncidente,

} from "../controllers/incidente.controller.js";
const router = Router();

router.get("/",getIncidente);
router.get("/:id",getIncidenteId);
router.post("/",addIncidente);
router.delete("/:id",deleteIncidente);
router.put("/:id",updateIncidente);
export default router;
