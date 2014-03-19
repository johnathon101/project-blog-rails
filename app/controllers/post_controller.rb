class PostController < ActionController::Base  

  def compose #Ruby for compose.html.erb
    #render layout: "layout.html.erb"
    @user=User.find(params[:id])
  end
  
  def save#Ruby for save.html.erb
    #render layout: "layout.html.erb"
    @user=User.find(params[:id])
    Post.create({:title=>params[:title],
      :post=>params[:content],
      :user_id=>@user.id})
  end
  
  def all_posts#Ruby for all_posts.html.erb
    #render layout: "layout.html.erb"
    @user=User.find(params[:id])
    #@map_main=Heat.new
    a=@map_main.coord_map
  end
end