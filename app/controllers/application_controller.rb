class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include ArticlesHelper
  include Admin::RightsHelper
  include Admin::DatatablesHelper
  include Admin::TablesHelper
  include ApplicationHelper
  include GroupsHelper
end
