class Admin::ProductFacade
  attr_reader :catalog
  attr_reader :products
  attr_reader :product

  def initialize catalog_id
    @catalog = Catalog.find catalog_id
    @product = @catalog.products.build
  end

  def all
    @products = @catalog.products.all
  end

  def find id
    @product = @catalog.products.find id
  end

  def create params
    @product = @catalog.products.build params
    @product.save
  end

  def update params
    @product.update params
  end

  def destroy
    @product.destroy
  end
end
