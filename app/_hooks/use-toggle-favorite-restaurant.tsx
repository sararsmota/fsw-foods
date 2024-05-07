import { toast } from "sonner";
import { toggleFavoriteRestaurant } from "../_actions/restaurant";
import { UserFavoriteRestaurant } from "@prisma/client";

interface UseToggleFavoriteRestaurantProps {
  userId?: string;
  userFavoriteRestaurants?: UserFavoriteRestaurant[];
  restaurantId: string;
  restaurantIsFavorited?: boolean;
}

const useToggleFavoriteRestaurant = ({
  userId,
  restaurantId,
  restaurantIsFavorited,
}: UseToggleFavoriteRestaurantProps) => {
  const handleFavoriteClick = async () => {
    if (!userId) return;

    try {
      await toggleFavoriteRestaurant(userId, restaurantId);
      toast.success(
        restaurantIsFavorited
          ? "Restaurante removido dos favoritos!"
          : "Restaurante favoritado!",
      );
    } catch (error) {
      toast.error("Erro ao favoritar restaurante");
    }
  };

  return { handleFavoriteClick };
};

export default useToggleFavoriteRestaurant;
