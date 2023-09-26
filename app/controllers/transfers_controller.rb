class TransfersController < ApplicationController
    # before_action :authenticate_user!
  def index
    # @category = Category.find(params[:category_id])
    # @transfers = @category.transfers
    @categories = current_user.categories.all
  end

  def new
    @transfer = Transfer.new
    @group = Category.new
    @categories = current_user.categories.all
  end


  def create
    @transfer = Transfer.new(name: transfer_params[:name], amount: transfer_params[:amount], user_id: current_user.id)
    if @transfer.save
      @categories_transfers = Categoriestransfer.new(category_id: params[:category_id], transfer_id: @transfer.id)
      if @categories_transfers.save
        redirect_to category_transfers_path, notice: 'transfer was successfully created.'
      else
        render :new
      end
    else
      render :new
    end
  end

  
  def destroy
    @category = Category.find(params[:category_id])
    @transfer = @category.entities.find(params[:id])
    @transfer.destroy
    redirect_to category_transfers_path(@category)
  end

    private

  def transfer_params
    params.require(:transfer).permit(:name, :amount)
  end

end
