class StatusesController < ApplicationController
  before_action :set_status, only: [:show, :edit, :update, :destroy]

  # GET /statuses
  def index
    @statuses = Status.all
  end

  # GET /statuses/1
  def show
  end

  # GET /statuses/new
  def new
    @status = Status.new
  end

  # GET /statuses/1/edit
  def edit
  end

  # POST /statuses
  def create
    @status = Status.new(status_params)

    respond_to do |format|
      if @status.save
        format.html { redirect_to @status, notice: 'Status was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /statuses/1
  def update
    respond_to do |format|
      if @status.update(status_params)
        format.html { redirect_to @status, notice: 'Status was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /statuses/1
  def destroy
    @status.destroy
    respond_to do |format|
      format.html { redirect_to statuses_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status
      @status = Status.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def status_params
      params.require(:status).permit(:name, :content)
    end
end
