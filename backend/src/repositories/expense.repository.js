const prisma = require('../config/prisma');

const create = (data) => {
  return prisma.expense.create({ data, include: { project: { select: { projectName: true } } } });
};

const findByIdAndUser = (id, userId) => {
  return prisma.expense.findFirst({
    where: { id, userId },
    include: { project: { select: { projectName: true } } },
  });
};

const buildWhere = (userId, filters = {}) => {
  const { projectId, category, startDate, endDate, search } = filters;

  const where = { userId };

  if (projectId) where.projectId = projectId;
  if (category) where.category = category;

  if (startDate || endDate) {
    where.date = {};
    if (startDate) where.date.gte = startDate;
    if (endDate) where.date.lte = endDate;
  }

  if (search) {
    where.OR = [
      { vendorName: { contains: search, mode: 'insensitive' } },
      { description: { contains: search, mode: 'insensitive' } },
    ];
  }

  return where;
};

const findAllByUser = (userId, filters = {}) => {
  const where = buildWhere(userId, filters);
  const { page = 1, limit = 20 } = filters;

  return prisma.expense.findMany({
    where,
    include: { project: { select: { projectName: true } } },
    orderBy: { date: 'desc' },
    skip: (page - 1) * limit,
    take: limit,
  });
};

const countByUser = (userId, filters = {}) => {
  const where = buildWhere(userId, filters);
  return prisma.expense.count({ where });
};

const update = (id, data) => {
  return prisma.expense.update({
    where: { id },
    data,
    include: { project: { select: { projectName: true } } },
  });
};

const remove = (id) => {
  return prisma.expense.delete({ where: { id } });
};

module.exports = {
  create,
  findByIdAndUser,
  findAllByUser,
  countByUser,
  update,
  remove,
};
