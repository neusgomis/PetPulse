class MessagesController < ApplicationController

  def show
    @pet = Pet.find(params[:id])
    @message = Message.new
  end

  def create
    @pet = Pet.find(params[:pet_id])
    @message = Message.new(message_params)
    @message.pet = @pet
    @message.user = current_user
    if @message.save
      ChatpetChannel.broadcast_to(
        @pet,
        render_to_string(partial: "message", locals: {message: @message})
      )
      head :ok
    else
      render "pets/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
