module ApplicationHelper
  def full_title(page_title, site_section)
    if site_section.to_i>0
      if page_title.blank?
        "CUSFS Library #{separator_symbol} The library of the Cambridge University Science Fiction Society and Jómsborg the New"
      else
        "#{page_title} #{separator_symbol} CUSFS Library #{separator_symbol} The library of the Cambridge University Science Fiction Society and Jómsborg the New"
      end
    else
      if page_title.blank?
        "CUSFS #{separator_symbol} The website of the Cambridge University Science Fiction Society and Jómsborg the New"
      else
        "#{page_title} #{separator_symbol} CUSFS #{separator_symbol} The website of the Cambridge University Science Fiction Society and Jómsborg the New"
      end
    end
  end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

  def separator_symbol
    "¤"
  end
end
