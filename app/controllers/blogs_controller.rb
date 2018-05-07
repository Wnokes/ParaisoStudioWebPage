class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  # access all: [:index, :show], user: {except: [:destroy, :new, :create, :update, :edit]}, admin: :all

  def index
    if logged_in?(:site_admin)
      @blogs = Blog.all
    else
      @blogs = Blog.all
    end
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
      if @blog.save
        redirect_to blog_path(@blog)
      else
        render :new
      end
  end

  def edit
  end
  
  def update
      if @blog.update(blog_params)
        @blog.save
        redirect_to @blog, notice: 'Your blog was edited successfully'
      else
        render :edit
      end
  end

  def show
  end
  
  def destroy
    if @blog.destroy
          redirect_to blogs_path, notice: 'Your blog was destroyed successfully'
      else
        render :show, notice: 'Your blog could not be destroyed'
      end
  end



  def toggle_status
    if @blog.draft?
      @blog.published!
    elsif @blog.published?
      @blog.draft!
    end      
    redirect_to blogs_path, notice:  "#{@blog.title} status has been updated."
  end


  private

    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
          params.require(:blog).permit(:title, :body)
    end

end
