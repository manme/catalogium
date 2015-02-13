class Admin::CatalogFacade
  attr_reader :catalogs
  attr_reader :catalog

  def initialize
    @catalog = Catalog.new
  end

  def all
    @catalogs = Catalog.all
  end

  def find id
    @catalog = Catalog.find id
  end

  def create params
    @catalog = Catalog.new params
    @catalog.save
  end

  def update params
    @catalog.update params
  end

  def destroy
    @catalog.destroy
  end
end
