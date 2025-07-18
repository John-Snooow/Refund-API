import { Router } from "express";

import { usersRoutes } from "./users-routes";
import { refundsRoutes } from "./refunds-routes";
import { sessionsRoutes } from "./sessions-routes";

const routes = Router()

//rotas públicas
routes.use("/users", usersRoutes)
routes.use("/sessions", sessionsRoutes)

//rotas privadas 
routes.use("/refunds", refundsRoutes)
export { routes }
