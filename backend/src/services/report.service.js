const ApiError = require('../utils/ApiError');
const reportRepository = require('../repositories/report.repository');
const projectRepository = require('../repositories/project.repository');
const { uploadBufferToCloudinary } = require('../utils/cloudinaryUpload');

const ensureProjectOwnership = async (userId, projectId) => {
  const project = await projectRepository.findByIdAndUser(projectId, userId);
  if (!project) {
    throw new ApiError(404, 'Project not found');
  }
};

const uploadPhotos = async (userId, files = []) => {
  const uploads = await Promise.all(
    files.map((file) => uploadBufferToCloudinary(file.buffer, `site-expense-tracker/${userId}/reports`, 'image'))
  );
  return uploads.map((u) => u.url);
};

const createReport = async (userId, data, files) => {
  await ensureProjectOwnership(userId, data.projectId);

  const sitePhotoUrls = await uploadPhotos(userId, files);

  return reportRepository.create({
    ...data,
    userId,
    sitePhotoUrls,
  });
};

const listReports = async (userId, filters) => {
  const [reports, total] = await Promise.all([
    reportRepository.findAllByUser(userId, filters),
    reportRepository.countByUser(userId, filters),
  ]);

  return {
    reports,
    pagination: {
      page: filters.page || 1,
      limit: filters.limit || 20,
      total,
      totalPages: Math.ceil(total / (filters.limit || 20)),
    },
  };
};

const getReportById = async (userId, id) => {
  const report = await reportRepository.findByIdAndUser(id, userId);

  if (!report) {
    throw new ApiError(404, 'Report not found');
  }

  return report;
};

const updateReport = async (userId, id, data, files) => {
  const existing = await reportRepository.findByIdAndUser(id, userId);

  if (!existing) {
    throw new ApiError(404, 'Report not found');
  }

  if (data.projectId) {
    await ensureProjectOwnership(userId, data.projectId);
  }

  const updateData = { ...data };

  if (files && files.length > 0) {
    const newPhotoUrls = await uploadPhotos(userId, files);
    updateData.sitePhotoUrls = [...existing.sitePhotoUrls, ...newPhotoUrls];
  }

  return reportRepository.update(id, updateData);
};

const deleteReport = async (userId, id) => {
  const existing = await reportRepository.findByIdAndUser(id, userId);

  if (!existing) {
    throw new ApiError(404, 'Report not found');
  }

  await reportRepository.remove(id);
  return { message: 'Report deleted successfully' };
};

module.exports = {
  createReport,
  listReports,
  getReportById,
  updateReport,
  deleteReport,
};
