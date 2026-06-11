const asyncHandler = require('../utils/asyncHandler');
const ApiResponse = require('../utils/ApiResponse');
const projectService = require('../services/project.service');

const createProject = asyncHandler(async (req, res) => {
  const project = await projectService.createProject(req.userId, req.body);
  return new ApiResponse(201, project, 'Project created successfully').send(res);
});

const listProjects = asyncHandler(async (req, res) => {
  const projects = await projectService.listProjects(req.userId, req.query.status);
  return new ApiResponse(200, projects, 'Projects fetched successfully').send(res);
});

const getProject = asyncHandler(async (req, res) => {
  const project = await projectService.getProjectById(req.userId, req.params.id);
  return new ApiResponse(200, project, 'Project fetched successfully').send(res);
});

const updateProject = asyncHandler(async (req, res) => {
  const project = await projectService.updateProject(req.userId, req.params.id, req.body);
  return new ApiResponse(200, project, 'Project updated successfully').send(res);
});

const deleteProject = asyncHandler(async (req, res) => {
  const result = await projectService.deleteProject(req.userId, req.params.id);
  return new ApiResponse(200, result, result.message).send(res);
});

module.exports = {
  createProject,
  listProjects,
  getProject,
  updateProject,
  deleteProject,
};
