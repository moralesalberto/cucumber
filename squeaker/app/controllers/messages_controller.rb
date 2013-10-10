class MessagesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @message = @user.messages.new
  end

  def create
    @user = User.find(params[:user_id])
    @message = @user.messages.new(message_params)
    if @message.save
      redirect_to message_path(@message)
    else
      render :new
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end
end
