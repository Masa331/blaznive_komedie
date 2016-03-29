module PostsHelper
  def post_meta(post)
    "Přidáno #{ l(post.created_at, format: :default) }"
  end
end
