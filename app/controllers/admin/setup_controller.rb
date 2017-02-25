module Admin
  class SetupController < Admin::ApplicationController
    def edit
      @blog = current_user.blogger
    end

    def update
      @blog = current_user.blogger
      @blog.update(blogger_params)

      redirect_to admin_setup_path
    end

    private

    def blogger_params
      params.require(:blogger).permit(:title, :slug, :description)
    end
  end
end
