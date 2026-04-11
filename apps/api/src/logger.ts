import pino from 'pino';

const level = process.env.LOG_LEVEL ?? 'info';

export const logger = pino({
  level,
  transport:
    process.env.NODE_ENV === 'development'
      ? { target: 'pino/file', options: { destination: 1 } }
      : undefined,
  serializers: pino.stdSerializers,
  base: { service: 'apex-dev-api' },
  timestamp: pino.stdTimeFunctions.isoTime,
});
