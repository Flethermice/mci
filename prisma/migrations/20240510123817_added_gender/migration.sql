/*
  Warnings:

  - The values [GERMAN,CHINESE,MEXICAN] on the enum `ImgType` will be removed. If these variants are still used in the database, this will fail.
  - Added the required column `age` to the `Session` table without a default value. This is not possible if the table is not empty.
  - Added the required column `gender` to the `Session` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "Gender" AS ENUM ('male', 'female', 'diverse');

-- AlterEnum
BEGIN;
CREATE TYPE "ImgType_new" AS ENUM ('german', 'chinese', 'mexican');
ALTER TABLE "TestThreeData" ALTER COLUMN "type" TYPE "ImgType_new" USING ("type"::text::"ImgType_new");
ALTER TYPE "ImgType" RENAME TO "ImgType_old";
ALTER TYPE "ImgType_new" RENAME TO "ImgType";
DROP TYPE "ImgType_old";
COMMIT;

-- AlterTable
ALTER TABLE "Session" ADD COLUMN     "age" INTEGER NOT NULL,
ADD COLUMN     "gender" "Gender" NOT NULL;
