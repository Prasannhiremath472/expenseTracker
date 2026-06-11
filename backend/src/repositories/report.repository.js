const prisma = require('../config/prisma');

const create = (data) => {
  return prisma.dailyReport.create({ data, include: { project: { select: { projectName: true } } } });
};

const findByIdAndUser = (id, userId) => {
  return prisma.dailyReport.findFirst({
    where: { id, userId },
    include: { project: { select: { projectName: true } } },
  });
};

const buildWhere = (userId, filters = {}) => {
  const { projectId, startDate, endDate } = filters;

  const where = { userId };

  if (projectId) where.projectId = projectId;

  if (startDate || endDate) {
    where.date = {};
    if (startDate) where.date.gte = startDate;
    if (endDate) where.date.lte = endDate;
  }

  return where;
};

const findAllByUser = (userId, filters = {}) => {
  const where = buildWhere(userId, filters);
  const { page = 1, limit = 20 } = filters;

  return prisma.dailyReport.findMany({
    where,
    include: { project: { select: { projectName: true } } },
    orderBy: { date: 'desc' },
    skip: (page - 1) * limit,
    take: limit,
  });
};

const countByUser = (userId, filters = {}) => {
  const where = buildWhere(userId, filters);
  return prisma.dailyReport.count({ where });
};

const update = (id, data) => {
  return prisma.dailyReport.update({
    where: { id },
    data,
    include: { project: { select: { projectName: true } } },
  });
};

const remove = (id) => {
  return prisma.dailyReport.delete({ where: { id } });
};

module.exports = {
  create,
  findByIdAndUser,
  findAllByUser,
  countByUser,
  update,
  remove,
};
