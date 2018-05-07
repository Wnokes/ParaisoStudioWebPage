class PortfoliosController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  # access all: [:index, :show], user: {except: [:destroy, :new, :create, :update, :edit]}, admin: :all

  def index
   @portfolios = Portfolio.all
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(blog_params)
      if @portfolio.save
        redirect_to blog_path(@portfolio)
      else
        render :new
      end
  end

  def edit
  end
  
  def update
      if @portfolio.update(blog_params)
        @portfolio.save
        redirect_to @portfolio, notice: 'Your portfolio was edited successfully'
      else
        render :edit
      end
  end

  def show
  end
  
  def destroy
    if @portfolio.destroy
          redirect_to portfolios_path, notice: 'Your portfolio was destroyed successfully'
      else
        render :show, notice: 'Your portfolio could not be destroyed'
      end
  end



  def toggle_status
    if @portfolio.draft?
      @portfolio.published!
    elsif @portfolio.published?
      @portfolio.draft!
    end      
    redirect_to portfolios_path, notice:  "#{@portfolio.title} status has been updated."
  end


  private

    def set_portfolio
      @portfolio = Portfolio.find(params[:id])
    end

    def portfolio_params
          params.require(:portfolio).permit(:title, :description)
    end

end
