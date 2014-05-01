class PagesController < ApplicationController

  def login #Ruby for login.html.erb
    if User.where(:name=> params[:name]).first
        @user=User.login(params[:name],params[:password])
        redirect to "/main/#{@user}"
    else
      redirect to "/sign_up"
    end
  end
  
  def settings #Ruby for settings.html.erb
    @user=User.find(params[:id])
    @user.name=params[:new_name]
    @user.email=params[:new_email]
    @user.location=params[:new_location]
    @user.mood_pref=params[:new_mood_pref]
    @user.password=params[:new_password]
    redirect to "/main/#{@user.id}"  
  end
  
  def main #Ruby for main.html.erb
    @user=User.find(params[:id])
  end
  
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