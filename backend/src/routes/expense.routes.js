const express = require('express');
const expenseController = require('../controllers/expense.controller');
const authMiddleware = require('../middleware/auth.middleware');
const validate = require('../middleware/validate.middleware');
const upload = require('../middleware/upload.middleware');
const {
  createExpenseSchema,
  updateExpenseSchema,
  expenseIdParamSchema,
  listExpensesQuerySchema,
} = require('../validators/expense.validator');

const router = express.Router();

router.use(authMiddleware);

router.get('/', validate({ query: listExpensesQuerySchema }), expenseController.listExpenses);

router.post(
  '/',
  upload.single('billImage'),
  validate({ body: createExpenseSchema }),
  expenseController.createExpense
);

router.get('/:id', validate({ params: expenseIdParamSchema }), expenseController.getExpense);

router.put(
  '/:id',
  upload.single('billImage'),
  validate({ params: expenseIdParamSchema, body: updateExpenseSchema }),
  expenseController.updateExpense
);

router.delete('/:id', validate({ params: expenseIdParamSchema }), expenseController.deleteExpense);

module.exports = router;
