const crypto = require('crypto');
const ApiError = require('../utils/ApiError');
const userRepository = require('../repositories/user.repository');
const { hashPassword, comparePassword } = require('../utils/password');
const { generateToken } = require('../utils/jwt');

const sanitizeUser = (user) => {
  const { password, resetToken, resetTokenExpiry, ...safeUser } = user;
  return safeUser;
};

const register = async ({ fullName, mobile, email, password }) => {
  const existingEmail = await userRepository.findByEmail(email);
  if (existingEmail) {
    throw new ApiError(409, 'Email is already registered');
  }

  const existingMobile = await userRepository.findByMobile(mobile);
  if (existingMobile) {
    throw new ApiError(409, 'Mobile number is already registered');
  }

  const hashedPassword = await hashPassword(password);

  const user = await userRepository.create({
    fullName,
    mobile,
    email,
    password: hashedPassword,
  });

  const token = generateToken({ userId: user.id });

  return { user: sanitizeUser(user), token };
};

const login = async ({ emailOrMobile, password }) => {
  const user = await userRepository.findByEmailOrMobile(emailOrMobile);

  if (!user) {
    throw new ApiError(401, 'Invalid credentials');
  }

  const isPasswordValid = await comparePassword(password, user.password);

  if (!isPasswordValid) {
    throw new ApiError(401, 'Invalid credentials');
  }

  const token = generateToken({ userId: user.id });

  return { user: sanitizeUser(user), token };
};

const forgotPassword = async ({ email }) => {
  const user = await userRepository.findByEmail(email);

  if (!user) {
    // Avoid leaking which emails are registered
    return { message: 'If an account exists for this email, a reset token has been generated' };
  }

  const resetToken = crypto.randomBytes(32).toString('hex');
  const resetTokenExpiry = new Date(Date.now() + 60 * 60 * 1000); // 1 hour

  await userRepository.updateResetToken(user.id, resetToken, resetTokenExpiry);

  // NOTE: In production, email this token to the user instead of returning it.
  return {
    message: 'Password reset token generated',
    resetToken,
  };
};

const resetPassword = async ({ token, newPassword }) => {
  const user = await userRepository.findByResetToken(token);

  if (!user || !user.resetTokenExpiry || user.resetTokenExpiry < new Date()) {
    throw new ApiError(400, 'Invalid or expired reset token');
  }

  const hashedPassword = await hashPassword(newPassword);
  await userRepository.updatePassword(user.id, hashedPassword);

  return { message: 'Password has been reset successfully' };
};

const getProfile = async (userId) => {
  const user = await userRepository.findById(userId);

  if (!user) {
    throw new ApiError(404, 'User not found');
  }

  return sanitizeUser(user);
};

module.exports = {
  register,
  login,
  forgotPassword,
  resetPassword,
  getProfile,
};
