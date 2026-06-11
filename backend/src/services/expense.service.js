const ApiError = require('../utils/ApiError');
const expenseRepository = require('../repositories/expense.repository');
const projectRepository = require('../repositories/project.repository');
const { uploadBufferToCloudinary } = require('../utils/cloudinaryUpload');

const ensureProjectOwnership = async (userId, projectId) => {
  const project = await projectRepository.findByIdAndUser(projectId, userId);
  if (!project) {
    throw new ApiError(404, 'Project not found');
  }
};

const createExpense = async (userId, data, file) => {
  await ensureProjectOwnership(userId, data.projectId);

  let billImageUrl = null;

  if (file) {
    const resourceType = file.mimetype === 'application/pdf' ? 'raw' : 'image';
    const result = await uploadBufferToCloudinary(file.buffer, `site-expense-tracker/${userId}/bills`, resourceType);
    billImageUrl = result.url;
  }

  return expenseRepository.create({
    ...data,
    userId,
    billImageUrl,
  });
};

const listExpenses = async (userId, filters) => {
  const [expenses, total] = await Promise.all([
    expenseRepository.findAllByUser(userId, filters),
    expenseRepository.countByUser(userId, filters),
  ]);

  return {
    expenses,
    pagination: {
      page: filters.page || 1,
      limit: filters.limit || 20,
      total,
      totalPages: Math.ceil(total / (filters.limit || 20)),
    },
  };
};

const getExpenseById = async (userId, id) => {
  const expense = await expenseRepository.findByIdAndUser(id, userId);

  if (!expense) {
    throw new ApiError(404, 'Expense not found');
  }

  return expense;
};

const updateExpense = async (userId, id, data, file) => {
  const existing = await expenseRepository.findByIdAndUser(id, userId);

  if (!existing) {
    throw new ApiError(404, 'Expense not found');
  }

  if (data.projectId) {
    await ensureProjectOwnership(userId, data.projectId);
  }

  const updateData = { ...data };

  if (file) {
    const resourceType = file.mimetype === 'application/pdf' ? 'raw' : 'image';
    const result = await uploadBufferToCloudinary(file.buffer, `site-expense-tracker/${userId}/bills`, resourceType);
    updateData.billImageUrl = result.url;
  }

  return expenseRepository.update(id, updateData);
};

const deleteExpense = async (userId, id) => {
  const existing = await expenseRepository.findByIdAndUser(id, userId);

  if (!existing) {
    throw new ApiError(404, 'Expense not found');
  }

  await expenseRepository.remove(id);
  return { message: 'Expense deleted successfully' };
};

module.exports = {
  createExpense,
  listExpenses,
  getExpenseById,
  updateExpense,
  deleteExpense,
};
