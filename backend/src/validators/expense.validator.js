const { z } = require('zod');

const EXPENSE_CATEGORIES = [
  'MATERIAL',
  'LABOUR',
  'TRANSPORT',
  'MACHINERY',
  'DIESEL',
  'ELECTRICITY',
  'FOOD',
  'MISCELLANEOUS',
];

const PAYMENT_MODES = ['CASH', 'UPI', 'BANK_TRANSFER', 'CHEQUE', 'CARD'];

const createExpenseSchema = z.object({
  projectId: z.string().uuid('Invalid project id'),
  date: z.coerce.date({ errorMap: () => ({ message: 'Invalid date' }) }),
  category: z.enum(EXPENSE_CATEGORIES),
  amount: z.coerce.number().positive('Amount must be greater than 0'),
  description: z.string().trim().max(2000).optional().nullable(),
  vendorName: z.string().trim().max(150).optional().nullable(),
  paymentMode: z.enum(PAYMENT_MODES),
});

const updateExpenseSchema = createExpenseSchema.partial();

const expenseIdParamSchema = z.object({
  id: z.string().uuid('Invalid expense id'),
});

const listExpensesQuerySchema = z.object({
  projectId: z.string().uuid().optional(),
  category: z.enum(EXPENSE_CATEGORIES).optional(),
  startDate: z.coerce.date().optional(),
  endDate: z.coerce.date().optional(),
  search: z.string().trim().optional(),
  page: z.coerce.number().int().positive().optional().default(1),
  limit: z.coerce.number().int().positive().max(100).optional().default(20),
});

module.exports = {
  createExpenseSchema,
  updateExpenseSchema,
  expenseIdParamSchema,
  listExpensesQuerySchema,
  EXPENSE_CATEGORIES,
  PAYMENT_MODES,
};
