module UsersHelper
  def myitem_lists(items)
    html = ''
    items.each do |item|
      html += render(partial: 'items/item', locals: { item: })
    end
    raw(html)
  end
end
