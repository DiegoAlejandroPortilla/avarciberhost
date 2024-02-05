import { Router } from "express";
import {
    getVAAc,
} from "../controllers/VAAc.controller.js";

const router = Router();

router.get("/:id",getVAAc);

export default router;
