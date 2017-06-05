class  Ancient::BaseController < ApplicationController
   layout  'ancient'

  before_action :auth_user
end