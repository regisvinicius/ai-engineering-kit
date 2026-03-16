export const getHealthStatus = () => {
  return {
    status: "ok",
    timestamp: new Date().toISOString()
  };
};
