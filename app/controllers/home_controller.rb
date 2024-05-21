class HomeController < ApplicationController
  def index
    @gears = Gear.order('created_at DESC')
    @blogs = Blog.includes(:user).order('created_at DESC')
  end
end
