import { z } from 'zod';

const MAX_REQUIREMENT_DOCUMENT_BYTES = 5 * 1024 * 1024;
const MAX_REQUIREMENT_DOCUMENT_BASE64 = Math.ceil((MAX_REQUIREMENT_DOCUMENT_BYTES * 4) / 3) + 4;

const RequirementDocumentSchema = z.object({
  filename: z
    .string()
    .trim()
    .min(1, 'Filename is required')
    .max(255)
    .regex(/\.(doc|docx|pdf)$/i, 'Accepted files: DOC, DOCX, PDF'),
  mimeType: z.string().max(120).optional().default('application/octet-stream'),
  fileSize: z.coerce
    .number()
    .int()
    .positive('File size is required')
    .max(MAX_REQUIREMENT_DOCUMENT_BYTES, 'Requirement document must be 5 MB or smaller'),
  contentBase64: z
    .string()
    .min(1, 'File content is required')
    .max(MAX_REQUIREMENT_DOCUMENT_BASE64, 'Requirement document must be 5 MB or smaller')
    .regex(/^[A-Za-z0-9+/]+={0,2}$/, 'Invalid file content'),
});

// ── Create Issue ───────────────────────────────────────────────────────────
export const CreateIssueSchema = z.object({
  clientId: z.string().uuid('Invalid client ID'),
  appId: z.coerce.number().int().positive('Invalid application ID').optional(),
  appName: z.string().trim().min(1).max(300).optional(),
  pageId: z.coerce.number().int().min(0, 'Invalid page ID').optional(),
  pageName: z.string().trim().min(1).max(300).optional(),
  title: z.string({ required_error: 'Title is required' }).min(1, 'Title is required').max(300),
  description: z.string().max(5000).optional(),
  priority: z.enum(['low', 'medium', 'high', 'critical']).optional(),
  type: z.enum(['feature', 'bug', 'enhancement', 'task']).optional(),
  requestedBy: z.string().max(200).optional(),
  tags: z.array(z.string().max(50)).max(20).optional(),
  requirementDocument: RequirementDocumentSchema.optional(),
});

export type CreateIssueInput = z.infer<typeof CreateIssueSchema>;

// ── Update Issue ───────────────────────────────────────────────────────────
export const UpdateIssueSchema = z.object({
  title: z.string().min(1).max(300).optional(),
  description: z.string().max(5000).nullable().optional(),
  priority: z.enum(['low', 'medium', 'high', 'critical']).optional(),
  type: z.enum(['feature', 'bug', 'enhancement', 'task']).optional(),
  appId: z.coerce.number().int().positive('Invalid application ID').nullable().optional(),
  appName: z.string().trim().min(1).max(300).nullable().optional(),
  pageId: z.coerce.number().int().min(0, 'Invalid page ID').nullable().optional(),
  pageName: z.string().trim().min(1).max(300).nullable().optional(),
  assignedTo: z.string().uuid('Invalid user ID').nullable().optional(),
  requestedBy: z.string().max(200).nullable().optional(),
  tags: z.array(z.string().max(50)).max(20).optional(),
  prdSessionId: z.string().uuid().nullable().optional(),
  changeSetId: z.string().uuid().nullable().optional(),
  releaseId: z.string().uuid().nullable().optional(),
  testSuiteId: z.string().uuid().nullable().optional(),
});

export type UpdateIssueInput = z.infer<typeof UpdateIssueSchema>;

// ── List Issues Query ──────────────────────────────────────────────────────
export const ListIssuesSchema = z.object({
  page: z.coerce.number().int().min(1).default(1),
  limit: z.coerce.number().int().min(1).max(100).default(20),
  clientId: z.string().uuid('Invalid client ID').optional(),
  status: z
    .enum(['draft', 'validation', 'intake', 'prd', 'prd_approval', 'design', 'build', 'test', 'docs', 'done'])
    .optional(),
  priority: z.enum(['low', 'medium', 'high', 'critical']).optional(),
  type: z.enum(['feature', 'bug', 'enhancement', 'task']).optional(),
  assignedTo: z.string().uuid('Invalid user ID').optional(),
  search: z.string().max(255).optional(),
});

export type ListIssuesQuery = z.infer<typeof ListIssuesSchema>;

// ── Link Artifact ─────────────────────────────────────────────────────────
export const LinkArtifactSchema = z.object({
  artifactType: z.enum([
    'prd_session',
    'change_set',
    'release',
    'test_suite',
    'conversation',
    'editor_session',
  ]),
  artifactId: z.string().uuid('Invalid artifact ID'),
});

export type LinkArtifactInput = z.infer<typeof LinkArtifactSchema>;

// ── Transition Issue ───────────────────────────────────────────────────────
export const TransitionSchema = z.object({
  status: z.enum(['draft', 'validation', 'intake', 'prd', 'prd_approval', 'design', 'build', 'test', 'docs', 'done']),
  reason: z.string().max(2000).optional(),
  annotations: z.record(z.unknown()).optional(),
});

export type TransitionInput = z.infer<typeof TransitionSchema>;
