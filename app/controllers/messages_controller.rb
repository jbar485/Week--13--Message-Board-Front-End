class MessagesController < ApplicationController
  # before_action :set_message, only: [:show, :edit, :update, :destroy]

  def new
    @group = Group.find(params[:group_id])
    @message = @group.messages.new
  end

  def create
    @group = Group.find(params[:group_id])
    @message = @group.messages.new(message_params)
    if @message.save
      flash[:notice] = "Message successfully added!"
      redirect_to group_path(@group)
    else
      flash[:alert] = "Message Not successfully added!"
      render :new
    end
  end

  def show
    @group = Group.find(params[:group_id])
    @message = Message.find(params[:id])
  end

  def edit
    @group = Group.find(params[:group_id])
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      redirect_to group_path(@message.group)
    else
      render :edit
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to group_path(@message.group)
  end

  private
    def message_params
      params.require(:message).permit(:author, :content)
    end
end
