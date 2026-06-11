const ApiError = require('../utils/ApiError');

/**
 * Validates req.body / req.query / req.params against the given Zod schemas.
 * @param {{ body?: import('zod').ZodSchema, query?: import('zod').ZodSchema, params?: import('zod').ZodSchema }} schemas
 */
const validate = (schemas) => (req, res, next) => {
  try {
    if (schemas.body) {
      req.body = schemas.body.parse(req.body);
    }
    if (schemas.query) {
      req.query = schemas.query.parse(req.query);
    }
    if (schemas.params) {
      req.params = schemas.params.parse(req.params);
    }
    next();
  } catch (error) {
    const errors = error.errors?.map((e) => ({
      field: e.path.join('.'),
      message: e.message,
    })) || [];
    next(new ApiError(400, 'Validation failed', errors));
  }
};

module.exports = validate;
