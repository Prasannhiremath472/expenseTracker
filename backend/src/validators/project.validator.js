const { z } = require('zod');

const PROJECT_STATUSES = ['ACTIVE', 'COMPLETED', 'ON_HOLD'];

const createProjectSchema = z.object({
  projectName: z.string().trim().min(2, 'Project name is required').max(150),
  clientName: z.string().trim().min(1, 'Client name is required').max(150),
  siteAddress: z.string().trim().min(1, 'Site address is required').max(500),
  startDate: z.coerce.date({ errorMap: () => ({ message: 'Invalid start date' }) }),
  estimatedBudget: z.coerce.number().nonnegative('Estimated budget must be a positive number'),
  description: z.string().trim().max(2000).optional().nullable(),
  status: z.enum(PROJECT_STATUSES).optional(),
});

const updateProjectSchema = createProjectSchema.partial();

const projectIdParamSchema = z.object({
  id: z.string().uuid('Invalid project id'),
});

const listProjectsQuerySchema = z.object({
  status: z.enum(PROJECT_STATUSES).optional(),
});

module.exports = {
  createProjectSchema,
  updateProjectSchema,
  projectIdParamSchema,
  listProjectsQuerySchema,
  PROJECT_STATUSES,
};
