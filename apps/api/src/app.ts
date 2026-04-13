import express, { type Request, type Response, type NextFunction } from 'express';
import helmet from 'helmet';
import cors from 'cors';
import compression from 'compression';
import pinoHttp from 'pino-http';
import { v4 as uuidv4 } from 'uuid';
import { logger } from './logger.js';
import { router } from './routes/index.js';

const CORRELATION_ID_HEADER = 'x-correlation-id';

export function createApp(): express.Express {
  const app = express();

  // Authenticated JSON APIs should return bodies instead of conditional 304s.
  app.set('etag', false);

  // Security headers
  app.use(helmet());

  // CORS
  const rawOrigins = process.env.CORS_ORIGINS?.split(',')
    .map((s) => s.trim())
    .filter(Boolean);
  const allowedOrigins = rawOrigins?.filter((o) => o !== '*');
  if (rawOrigins?.includes('*') && process.env.NODE_ENV === 'production') {
    throw new Error('CORS_ORIGINS cannot be "*" in production with credentials enabled');
  }
  app.use(
    cors({
      origin: allowedOrigins && allowedOrigins.length > 0 ? allowedOrigins : false,
      methods: ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'OPTIONS'],
      allowedHeaders: ['Content-Type', 'Authorization', CORRELATION_ID_HEADER],
      exposedHeaders: [CORRELATION_ID_HEADER],
      credentials: true,
    }),
  );

  // Compression
  app.use(compression());

  // Body parsing
  app.use(express.json({ limit: '10mb' }));
  app.use(express.urlencoded({ extended: true, limit: '10mb' }));

  // Correlation ID middleware
  app.use((req: Request, _res: Response, next: NextFunction) => {
    const correlationId = (req.headers[CORRELATION_ID_HEADER] as string) ?? uuidv4();
    req.correlationId = correlationId;
    next();
  });

  // HTTP request logging
  app.use(
    pinoHttp({
      logger,
      genReqId: (req) => (req as Request).correlationId ?? uuidv4(),
      customProps: (req) => ({
        correlationId: (req as Request).correlationId,
      }),
      serializers: {
        req: (req) => ({
          method: req.method,
          url: req.url,
          correlationId: req.raw?.headers?.[CORRELATION_ID_HEADER],
        }),
        res: (res) => ({
          statusCode: res.statusCode,
        }),
      },
    }),
  );

  // Mount routes
  app.use(router);

  // 404 handler
  app.use((_req: Request, res: Response) => {
    res.status(404).json({
      success: false,
      error: {
        code: 'NOT_FOUND',
        message: 'The requested resource was not found',
      },
    });
  });

  // Global error handler
  app.use((err: Error, req: Request, res: Response, _next: NextFunction) => {
    const correlationId = req.correlationId ?? 'unknown';

    logger.error(
      {
        err,
        correlationId,
        method: req.method,
        url: req.url,
      },
      'Unhandled error',
    );

    const statusCode =
      'statusCode' in err ? (err as Error & { statusCode: number }).statusCode : 500;

    res.status(statusCode).json({
      success: false,
      error: {
        code: 'INTERNAL_SERVER_ERROR',
        message:
          process.env.NODE_ENV === 'production' ? 'An unexpected error occurred' : err.message,
        correlationId,
      },
    });
  });

  return app;
}
