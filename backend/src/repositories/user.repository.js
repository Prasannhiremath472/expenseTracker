const prisma = require('../config/prisma');

const findByEmail = (email) => {
  return prisma.user.findUnique({ where: { email } });
};

const findByMobile = (mobile) => {
  return prisma.user.findUnique({ where: { mobile } });
};

const findByEmailOrMobile = (emailOrMobile) => {
  return prisma.user.findFirst({
    where: {
      OR: [{ email: emailOrMobile }, { mobile: emailOrMobile }],
    },
  });
};

const findById = (id) => {
  return prisma.user.findUnique({ where: { id } });
};

const create = (data) => {
  return prisma.user.create({ data });
};

const updateResetToken = (id, resetToken, resetTokenExpiry) => {
  return prisma.user.update({
    where: { id },
    data: { resetToken, resetTokenExpiry },
  });
};

const findByResetToken = (resetToken) => {
  return prisma.user.findFirst({ where: { resetToken } });
};

const updatePassword = (id, password) => {
  return prisma.user.update({
    where: { id },
    data: { password, resetToken: null, resetTokenExpiry: null },
  });
};

module.exports = {
  findByEmail,
  findByMobile,
  findByEmailOrMobile,
  findById,
  create,
  updateResetToken,
  findByResetToken,
  updatePassword,
};
