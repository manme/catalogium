class Admin::ProductTemplateFacade
  attr_reader :product_template
  attr_reader :product_templates

  def initialize
    @product_template = ProductTemplate.new
  end

  def all
    @product_templates = ProductTemplate.all
  end

  def find id
    @product_template = ProductTemplate.find id
  end

  def create params
    @product_template = ProductTemplate.new params
    @product_template.save
  end

  def update params
    @product_template.update params
  end

  def destroy
    @product_template.destroy
  end
end
