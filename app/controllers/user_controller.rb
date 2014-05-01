class UserController < ApplicationController
  def login
  end
  def main
    @user=User.find(params[:id]) 
  end
  
  def send_login #Ruby for login.html.erb
    if User.where(:name=> params[:name]).first
        @user=User.login(params[:name],params[:phraseofpass])
        redirect_to "/main/#{@user.id}"
    else
      redirect_to "/user#login"
    end
  end
    
  def sign_up
    User.create({
      :name=>params[:name],
      :phraseofpass=>params[:phraseofpass],
      :location=>params[:location],
      :mood_pref=>params[:mood_pref],
      :email=>params[:email]
      })
      @user=User.where(:name=>params[:name], :phraseofpass=>params[:phraseofpass]).first
      redirect_to "/main/#{@user.id}"
    end
    
    def settings
      #render layout: "layout.html.erb"
      @user=User.find(params[:id])
    end
    
    def update_settings #Ruby for settings.html.erb
      @user=User.find(params[:id])
      @user.name=params[:new_name]
      @user.email=params[:new_email]
      @user.location=params[:new_location]
      @user.mood_pref=params[:new_mood_pref]
      @user.phraseofpass=params[:phraseofpass]
      redirect_to "/main/#{@user.id}"  
    end

    def main #Ruby for main.html.erb
      @user=User.find(params[:id])
    end

end