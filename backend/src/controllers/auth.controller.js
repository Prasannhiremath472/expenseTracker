const asyncHandler = require('../utils/asyncHandler');
const ApiResponse = require('../utils/ApiResponse');
const authService = require('../services/auth.service');

const register = asyncHandler(async (req, res) => {
  const result = await authService.register(req.body);
  return new ApiResponse(201, result, 'User registered successfully').send(res);
});

const login = asyncHandler(async (req, res) => {
  const result = await authService.login(req.body);
  return new ApiResponse(200, result, 'Login successful').send(res);
});

const forgotPassword = asyncHandler(async (req, res) => {
  const result = await authService.forgotPassword(req.body);
  return new ApiResponse(200, result, result.message).send(res);
});

const resetPassword = asyncHandler(async (req, res) => {
  const result = await authService.resetPassword(req.body);
  return new ApiResponse(200, result, result.message).send(res);
});

const getMe = asyncHandler(async (req, res) => {
  const user = await authService.getProfile(req.userId);
  return new ApiResponse(200, user, 'Profile fetched successfully').send(res);
});

module.exports = {
  register,
  login,
  forgotPassword,
  resetPassword,
  getMe,
};
