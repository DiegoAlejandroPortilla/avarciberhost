import mysql from "mysql";

import {
    DB_HOST,
    DB_USER,
    DB_PASSWORD,
    DB_NAME,
    DB_PORT
} from "./config.js";

export const db = mysql.createConnection({
    host: DB_HOST,
    user: DB_USER,
    password: DB_PASSWORD,
    database: DB_NAME,
    port: DB_PORT
})


/*export const db = mysql.createConnection({
    host: "localhost",
    user:"root",
    password: "password",
    database: "mapadecalor"
})*/