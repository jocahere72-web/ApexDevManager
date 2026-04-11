import { z } from 'zod';

const configSchema = z.object({
  port: z
    .string()
    .default('3001')
    .transform((val) => parseInt(val, 10))
    .pipe(z.number().min(1).max(65535)),

  nodeEnv: z.enum(['development', 'production', 'test']).default('development'),

  databaseUrl: z.string().url().describe('PostgreSQL connection string'),

  redisUrl: z.string().url().describe('Redis connection string'),

  jwtSecret: z.string().min(32, 'JWT secret must be at least 32 characters'),

  jwtExpiresIn: z.string().default('15m').describe('JWT token expiration duration'),

  ociVaultId: z.string().optional().describe('OCI Vault OCID for secrets management'),

  logLevel: z.enum(['fatal', 'error', 'warn', 'info', 'debug', 'trace']).default('info'),
});

export type Config = z.infer<typeof configSchema>;

function loadConfig(): Config {
  const result = configSchema.safeParse({
    port: process.env.PORT,
    nodeEnv: process.env.NODE_ENV,
    databaseUrl: process.env.DATABASE_URL,
    redisUrl: process.env.REDIS_URL,
    jwtSecret: process.env.JWT_SECRET,
    jwtExpiresIn: process.env.JWT_EXPIRES_IN,
    ociVaultId: process.env.OCI_VAULT_ID,
    logLevel: process.env.LOG_LEVEL,
  });

  if (!result.success) {
    const formatted = result.error.format();
    console.error('Invalid environment configuration:');
    console.error(JSON.stringify(formatted, null, 2));
    process.exit(1);
  }

  return result.data;
}

export const config = loadConfig();
