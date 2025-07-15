/*
  Warnings:

  - You are about to alter the column `amount` on the `refunds` table. The data in that column could be lost. The data in that column will be cast from `Decimal` to `Float`.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_refunds" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "amount" REAL NOT NULL,
    "Category" TEXT NOT NULL,
    "filename" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME,
    CONSTRAINT "refunds_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_refunds" ("Category", "amount", "created_at", "filename", "id", "name", "updated_at", "user_id") SELECT "Category", "amount", "created_at", "filename", "id", "name", "updated_at", "user_id" FROM "refunds";
DROP TABLE "refunds";
ALTER TABLE "new_refunds" RENAME TO "refunds";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
