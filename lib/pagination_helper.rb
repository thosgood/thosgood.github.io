module PaginationHelper
  def generate_pages(articles, title, base_url='')
    articles_to_paginate = articles
    pages = (articles.size - 1) / @config[:page_size] + 1
    article_groups = []
    until articles_to_paginate.empty?
      article_groups << articles_to_paginate.slice!(0..@config[:page_size]-1)
    end
    article_groups.each_with_index do |subarticles, i|
      items << Nanoc::Item.new("<%= render 'page', :pages => #{pages}, :page => #{i + 1}, :base_url => \"#{base_url}\" %>", {
        :title => title,
        :created_at => DateTime.now,
        :articles => subarticles
      }, link_for_page(i + 1, base_url))
    end
  end

  def link_for_page(page, base_url='')
    page == 1 ? base_url + '/' : "#{base_url}/page/#{page}"
  end
end

include PaginationHelper
