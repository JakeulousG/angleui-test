class StaticPagesController < ApplicationController
  include ApplicationHelper
  before_action :is_loggedin?
  def home
  end
end
