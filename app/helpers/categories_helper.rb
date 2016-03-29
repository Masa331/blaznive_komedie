module CategoriesHelper
  def categories_for_select
    [['Vše', '']] + Category.all.map{ |c| [c.title, c.id] }
  end
end
