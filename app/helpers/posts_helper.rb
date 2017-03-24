module PostsHelper
  def render_post_content(post)
    simple_format(post.content)
  end
end
