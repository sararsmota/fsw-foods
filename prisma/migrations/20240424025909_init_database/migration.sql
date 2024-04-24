/*
  Warnings:

  - You are about to drop the `Retaurant` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_CategoryToRetaurant` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Product" DROP CONSTRAINT "Product_restaurantId_fkey";

-- DropForeignKey
ALTER TABLE "_CategoryToRetaurant" DROP CONSTRAINT "_CategoryToRetaurant_A_fkey";

-- DropForeignKey
ALTER TABLE "_CategoryToRetaurant" DROP CONSTRAINT "_CategoryToRetaurant_B_fkey";

-- DropTable
DROP TABLE "Retaurant";

-- DropTable
DROP TABLE "_CategoryToRetaurant";

-- CreateTable
CREATE TABLE "Restaurant" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "imageUrl" TEXT NOT NULL,
    "deliveryFee" DECIMAL(10,2) NOT NULL,
    "deliveryTimeMinutes" INTEGER NOT NULL,

    CONSTRAINT "Restaurant_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_CategoryToRestaurant" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_CategoryToRestaurant_AB_unique" ON "_CategoryToRestaurant"("A", "B");

-- CreateIndex
CREATE INDEX "_CategoryToRestaurant_B_index" ON "_CategoryToRestaurant"("B");

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_restaurantId_fkey" FOREIGN KEY ("restaurantId") REFERENCES "Restaurant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CategoryToRestaurant" ADD CONSTRAINT "_CategoryToRestaurant_A_fkey" FOREIGN KEY ("A") REFERENCES "Category"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CategoryToRestaurant" ADD CONSTRAINT "_CategoryToRestaurant_B_fkey" FOREIGN KEY ("B") REFERENCES "Restaurant"("id") ON DELETE CASCADE ON UPDATE CASCADE;
