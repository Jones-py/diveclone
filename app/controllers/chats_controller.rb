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
      if params[:back]
         render :new
      else

        if @chat.save
          redirect_to chats_path, notice: "New Post!"
        else
          render :new
        end
      end
    end
     def confirm
        @chat=Chat.new(chat_params)
        render :new if @chat.invalid?
     end

    def update
      if @chat.update(chat_params)
        redirect_to chats_path, notice: "I edited the post!"
      else
        render :edit
      end
    end
    def destroy
      @chat.destroy
      redirect_to chats_path, notice:"I deleted the post!"
    end

    private
    def set_chat
      @chat=Chat.find(params[:id])
    end
    def chat_params
      params.require(:chat).permit(:post)
    end
  end
