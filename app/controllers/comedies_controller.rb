class ComediesController < ApplicationController
  before_action :restrict_only_admins, only: [:new, :create]

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
    @comedy_form = ComedyForm.new
    @tags = ActsAsTaggableOn::Tag.all
  end

  def create
    @comedy_form = ComedyForm.new(permitted_params)

    if @comedy_form.save
      redirect_to comedies_path
    else
      @tags = ActsAsTaggableOn::Tag.all
      render :new
    end
  end

  def edit
    comedy = Comedy.find(params[:id])
    @comedy_form = ComedyForm.new(comedy: comedy)
    @tags = ActsAsTaggableOn::Tag.all
  end

  def update
    comedy = Comedy.find(params[:id])
    @comedy_form = ComedyForm.new(comedy: comedy)
    @comedy_form.assign_attributes(permitted_params)

    if @comedy_form.save
      redirect_to comedy_path(comedy)
    else
      @tags = ActsAsTaggableOn::Tag.all
      render :edit
    end
  end

  private

  def permitted_params
    params.require(:comedy_form).permit(:cz_title, :en_title, :text, :tag_list, :image_title, :video_title, :youtube_link_uri, :image_image)
  end
end
