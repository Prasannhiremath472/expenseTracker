const asyncHandler = require('../utils/asyncHandler');
const ApiResponse = require('../utils/ApiResponse');
const reportService = require('../services/report.service');

const createReport = asyncHandler(async (req, res) => {
  const report = await reportService.createReport(req.userId, req.body, req.files);
  return new ApiResponse(201, report, 'Daily report created successfully').send(res);
});

const listReports = asyncHandler(async (req, res) => {
  const result = await reportService.listReports(req.userId, req.query);
  return new ApiResponse(200, result, 'Reports fetched successfully').send(res);
});

const getReport = asyncHandler(async (req, res) => {
  const report = await reportService.getReportById(req.userId, req.params.id);
  return new ApiResponse(200, report, 'Report fetched successfully').send(res);
});

const updateReport = asyncHandler(async (req, res) => {
  const report = await reportService.updateReport(req.userId, req.params.id, req.body, req.files);
  return new ApiResponse(200, report, 'Report updated successfully').send(res);
});

const deleteReport = asyncHandler(async (req, res) => {
  const result = await reportService.deleteReport(req.userId, req.params.id);
  return new ApiResponse(200, result, result.message).send(res);
});

module.exports = {
  createReport,
  listReports,
  getReport,
  updateReport,
  deleteReport,
};
