module Author
    class PostsController < AuthorController
        before_action :set_post, only: %i[:show, :edit, :update, :destroy ]
      
        # GET /posts or /posts.json
        def index
          @posts = Post.all
        end
      
        # GET author/posts/1 or author/posts/1.json
        def show
          @posts = Post.friendly.find(params[:id])
        end
      
        # GET author/posts/new
        def new
          @post = Post.new
        end
      
        # GET author/posts/edit
        def edit
        end
      
        # POST posts
        # POST posts.json
        def create
          @post = Post.new(post_params)
      
          respond_to do |format|
            if @post.save
              format.html { redirect_to author_post_path(@post), notice: "Post was successfully created." }
              format.json { render :show, status: :created, location: @post }
            else
              format.html { render :new }
              format.json { render json: @post.errors, status: :unprocessable_entity }
            end
          end
        end
      
        # PATCH/PUT author/posts/1 or author/posts/1.json
        def update
          respond_to do |format|
            if @post.update(post_params)
              format.html { redirect_to author_post_path(@post), notice: "Post was successfully updated." }
              format.json { render :show, status: :ok, location: @post }
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @post.errors, status: :unprocessable_entity }
            end
          end
        end
      
        # DELETE /posts/1 or /posts/1.json
        def destroy
          @post = Post.friendly.find(params[:id])
          @post.destroy
          respond_to do |format|
            format.html { redirect_to author_posts_url, notice: "Post was successfully destroyed." }
            format.json { head :no_content }
          end
        end
      
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_post
            @post = Post.friendly.find(params[:id])
          end
      
          # Only allow a list of trusted parameters through.
          def post_params
            params.require(:post).permit(:title, :body, :description)
          end
      end
      
end