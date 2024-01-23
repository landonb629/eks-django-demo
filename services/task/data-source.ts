import { DataSource } from "typeorm";

export const DataConnection = new DataSource({
  type: 'postgres',
  host: 'task_db',
  port: 5432,
  username: 'postgres',
  password: 'postgres',
  database: 'task_db',
  logging: true,
  entities: ["./entity/*.ts"]
})