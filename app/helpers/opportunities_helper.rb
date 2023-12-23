module OpportunitiesHelper

  def display_content(content)
    parsed_content = JSON.parse(content)
    content_html = parsed_content['blocks'].map do |block|
      case block['type']
      when "paragraph"
        "<p>#{block['data']['text']}</p>"
      when 'list'
        list = ["<ul>"]
          block["data"]["items"].each do |item|
            list << "<li>#{item}</li>"
          end
        list << "</ul>"
        list.join("\n")
      else
        ''
      end
    end
    content_html.join.html_safe
  rescue
    ""
  end
end
