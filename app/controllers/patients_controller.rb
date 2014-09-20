class PatientsController < ApplicationController
  load_and_authorize_resource :user
  load_and_authorize_resource :task, :through => :user
end
