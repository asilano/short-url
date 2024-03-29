class ShortenedUrlsController < ApplicationController
  skip_before_action :authenticate_user!, only: :visit
  before_action :set_shortened_url, only: %i[ show edit update destroy ]

  # GET /shortened_urls or /shortened_urls.json
  def index
    @shortened_urls = ShortenedUrl.where(user: current_user)
  end

  # GET /shortened_urls/1 or /shortened_urls/1.json
  def show
  end

  # GET /shortened_urls/new
  def new
    @shortened_url = ShortenedUrl.new
  end

  # GET /shortened_urls/1/edit
  def edit
  end

  # POST /shortened_urls or /shortened_urls.json
  def create
    @shortened_url = ShortenedUrl.new(shortened_url_params)
    @shortened_url.user = current_user

    respond_to do |format|
      if @shortened_url.save
        format.html { redirect_to @shortened_url, notice: "Shortened url was successfully created." }
        format.json { render :show, status: :created, location: @shortened_url }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shortened_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shortened_urls/1 or /shortened_urls/1.json
  def update
    respond_to do |format|
      if @shortened_url.update(shortened_url_params)
        format.html { redirect_to @shortened_url, notice: "Shortened url was successfully updated." }
        format.json { render :show, status: :ok, location: @shortened_url }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shortened_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shortened_urls/1 or /shortened_urls/1.json
  def destroy
    @shortened_url.destroy
    respond_to do |format|
      format.html { redirect_to shortened_urls_url, notice: "Shortened url was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def visit
    @shortened_url = ShortenedUrl.find_by(short_form: params[:short_form])
    raise ActiveRecord::RecordNotFound unless @shortened_url

    @shortened_url.count_visit

    redirect_to @shortened_url.target
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_shortened_url
    @shortened_url = ShortenedUrl.where(user: current_user).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def shortened_url_params
    params.require(:shortened_url).permit(:target)
  end
end
