class PostController < ActionController::Base  
  def compose #Ruby for compose.html.erb
    @user=User.find(params[:id])
    @id=@user.id
  end
  
  def save#Ruby for save.html.erb
    @user=User.find(params[:id])
    @post=Post.new_post(@user.id, params[:title], params[:post])
    #@user=User.where(:name => name, :password=>password).first
  end
  
  def all_posts#Ruby for all_posts.html.erb
    @user=User.find(params[:id])
    @map_main=Heat.new
    a=@map_main.coord_map
  end
end