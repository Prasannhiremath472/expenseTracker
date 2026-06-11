const express = require('express');
const projectController = require('../controllers/project.controller');
const authMiddleware = require('../middleware/auth.middleware');
const validate = require('../middleware/validate.middleware');
const {
  createProjectSchema,
  updateProjectSchema,
  projectIdParamSchema,
  listProjectsQuerySchema,
} = require('../validators/project.validator');

const router = express.Router();

router.use(authMiddleware);

router.get('/', validate({ query: listProjectsQuerySchema }), projectController.listProjects);
router.post('/', validate({ body: createProjectSchema }), projectController.createProject);
router.get('/:id', validate({ params: projectIdParamSchema }), projectController.getProject);
router.put(
  '/:id',
  validate({ params: projectIdParamSchema, body: updateProjectSchema }),
  projectController.updateProject
);
router.delete('/:id', validate({ params: projectIdParamSchema }), projectController.deleteProject);

module.exports = router;
