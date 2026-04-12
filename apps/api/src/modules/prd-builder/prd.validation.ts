import { z } from 'zod';

// ---------------------------------------------------------------------------
// Create PRD Session
// ---------------------------------------------------------------------------

export const CreateSessionSchema = z.object({
  title: z
    .string({ required_error: 'Title is required' })
    .min(1, 'Title cannot be empty')
    .max(200, 'Title too long (max 200 characters)'),
  appId: z.coerce.number().int().positive().optional(),
  issueId: z.string().uuid().optional(),
  configId: z.string().uuid().optional(),
});

export type CreateSessionInput = z.infer<typeof CreateSessionSchema>;

// ---------------------------------------------------------------------------
// Upload Source
// ---------------------------------------------------------------------------

const ALLOWED_MIME_TYPES = [
  'application/pdf',
  'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
  'text/plain',
  'text/markdown',
  'image/png',
  'image/jpeg',
  'image/webp',
];

export const UploadSourceSchema = z.object({
  filename: z
    .string({ required_error: 'Filename is required' })
    .min(1)
    .max(500),
  mimeType: z
    .string()
    .refine(
      (v) => ALLOWED_MIME_TYPES.includes(v),
      { message: 'Unsupported file type. Accepted: PDF, DOCX, TXT, MD, PNG, JPEG, WebP' },
    )
    .default('text/plain'),
  fileSize: z.coerce
    .number()
    .int()
    .positive()
    .max(25 * 1024 * 1024, 'File too large (max 25MB)'),
  storageKey: z
    .string({ required_error: 'Storage key is required' })
    .min(1)
    .max(1000),
  content: z.string().max(500_000).optional(),
});

export type UploadSourceInput = z.infer<typeof UploadSourceSchema>;

// ---------------------------------------------------------------------------
// Update Section
// ---------------------------------------------------------------------------

export const UpdateSectionSchema = z.object({
  title: z.string().min(1).max(300).optional(),
  content: z.string().min(1).max(500_000).optional(),
  generatedBy: z.enum(['ai', 'user', 'hybrid']).optional(),
});

export type UpdateSectionInput = z.infer<typeof UpdateSectionSchema>;

// ---------------------------------------------------------------------------
// Validate PRD
// ---------------------------------------------------------------------------

export const ValidatePRDSchema = z.object({
  checkCategories: z
    .array(z.enum(['completeness', 'consistency', 'clarity', 'feasibility', 'testability']))
    .optional(),
});

export type ValidatePRDInput = z.infer<typeof ValidatePRDSchema>;

// ---------------------------------------------------------------------------
// Export PRD
// ---------------------------------------------------------------------------

export const ExportPRDSchema = z.object({
  format: z.enum(['markdown', 'yaml', 'json']).default('markdown'),
  includeMeta: z.boolean().default(true),
  includeExtractionData: z.boolean().default(false),
});

export type ExportPRDInput = z.infer<typeof ExportPRDSchema>;

// ---------------------------------------------------------------------------
// List Sessions Query
// ---------------------------------------------------------------------------

export const ListSessionsSchema = z.object({
  page: z.coerce.number().int().min(1).default(1),
  limit: z.coerce.number().int().min(1).max(100).default(20),
  status: z
    .enum(['draft', 'uploading', 'extracting', 'generating', 'validating', 'validated', 'exported', 'error'])
    .optional(),
  appId: z.coerce.number().int().positive().optional(),
});

export type ListSessionsQuery = z.infer<typeof ListSessionsSchema>;

// ---------------------------------------------------------------------------
// Extract Requirements (body is optional config)
// ---------------------------------------------------------------------------

export const ExtractRequirementsSchema = z.object({
  focusAreas: z.array(z.string().max(200)).max(20).optional(),
  language: z.string().max(10).default('en'),
});

export type ExtractRequirementsInput = z.infer<typeof ExtractRequirementsSchema>;

// ---------------------------------------------------------------------------
// Generate Sections (body is optional config)
// ---------------------------------------------------------------------------

export const GenerateSectionsSchema = z.object({
  templateStyle: z.enum(['standard', 'lean', 'detailed']).default('standard'),
  customSections: z.array(z.string().max(200)).max(30).optional(),
});

export type GenerateSectionsInput = z.infer<typeof GenerateSectionsSchema>;
