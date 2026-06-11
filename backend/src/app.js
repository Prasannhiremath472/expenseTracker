const express = require('express');
const cors = require('cors');
const morgan = require('morgan');
const env = require('./config/env');
const errorMiddleware = require('./middleware/error.middleware');
const ApiError = require('./utils/ApiError');
const ApiResponse = require('./utils/ApiResponse');

const authRoutes = require('./routes/auth.routes');
const projectRoutes = require('./routes/project.routes');
const expenseRoutes = require('./routes/expense.routes');
const reportRoutes = require('./routes/report.routes');
const dashboardRoutes = require('./routes/dashboard.routes');

const app = express();

app.use(cors({ origin: env.corsOrigin }));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

if (env.nodeEnv === 'development') {
  app.use(morgan('dev'));
}

app.get('/api/health', (req, res) => {
  return new ApiResponse(200, { status: 'ok', timestamp: new Date().toISOString() }, 'Service is healthy').send(res);
});

app.use('/api/auth', authRoutes);
app.use('/api/projects', projectRoutes);
app.use('/api/expenses', expenseRoutes);
app.use('/api/reports', reportRoutes);
app.use('/api/dashboard', dashboardRoutes);

app.use((req, res, next) => {
  next(new ApiError(404, `Route not found: ${req.method} ${req.originalUrl}`));
});

app.use(errorMiddleware);

module.exports = app;
