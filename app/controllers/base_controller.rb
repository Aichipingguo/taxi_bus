class  BaseController < ApplicationController
  layout  'ancient'
  before_action :auth_user
  before_filter :load_resource





  def load_resource(class_name = nil, obj_name = nil)
    class_name ||= controller_name.singularize.classify
    return unless class_exists?(class_name)
    scope = class_name.constantize
    if ['new', 'create'].include?(params[:action].to_s)
      resource = scope.new
    elsif params[:id].to_i > 0
      resource = scope.find_by_id(params[:id])
      return rt_404 unless resource
    else
      resource = nil
    end
    obj_name ||= class_name.tableize.singularize
    instance_variable_set("@#{obj_name}", resource)
  end

  def class_exists?(class_name)
   klass = Module.const_get(class_name)
   return klass.is_a?(Class)
  rescue NameError
   return false
  end


end
