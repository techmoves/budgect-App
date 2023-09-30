class TransfersController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @transfers = @category.transfers
    @categories = current_user.categories.all
  end

  def new
    @category = Category.find(params[:category_id])
    @transfer = @category.transfers.new
  end

  def create
    @category = Category.find(params[:category_id])
    @transfer = @category.transfers.new(transfer_params)
    @transfer.author = current_user

    if @transfer.save
      @category.transfers << @transfer
      redirect_to category_transfers_path(@category), notice: 'Transfer was successfully created.'
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
