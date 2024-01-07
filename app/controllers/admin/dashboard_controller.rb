class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']
  def show
    @total_items = Product.count
    @total_categories = Category.count
    @items_per_category = items_per_category
  end

  private

  def items_per_category
    categories = Category.all
    items_count_per_category = {}

    categories.each do |category|
      items_count_per_category[category.name] = category.products.count
    end

    items_count_per_category
  end
end
