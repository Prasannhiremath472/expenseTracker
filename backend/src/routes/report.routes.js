const express = require('express');
const reportController = require('../controllers/report.controller');
const authMiddleware = require('../middleware/auth.middleware');
const validate = require('../middleware/validate.middleware');
const upload = require('../middleware/upload.middleware');
const {
  createReportSchema,
  updateReportSchema,
  reportIdParamSchema,
  listReportsQuerySchema,
} = require('../validators/report.validator');

const router = express.Router();

router.use(authMiddleware);

router.get('/', validate({ query: listReportsQuerySchema }), reportController.listReports);

router.post(
  '/',
  upload.array('sitePhotos', 10),
  validate({ body: createReportSchema }),
  reportController.createReport
);

router.get('/:id', validate({ params: reportIdParamSchema }), reportController.getReport);

router.put(
  '/:id',
  upload.array('sitePhotos', 10),
  validate({ params: reportIdParamSchema, body: updateReportSchema }),
  reportController.updateReport
);

router.delete('/:id', validate({ params: reportIdParamSchema }), reportController.deleteReport);

module.exports = router;
