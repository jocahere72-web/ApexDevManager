import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import {
  fetchSessions,
  fetchSession,
  createSession,
  uploadSource,
  extractRequirements,
  generateSections,
  validatePRD,
  exportPRD,
  updateSection,
} from '../../../services/prd.api';
import type {
  CreateSessionParams,
  UploadSourceParams,
  ExtractParams,
  GenerateParams,
  ValidateParams,
  ExportParams,
  UpdateSectionParams,
} from '../../../services/prd.api';

// ---------------------------------------------------------------------------
// Query key factory
// ---------------------------------------------------------------------------

export const prdKeys = {
  all: ['prd'] as const,
  sessions: (status?: string) => [...prdKeys.all, 'sessions', status ?? 'all'] as const,
  session: (id: string) => [...prdKeys.all, 'session', id] as const,
};

// ---------------------------------------------------------------------------
// usePRDSessions
// ---------------------------------------------------------------------------

export function usePRDSessions(status?: string) {
  return useQuery({
    queryKey: prdKeys.sessions(status),
    queryFn: () => fetchSessions({ status }),
  });
}

// ---------------------------------------------------------------------------
// usePRDSession
// ---------------------------------------------------------------------------

export function usePRDSession(id: string | null) {
  return useQuery({
    queryKey: prdKeys.session(id ?? ''),
    queryFn: () => fetchSession(id!),
    enabled: !!id,
  });
}

// ---------------------------------------------------------------------------
// useCreateSession
// ---------------------------------------------------------------------------

export function useCreateSession() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: (params: CreateSessionParams) => createSession(params),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: prdKeys.sessions() });
    },
  });
}

// ---------------------------------------------------------------------------
// useUploadSource
// ---------------------------------------------------------------------------

export function useUploadSource(sessionId: string) {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: (params: UploadSourceParams) => uploadSource(sessionId, params),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: prdKeys.session(sessionId) });
    },
  });
}

// ---------------------------------------------------------------------------
// useExtractRequirements
// ---------------------------------------------------------------------------

export function useExtractRequirements(sessionId: string) {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: (params: ExtractParams) => extractRequirements(sessionId, params),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: prdKeys.session(sessionId) });
    },
  });
}

// ---------------------------------------------------------------------------
// useGenerateSections
// ---------------------------------------------------------------------------

export function useGenerateSections(sessionId: string) {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: (params: GenerateParams) => generateSections(sessionId, params),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: prdKeys.session(sessionId) });
    },
  });
}

// ---------------------------------------------------------------------------
// useValidatePRD
// ---------------------------------------------------------------------------

export function useValidatePRD(sessionId: string) {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: (params: ValidateParams) => validatePRD(sessionId, params),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: prdKeys.session(sessionId) });
    },
  });
}

// ---------------------------------------------------------------------------
// useExportPRD
// ---------------------------------------------------------------------------

export function useExportPRD(sessionId: string) {
  return useMutation({
    mutationFn: (params: ExportParams) => exportPRD(sessionId, params),
  });
}

// ---------------------------------------------------------------------------
// useUpdateSection
// ---------------------------------------------------------------------------

export function useUpdateSection(sessionId: string) {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: (args: { sectionId: string; params: UpdateSectionParams }) =>
      updateSection(args.sectionId, args.params),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: prdKeys.session(sessionId) });
    },
  });
}
