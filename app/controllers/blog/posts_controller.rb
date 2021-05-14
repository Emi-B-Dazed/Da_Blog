module Blog
    class PostsController < BlogController      
        # GET /posts or /posts.json
        def index
          @posts = Post.all
        end
      
        # GET /posts/1 or /posts/1.json
        def show
          @posts = Post.friendly.find(params[:id])
        end
      
      
      end
      
end