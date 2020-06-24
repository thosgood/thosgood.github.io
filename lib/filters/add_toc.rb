require 'nokogiri'
class AddTocFilter < Nanoc::Filter

  identifier :add_toc

  def run(content, params={})
    doc = Nokogiri::HTML(content)
    headers = doc.css('#post-content h1').drop(1)
    tag_list = doc.css('.tag-list')[0]
    toc_items = headers.map { |header| "<li><a href=\"\##{header["id"]}\">#{header.text}</a></li>" }
    tag_list.add_next_sibling(Nokogiri::HTML.fragment("<hr>"))
    tag_list.add_next_sibling(Nokogiri::HTML.fragment("<ol id=\"toc\"></ol>"))
    tag_list.add_next_sibling(Nokogiri::HTML.fragment("<hr>"))
    toc_items.each do |item|
      doc.at_css('#toc').add_child(Nokogiri::HTML.fragment(item))
    end
    headers.each do |header|
      header.add_next_sibling(Nokogiri::HTML.fragment('<a href="#post-title" class="toc-back">&#8607;</a>'))
    end
    doc.to_s
  end

end
