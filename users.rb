# # post, follow, reply, upvote, downvote , shownewsfeed
# user -> name, 
#      -> login, signup
#      -> id for the user 

# common functions -> upvote/downvote posts 
#                  -> user A can follow user B 
#                  -> reply/comment to user B
#                  -> post (need to have list of all posts)
#                  -> shownewsfeed will work based on the user_followed, comment, recentposts


class User

  attr_accessor :name
  attr_accessor :userlist
  attr_accessor :followers

  def initialize(name)
      @name = name
      @followers = Array.new
      @userlist = Array.new
  end

  def addFollower(name)
      followers << name
  end

  def signup(name)
       if !userlist.include?(name)
           userlist << name
       end
  end


  def login(name) 
      begin
         if !userlist.include?(name)
            raise 'Create account to login'
         end

        rescue Exception => e
           puts "Error is #{e.Error}" 
        end
    end
      
  def display
     puts "Below are the followers of user #{@name}"
     for follower in @followers
         puts "the follower are #{follower}"
     end
  end

end

class Post < User
    attr_accessor :postlists
    
    VoteUser = Hash.new
    ReplyUser = Hash.new

    def initialize(name)
        super(name)
        @postlists = Array.new
    end

    def addPost(post)
        @postlists << post
    end

    def ReplyPost(user_name, post, reply)
         ReplyUser[user_name.to_sym][post] = reply
    end


    def upvote(user_name)
        if(VoteUser.include?(user_name.to_sym))
           VoteUser[user_name.to_sym] +=1
        else
        VoteUser[user_name.to_sym] = 1
       end
    end

    def downvote(user_name)
        VoteUser[user_name.to_sym] -= 1 
    end

    def displayPosts()
        puts "Below are the list of post done by #{@name}"
        count = 1 
        for post in postlists
            puts "the #{count}st post is #{post}"
            count +=1
        end
    end
end


P = Post.new("RK")
P.addFollower("Tom")
P.addFollower("albus")
P.display()

P.addPost("I am going to be the darkest dark wizard of all time")
P.addPost("I am lord Voldemort btw 3:)")

P.displayPosts()



