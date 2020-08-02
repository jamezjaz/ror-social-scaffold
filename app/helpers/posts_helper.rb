module PostsHelper
  def posts_errors
    if @post.errors.full_messages.any?
      content_tag( :p, ("Post could not be saved. #{@post.errors.full_messages.join('. ')}"), :class=>'errors')
    end
  end
end