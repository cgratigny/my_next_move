class DatepickerInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    Common::Form::Inputs::DatepickerComponent.new(given_wrapper_options: wrapper_options, simple_form_input: self, builder: @builder).render_in(ApplicationController.new.view_context)
  end
end
