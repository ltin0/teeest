import express, { Request, Response } from 'express';

import { AppError } from '@shared/errors/AppError';

const app = express();

app.use((err: Error, request: Request, response: Response) => {
  if (err instanceof AppError) {
    return response.status(err.statusCode).json({ message: err.message });
  }

  return response.status(500).json({
    status: 'error',
    message: ` Internal server error - ${err.message}`,
  });
});

app.listen(process.env.PORT || 3333, () => console.log('server is running!'));
