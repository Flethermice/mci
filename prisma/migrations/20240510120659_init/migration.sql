-- CreateEnum
CREATE TYPE "ImgType" AS ENUM ('GERMAN', 'CHINESE', 'MEXICAN');

-- CreateTable
CREATE TABLE "Session" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,

    CONSTRAINT "Session_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TestOneData" (
    "id" TEXT NOT NULL,
    "sessionId" TEXT NOT NULL,
    "stimuliNum" INTEGER NOT NULL,
    "responseTime" INTEGER NOT NULL,
    "error" BOOLEAN NOT NULL,

    CONSTRAINT "TestOneData_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TestTwoData" (
    "id" TEXT NOT NULL,
    "sessionId" TEXT NOT NULL,
    "stimuliNum" INTEGER NOT NULL,
    "responseTime" INTEGER NOT NULL,
    "error" BOOLEAN NOT NULL,

    CONSTRAINT "TestTwoData_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TestThreeData" (
    "id" TEXT NOT NULL,
    "sessionId" TEXT NOT NULL,
    "stimuliNum" INTEGER NOT NULL,
    "responseTime" INTEGER NOT NULL,
    "error" BOOLEAN NOT NULL,
    "type" "ImgType" NOT NULL,

    CONSTRAINT "TestThreeData_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "TestOneData" ADD CONSTRAINT "TestOneData_sessionId_fkey" FOREIGN KEY ("sessionId") REFERENCES "Session"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TestTwoData" ADD CONSTRAINT "TestTwoData_sessionId_fkey" FOREIGN KEY ("sessionId") REFERENCES "Session"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TestThreeData" ADD CONSTRAINT "TestThreeData_sessionId_fkey" FOREIGN KEY ("sessionId") REFERENCES "Session"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
