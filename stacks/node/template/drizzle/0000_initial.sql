CREATE TABLE `users` (
  `id` int AUTO_INCREMENT NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255),
  CONSTRAINT `users_email_unique` UNIQUE(`email`),
  CONSTRAINT `users_pkey` PRIMARY KEY(`id`)
);
