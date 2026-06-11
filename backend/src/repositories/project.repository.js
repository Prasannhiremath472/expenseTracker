const prisma = require('../config/prisma');

const create = (data) => {
  return prisma.project.create({ data });
};

const findAllByUser = (userId, status) => {
  return prisma.project.findMany({
    where: {
      userId,
      ...(status ? { status } : {}),
    },
    orderBy: { createdAt: 'desc' },
  });
};

const findByIdAndUser = (id, userId) => {
  return prisma.project.findFirst({ where: { id, userId } });
};

const findByIdAndUserWithCounts = async (id, userId) => {
  const project = await prisma.project.findFirst({
    where: { id, userId },
    include: {
      _count: {
        select: { expenses: true, dailyReports: true },
      },
    },
  });

  if (!project) return null;

  const totalExpensesAgg = await prisma.expense.aggregate({
    where: { projectId: id },
    _sum: { amount: true },
  });

  return {
    ...project,
    totalExpenses: totalExpensesAgg._sum.amount || 0,
  };
};

const update = (id, data) => {
  return prisma.project.update({ where: { id }, data });
};

const remove = (id) => {
  return prisma.project.delete({ where: { id } });
};

const countByUser = (userId, status) => {
  return prisma.project.count({
    where: {
      userId,
      ...(status ? { status } : {}),
    },
  });
};

module.exports = {
  create,
  findAllByUser,
  findByIdAndUser,
  findByIdAndUserWithCounts,
  update,
  remove,
  countByUser,
};
