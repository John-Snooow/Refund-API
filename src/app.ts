import 'express-async-errors';
import express from 'express';
import cors from 'cors';

import { routes } from './routes';
import { errorHandling } from './middlewares/error-handling';
import { AppError } from './utils/AppError';

const app = express();
app.use(cors());
app.use(express.json());

app.use(routes);
app.use(errorHandling);

export{ app };
