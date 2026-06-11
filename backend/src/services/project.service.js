const ApiError = require('../utils/ApiError');
const projectRepository = require('../repositories/project.repository');

const createProject = (userId, data) => {
  return projectRepository.create({ ...data, userId });
};

const listProjects = (userId, status) => {
  return projectRepository.findAllByUser(userId, status);
};

const getProjectById = async (userId, id) => {
  const project = await projectRepository.findByIdAndUserWithCounts(id, userId);

  if (!project) {
    throw new ApiError(404, 'Project not found');
  }

  return project;
};

const updateProject = async (userId, id, data) => {
  const existing = await projectRepository.findByIdAndUser(id, userId);

  if (!existing) {
    throw new ApiError(404, 'Project not found');
  }

  return projectRepository.update(id, data);
};

const deleteProject = async (userId, id) => {
  const existing = await projectRepository.findByIdAndUser(id, userId);

  if (!existing) {
    throw new ApiError(404, 'Project not found');
  }

  await projectRepository.remove(id);
  return { message: 'Project deleted successfully' };
};

module.exports = {
  createProject,
  listProjects,
  getProjectById,
  updateProject,
  deleteProject,
};
