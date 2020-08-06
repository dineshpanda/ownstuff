class Api::V1::BlogsController < Api::V1::GraphitiController
  def index
    blogs = BlogResource.all(params)
    respond_with(blogs)
  end

  def show
    blog = BlogResource.find(params)
    respond_with(blog)
  end

  def create
    blog = BlogResource.build(params)

    if blog.save
      render jsonapi: blog, status: 201
    else
      render jsonapi_errors: blog
    end
  end

  def update
    blog = BlogResource.find(params)

    if blog.update_attributes
      render jsonapi: blog
    else
      render jsonapi_errors: blog
    end
  end

  def destroy
    blog = BlogResource.find(params)

    if blog.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: blog
    end
  end
end
