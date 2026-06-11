const asyncHandler = require('../utils/asyncHandler');
const ApiResponse = require('../utils/ApiResponse');
const expenseService = require('../services/expense.service');

const createExpense = asyncHandler(async (req, res) => {
  const expense = await expenseService.createExpense(req.userId, req.body, req.file);
  return new ApiResponse(201, expense, 'Expense created successfully').send(res);
});

const listExpenses = asyncHandler(async (req, res) => {
  const result = await expenseService.listExpenses(req.userId, req.query);
  return new ApiResponse(200, result, 'Expenses fetched successfully').send(res);
});

const getExpense = asyncHandler(async (req, res) => {
  const expense = await expenseService.getExpenseById(req.userId, req.params.id);
  return new ApiResponse(200, expense, 'Expense fetched successfully').send(res);
});

const updateExpense = asyncHandler(async (req, res) => {
  const expense = await expenseService.updateExpense(req.userId, req.params.id, req.body, req.file);
  return new ApiResponse(200, expense, 'Expense updated successfully').send(res);
});

const deleteExpense = asyncHandler(async (req, res) => {
  const result = await expenseService.deleteExpense(req.userId, req.params.id);
  return new ApiResponse(200, result, result.message).send(res);
});

module.exports = {
  createExpense,
  listExpenses,
  getExpense,
  updateExpense,
  deleteExpense,
};
