const prisma = require('../config/prisma');

const startOfDay = (date) => {
  const d = new Date(date);
  d.setHours(0, 0, 0, 0);
  return d;
};

const endOfDay = (date) => {
  const d = new Date(date);
  d.setHours(23, 59, 59, 999);
  return d;
};

const startOfMonth = (date) => new Date(date.getFullYear(), date.getMonth(), 1);

const getDashboardStats = async (userId) => {
  const now = new Date();
  const todayStart = startOfDay(now);
  const todayEnd = endOfDay(now);
  const monthStart = startOfMonth(now);
  const sixMonthsAgoStart = new Date(now.getFullYear(), now.getMonth() - 5, 1);

  const [
    totalProjects,
    activeProjects,
    totalExpensesAgg,
    monthlyExpensesAgg,
    todaysExpensesAgg,
    expenseByCategoryRaw,
    expensesForMonthlyChart,
    recentExpenses,
    recentReports,
  ] = await Promise.all([
    prisma.project.count({ where: { userId } }),
    prisma.project.count({ where: { userId, status: 'ACTIVE' } }),
    prisma.expense.aggregate({ where: { userId }, _sum: { amount: true } }),
    prisma.expense.aggregate({
      where: { userId, date: { gte: monthStart } },
      _sum: { amount: true },
    }),
    prisma.expense.aggregate({
      where: { userId, date: { gte: todayStart, lte: todayEnd } },
      _sum: { amount: true },
    }),
    prisma.expense.groupBy({
      by: ['category'],
      where: { userId },
      _sum: { amount: true },
    }),
    prisma.expense.findMany({
      where: { userId, date: { gte: sixMonthsAgoStart } },
      select: { date: true, amount: true },
    }),
    prisma.expense.findMany({
      where: { userId },
      include: { project: { select: { projectName: true } } },
      orderBy: { date: 'desc' },
      take: 5,
    }),
    prisma.dailyReport.findMany({
      where: { userId },
      include: { project: { select: { projectName: true } } },
      orderBy: { date: 'desc' },
      take: 5,
    }),
  ]);

  const expenseByCategory = expenseByCategoryRaw.map((item) => ({
    category: item.category,
    total: item._sum.amount || 0,
  }));

  // Build expense by month for last 6 months (including current)
  const monthlyTotals = new Map();
  for (let i = 0; i < 6; i++) {
    const d = new Date(now.getFullYear(), now.getMonth() - (5 - i), 1);
    const key = `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}`;
    monthlyTotals.set(key, 0);
  }

  for (const expense of expensesForMonthlyChart) {
    const d = new Date(expense.date);
    const key = `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}`;
    if (monthlyTotals.has(key)) {
      monthlyTotals.set(key, monthlyTotals.get(key) + Number(expense.amount));
    }
  }

  const expenseByMonth = Array.from(monthlyTotals.entries()).map(([month, total]) => ({
    month,
    total,
  }));

  return {
    totalProjects,
    activeProjects,
    totalExpenses: totalExpensesAgg._sum.amount || 0,
    monthlyExpenses: monthlyExpensesAgg._sum.amount || 0,
    todaysExpenses: todaysExpensesAgg._sum.amount || 0,
    expenseByCategory,
    expenseByMonth,
    recentExpenses,
    recentReports,
  };
};

module.exports = { getDashboardStats };
