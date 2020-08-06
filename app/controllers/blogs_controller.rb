class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show edit update destroy]

  # GET /blogs
  def index
    @q = Blog.ransack(params[:q])
    @blogs = @q.result(distinct: true).includes(:user).page(params[:page]).per(10)
  end

  # GET /blogs/1
  def show; end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit; end

  # POST /blogs
  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      message = "Blog was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @blog, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /blogs/1
  def update
    if @blog.update(blog_params)
      redirect_to @blog, notice: "Blog was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /blogs/1
  def destroy
    @blog.destroy
    message = "Blog was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to blogs_url, notice: message
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_blog
    @blog = Blog.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def blog_params
    params.require(:blog).permit(:content, :image, :user_id)
  end
end
