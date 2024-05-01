import { db } from "@/app/_lib/prisma";
import { notFound } from "next/navigation";

import ProductDetails from "./_components/product-details";
import ProductImage from "./_components/product-image";

interface ProductPageProps {
  params: {
    id: string;
  };
}

const ProductsPage = async ({ params: { id } }: ProductPageProps) => {
  const product = await db.product.findUnique({
    where: {
      id,
    },
    include: {
      restaurant: true,
    },
  });

  const juices = await db.product.findMany({
    where: {
      category: {
        name: "Sucos",
      },
    },
    include: {
      restaurant: true,
    },
  });

  if (!product) {
    return notFound();
  }

  return (
    <div>
      {/* IMAGEM */}
      <ProductImage product={product} />

      {/* TITULO E PREÇO */}

      <ProductDetails product={product} complementaryProducts={juices} />
    </div>
  );
};

export default ProductsPage;
