require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
  
    it 'ensures that a product saves if all 4 fields are filled out' do
      @category = Category.create(name: 'Hats')
      @product = Product.create(name: 'cowboy', category: @category, quantity: 1, price: 100)
      @product.save!
      expect(@product).to be_valid
    end

    it 'returns an error if Name is blank' do
      @category = Category.create(name: 'Hats')
      @product = Product.create(name: nil, category: @category, quantity: 1, price: 100)
      expect(@product.errors.full_messages[0]).to eq "Name can't be blank"
    end

    it 'returns an error if Quantity is blank' do
      @category = Category.create(name: 'Hats')
      @product = Product.create(name: 'cowboy', category: @category, quantity: nil, price: 100)
      expect(@product.errors.full_messages[0]).to eq "Quantity can't be blank"
    end

    it 'returns an error if Category is blank' do
      @product = Product.create(name: 'cowboy', category: nil, quantity: 1, price: 100)
      expect(@product.errors.full_messages[0]).to eq "Category must exist"
    end

    it 'returns an error if Price is not a number' do
      @category = Category.create(name: 'Hats')
      @product = Product.create(name: 'cowboy', category: @category, quantity: 1, price: '')
      expect(@product.errors.full_messages[0]).to eq "Price is not a number"
    end
  end
end
