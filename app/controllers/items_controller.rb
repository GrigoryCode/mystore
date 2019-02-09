class ItemsController < ApplicationController

    before_action :find_item, only:      [:show, :edit, :update, :destroy]
    before_action :check_if_admin, only: [:edit, :update, :new, :create, :destroy]

    # /items GET
    def index
      @items = Item.all
    end

    # /items/:id  GET
    def show
      # @item = Item.find(params[:id])
    end

    # /items/new GET
    def new
      @item = Item.new
    end

    # /items/:id/edit GET
    def edit
      # @item = Item.find(params[:id])
    end

    # /items POST
    def create
      @item = Item.new(item_params)
      if @item.save
        redirect_to @item
      else
        render 'new'
      end
    end

    # /items/:id PUT
    def update
      # @item = Item.find(params[:id])
      @item.update_attributes(item_params)
      if @item.save
        redirect_to @item
      else
        render 'edit'
      end
    end

    # /items/:id DELETE
    def destroy
      # @item = Item.find(params[:id])
      @item.destroy
      redirect_to @item
    end

    private

      def item_params
        params.require(:item).permit(:price, :name, :weight, :description)
      end

      def find_item
        @item = Item.find(params[:id])
      end

      #admin validation
      def check_if_admin
        # render plain: "Access denied" unless params[:admin]
      end

end
