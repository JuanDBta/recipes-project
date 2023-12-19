class ShoppingListsController < ApplicationController
    def index
      @shopping_list = {}
      recipes = Recipe.all
      recipes.each do |recipe|
        recipe.recipe_foods.each do |rf|
          food = rf.food
          next unless food && rf.quantity && food.quantity
  
          required_quantity = rf.quantity
          available_quantity = food.quantity
          next unless required_quantity > available_quantity
  
          to_purchase = required_quantity - available_quantity
          cost = to_purchase * food.price
  
          if @shopping_list.key?(food.name)
            @shopping_list[food.name][:required_quantity] += required_quantity
            @shopping_list[food.name][:to_purchase] += to_purchase
            @shopping_list[food.name][:cost] += cost
          else
            @shopping_list[food.name] = {
              name: food.name,
              measurement_unit: food.measurement_unit,
              required_quantity:,
              available_quantity:,
              to_purchase:,
              cost:
            }
          end
        end
      end
  
      @shopping_list = @shopping_list.values
    end
  end