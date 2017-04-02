module ApplicationHelper
  def errors_for(object)
      if object.errors.any?
          content_tag(:div, id: "error_explanation") do
                  concat(content_tag(:div, class: "alert alert-danger") do
                      concat "The action failed because of the following errors:"
                  end)
                  concat(content_tag(:ul) do
                      object.errors.full_messages.each do |msg|
                          concat content_tag(:li, msg)
                  end
              end)
          end
      end
  end
end
