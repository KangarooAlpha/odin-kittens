class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
    respond_to do |format|
        format.html
        format.json { render json: @kittens }
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
    respond_to do |format|
        format.html
        format.json { render json: @kitten }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      redirect_to root_path
    else
      flash.now[:alert] = @kitten.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update(kitten_params)
      redirect_to root_path, notice: "The kitten was sucessfully edited"
    else
      flash.now[:alert] = @kitten.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    if @kitten.destroy
      redirect_to root_path, notice: "The kitten was deleted"
    else
      flash.now[:alert] = @kitten.errors.full_messages.to_sentence
      redirect_to root_path
    end
  end

  private
  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
