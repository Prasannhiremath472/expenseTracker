const streamifier = require('streamifier');
const cloudinary = require('../config/cloudinary');

/**
 * Uploads a file buffer to Cloudinary using an upload stream.
 * @param {Buffer} buffer - file buffer from multer memory storage
 * @param {string} folder - Cloudinary folder path
 * @param {string} resourceType - 'image' | 'raw' | 'auto'
 * @returns {Promise<{url: string, publicId: string}>}
 */
const uploadBufferToCloudinary = (buffer, folder, resourceType = 'auto') => {
  return new Promise((resolve, reject) => {
    const uploadStream = cloudinary.uploader.upload_stream(
      { folder, resource_type: resourceType },
      (error, result) => {
        if (error) return reject(error);
        resolve({ url: result.secure_url, publicId: result.public_id });
      }
    );
    streamifier.createReadStream(buffer).pipe(uploadStream);
  });
};

module.exports = { uploadBufferToCloudinary };
