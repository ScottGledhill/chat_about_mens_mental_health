class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = current_user.chat_rooms.build(chat_room_params)
    if @chat_room.save
      redirect_to chat_rooms_path
    else
      render 'new'
    end
  end

  def show
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
    @message = Message.new
  end

   private

  def chat_room_params
    params.require(:chat_room).permit(:title)
  end
end

#add useful links
#be able to post by pressing enter, remove post button
#add list of chat rooms add to seed, and delete add room button
#host to heroku
