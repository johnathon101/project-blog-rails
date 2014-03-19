class Heat < ActiveRecord::Base
  s
  def self.build_coordinates
    d0=["CT","ME","MA","NH","RH","VT"]#ATL NE
    d1=["NJ","NY","PA"]#N ATL NE
    d2=["IL","IN","MI","OH","WI"]#MW NCentral
    d3=["IA","KS","MN","MO","NE","ND","SD"]#MIDWEST
    d4=["DE","FL","GA","MD","NC","SC","VA","WV"]#MID ATL S
    d5=["AL","KY","MS","TN"]#MIDWEST S MID CENTRAL
    d6=["AR","LA","OK","TX"]#SOUTH SOUTH WEST
    d7=["AZ","CO","ID","MT","NV","NM","UT","WY"]#MTN
    d8=["AK","CA","HI","OR","WA"]#WEST COAST
    @locations =[d0,d1,d2,d3,d4,d5,d6,d7,d8]
    @sum_totals=Array.new(9,1.0)
    i=0
    @locations.each do |place|
      div_total=User.joins(:posts).where(:location => place)
      sum=1
        if div_total!=[]
            div_total.each do |post|
              #post is the user here, here I need to get posts from user and sum the moods
              post_value=Post.joins(:user).where(:user_id=>post.id).first
              sum+=post_value.mood
            end
            @sum_totals[i]=sum
        end
        i+=1
      end
      return @sum_totals
  end  

  def coord_map
    @map=Heatmap::Map.new#({:width=>100, :height=>50})
    built=Heat.build_coordinates
    @map.points << Heatmap::Point.new(95,45,((built[0])/5))
    @map.points << Heatmap::Point.new(80,38,((built[1])/5))
    @map.points << Heatmap::Point.new(60,35,((built[2])/5))
    @map.points << Heatmap::Point.new(40,35,((built[3])/5))
    @map.points << Heatmap::Point.new(88,15,((built[4])/5))
    @map.points << Heatmap::Point.new(70,20,((built[5])/5))
    @map.points << Heatmap::Point.new(45,15,((built[6])/5))
    @map.points << Heatmap::Point.new(15,25,((built[7])/5))
    @map.points << Heatmap::Point.new(5,25,((built[8])/5))
    #@map.output("heatmap.png")
    @map.output("./app/public/heatmap.png")
  end
end
