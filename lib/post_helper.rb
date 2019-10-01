module PostHelper
  def date_suffix(day)
    if (11..13).include?(day)
      return 'th'
    else
      case (day % 10)
        when 1
          return 'st'
        when 2
          return 'nd'
        when 3
          return 'rd'
        else
          return 'th'
      end
    end
  end

  def get_pretty_date(post)
    attribute_to_time(post[:created_at])
      .strftime('{%-d} %B, %Y')
      .gsub(/{(\d+)}/) { |d| $1 + date_suffix($1.to_i) }
  end

  def get_post_before_fold(post)
    fold_indicator = '<!-- more -->'
    content = post.compiled_content
    if content =~ /\s#{fold_indicator}\s/
      preview = content.partition(fold_indicator).first +
      "<a href='#{post.path}' class='link pa1 bg-black-10 black-80'>Continue reading &#8702;</a>"
    end
    return preview
  end
end

include PostHelper
