const asyncHandler = require('../utils/asyncHandler');
const ApiResponse = require('../utils/ApiResponse');
const dashboardService = require('../services/dashboard.service');

const getDashboard = asyncHandler(async (req, res) => {
  const stats = await dashboardService.getDashboardStats(req.userId);
  return new ApiResponse(200, stats, 'Dashboard data fetched successfully').send(res);
});

module.exports = { getDashboard };
