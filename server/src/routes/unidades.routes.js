import { Router } from "express";
import {
      getUnidades
    , getUnidadesId
    , addUnidades
    , deleteUnidades
    , updateUnidades
    , getUnidadesByEmpresa
} from "../controllers/unidades.controller.js";

const router = Router();

router.get("/", getUnidades);
router.get("/:id", getUnidadesId);
router.post("/", addUnidades);
router.delete("/:id", deleteUnidades);
router.put("/:id", updateUnidades);
router.get("/empresa/:id", getUnidadesByEmpresa);
export default router;

