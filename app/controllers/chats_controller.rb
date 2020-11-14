class ChatsController < ApplicationController
 before_action :set_chat, only:[:show, :edit, :update, :destroy]

   def index
      @chats=Chat.all
    end

    def show
    end

    def new
     @chat =Chat.new
    end

    def create
      @chat = Chat.new(chat_params)
      if @chat.save
          redirect_to chats_path, notice: "I have created a blog!"
        else
          render :new
        end
      end

   def update
      if @chat.update(chat_params)
        redirect_to chats_path, notice: "I edited the blog!"
      else
        render :edit
      end
    end
    private
    def set_chat
      @chat=Chat.find(params[:id])
    end
    def chat_params
      params.require(:chat).permit(:post)
    end
  end
