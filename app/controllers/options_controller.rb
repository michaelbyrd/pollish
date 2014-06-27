class OptionsController < ApplicationController
  before_action :set_poll
  before_action :set_option, only: [:show, :edit, :update, :destroy]

  # GET /options
  # GET /options.json
  def index
    @options = Option.all
  end

  # GET /options/1
  # GET /options/1.json
  def show
  end

  # GET /options/new
  def new
    @option = Option.new
  end

  # GET /options/1/edit
  def edit
  end

  # POST /options
  # POST /options.json
  def create
    @option = @poll.options.create(option_params)
      if @option.save
        redirect_to  poll_option_path(@poll), notice: 'Option was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /options/1
  # PATCH/PUT /options/1.json
  def update
    respond_to do |format|
      if @option.update(option_params)
        format.html { redirect_to @option, notice: 'Option was successfully updated.' }
        format.json { render :show, status: :ok, location: @option }
      else
        format.html { render :edit }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  # def createy
  #   @submission = @assignment.submissions.create(submission_params)
  #   if @submission.save
  #     redirect_to assignments_path, notice: 'Assignment was successfully submitted for review.'
  #   else
  #     redirect_to assignment_path(@assignment)
  #   end
  # end




  # DELETE /options/1
  # DELETE /options/1.json
  def destroy
    @option.destroy
    respond_to do |format|
      format.html { redirect_to options_url, notice: 'Option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_option
      @option = Option.find(params[:id])
    end

    def set_poll
      @poll = Poll.find(params[:poll_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def option_params
      params[:option].permit(:answer, :count)
    end
end
