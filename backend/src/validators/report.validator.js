const { z } = require('zod');

const createReportSchema = z.object({
  projectId: z.string().uuid('Invalid project id'),
  date: z.coerce.date({ errorMap: () => ({ message: 'Invalid date' }) }),
  workersCount: z.coerce.number().int().nonnegative('Workers count must be 0 or more'),
  workCompleted: z.string().trim().max(2000).optional().nullable(),
  materialsUsed: z.string().trim().max(2000).optional().nullable(),
  issuesFaced: z.string().trim().max(2000).optional().nullable(),
  notes: z.string().trim().max(2000).optional().nullable(),
});

const updateReportSchema = createReportSchema.partial();

const reportIdParamSchema = z.object({
  id: z.string().uuid('Invalid report id'),
});

const listReportsQuerySchema = z.object({
  projectId: z.string().uuid().optional(),
  startDate: z.coerce.date().optional(),
  endDate: z.coerce.date().optional(),
  page: z.coerce.number().int().positive().optional().default(1),
  limit: z.coerce.number().int().positive().max(100).optional().default(20),
});

module.exports = {
  createReportSchema,
  updateReportSchema,
  reportIdParamSchema,
  listReportsQuerySchema,
};
