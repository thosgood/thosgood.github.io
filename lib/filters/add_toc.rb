require 'nokogiri'
class AddTocFilter < Nanoc::Filter

  identifier :add_toc

  def run(content, params={})
    doc = Nokogiri::HTML(content)
    headers = doc.css('#post-content h1').drop(1)
    title = doc.at_css('#post-title')
    toc_items = headers.map { |header| "<li><a href=\"\##{header["id"]}\">#{header.text}</a></li>" }
    title.add_next_sibling(Nokogiri::HTML.fragment("<ol id=\"toc\"></ol>"))
    toc_items.each do |item|
      doc.at_css('#toc').add_child(Nokogiri::HTML.fragment(item))
    end
    doc.to_s
  end

end
