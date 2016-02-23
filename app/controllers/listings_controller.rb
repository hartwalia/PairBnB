class ListingsController < ApplicationController

  before_action :require_login, only: [:new, :edit, :show]

  def index
  end

  def new
  end

  def edit
  end

  def show
  end
end
