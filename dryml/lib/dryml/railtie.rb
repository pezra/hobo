module Dryml
  class Railtie < Rails::Railtie

    ActiveSupport.on_load(:before_initialize) do |app|
      require 'dryml'
      require 'dryml/template'
      require 'dryml/dryml_generator'
    end

    ActiveSupport.on_load(:action_controller) do
      require 'dryml/features/action_controller/dryml_methods'
    end

    ActiveSupport.on_load(:action_view) do
      ActionView::Template.register_template_handler("dryml", Dryml::TemplateHandler)
    end

  end
end