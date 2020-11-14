class ChatsController < ApplicationController
 before_action :set_chat, only:[:show, :edit, :update, :destroy]

   def index
      @chats=Chat.all
    end

    def show
      Chat.find(params[:id])
      redirect_to new_chat_path
    end

    def new
     @chat =Chat.new
    end

    def create
      @chat= Chat.new(chat_params)
      if @chat.save
        redirect_to chat_path, notice: "I have created a blog!"
      else
        render :new
      end
    end

    end
    private
    def set_chat
      @blog=Chat.find(params[:id])
    end
    def chat_params
      params.require(:chat).permit(:post)
    end
  
