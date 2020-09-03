class ItemsController < ApplicationController
  before_action user_admin, only: [:new]

  def new
  end

    private
      def user_admin
         @users = User.all
         if current_user.admin == false
             redirect_to root_path
         else
             render action: "new"
         end
      end

end
