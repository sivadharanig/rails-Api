class ContactsController < ApplicationController
    def index
        @contacts=Contact.all
        render json: @contacts, status: :ok
    end

    def show
        @contact=Contact.find(params[:id])
        render json: @contact, status: :ok
    end

    def create
       @contact=Contact.new(room_params)
       @contact.save
       render json: @contact, status: :created
    end
    def update
        @contact=Contact.find(params[:id])
        @contact.update(room_params)
        render json: @contact, status: :created
    end
    def destroy
        
        @contact=Contact.find(params[:id])
        if @contact.destroy
            head(:ok)
        else
            head(:unprocessable_entery)
        end
    end
    private
    def contact_1
        @contact = Contact.find(params[:id])
    end
    def room_params
        params.require(:contact).permit(:name, :mail)
    end
end
