const defaultPort = 3000;

const parsePort = (value: string | undefined) => {
  const port = Number(value ?? defaultPort);

  if (Number.isNaN(port) || port <= 0) {
    throw new Error("PORT must be a positive number.");
  }

  return port;
};

export const env = {
  host: process.env.HOST ?? "0.0.0.0",
  port: parsePort(process.env.PORT)
};
