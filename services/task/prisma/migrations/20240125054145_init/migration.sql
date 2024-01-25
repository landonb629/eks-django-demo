-- CreateTable
CREATE TABLE "Task" (
    "task_id" SERIAL NOT NULL,
    "created_by" VARCHAR(255) NOT NULL,
    "task_name" TEXT NOT NULL,
    "task_description" TEXT NOT NULL,
    "task_status" TEXT NOT NULL,

    CONSTRAINT "Task_pkey" PRIMARY KEY ("task_id")
);
