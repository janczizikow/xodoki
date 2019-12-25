/**
 * Retrives file filename given a full path
 * @param {string} fullPath
 */
const getFilename = fullPath => fullPath.split(/(\\|\/)/g).pop();

export default getFilename;
