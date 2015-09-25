class ThoughtsController < ApplicationController
  before_action :set_thought, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!, except: [:index, :show]

  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    if params[:tag]
      @thoughts = Thought.tagged_with(params[:tag])
    else
      @thoughts = Thought.all.order("created_at DESC")
    end
  end

  def show

  end

  def new
    @thought = Thought.new
  end

  def edit
  end

  def create
    @thought = current_user.thoughts.build(thought_params)
    if @thought.save
      redirect_to @thought, notice: 'Thought was successfully created.'
    else
      render :new
    end
  end

  def update
      if @thought.update(thought_params)
        redirect_to @thought, notice: 'Thought was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @thought.destroy
    redirect_to thoughts_url, notice: 'Thought was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thought
      @thought = Thought.find(params[:id])
    end

    def correct_user
        @thought = current_user.thoughts.find_by(id: params[:id])
        redirect_to thoughts_path, notice: "Not authorized to edit this Thought" if @thought.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def thought_params
      params.require(:thought).permit(:description, :title, :image, :tag_list)
    end
end
