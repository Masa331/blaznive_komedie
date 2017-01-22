class ComediesController < ApplicationController
  http_basic_authenticate_with name: Rails.application.secrets.admin_login, password: Rails.application.secrets.admin_password, except: [:index, :show]

  def show
    @comedy          = Comedy.find(params[:id])
    @next_comedy     = Comedy.next_by_id(@comedy.id)
    @previous_comedy = Comedy.previous_by_id(@comedy.id)
  end

  def index
    @comedies = Comedy.all.includes(:image).order(created_at: :desc).page(params[:page]).per(5)

    respond_to do |format|
      format.html do |html|
        html.desktop do
          @comedies = @comedies.includes(:tags)
        end

        html.tablet do
          @comedies = @comedies.includes(:tags)
        end
      end
    end
  end

  def new
    @tags = ActsAsTaggableOn::Tag.all
    @comedy_form = ComedyForm.new
  end

  def create
    @comedy_form = ComedyForm.new(permitted_params)

    if @comedy_form.save
      redirect_to comedies_path
    else
      render :new
    end
  end

  private

  def permitted_params
    params.require(:comedy_form).permit(:cz_title, :en_title, :text, :tag_list, :image_title, :video_title, :video_link, :uploaded_image)
  end
end
