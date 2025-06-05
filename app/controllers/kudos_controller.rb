class KudosController < ApplicationController
  def top
  end

  def index
    @kudos = Kudo.all
  end

  def new
    @kudo = Kudo.new
  end

  def create
    kudo = Kudo.new(kudo_params)
    if kudo.save!
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

 def show
    @kudo = Kudo.find(params[:id])
  end

   def edit
    @kudo = Kudo.find(params[:id])
  end

   def update
    kudo = Kudo.find(params[:id])
    if kudo.update(kudo_params)
      redirect_to :action => "show", :id => kudo.id
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    kudo = Kudo.find(params[:id])
    kudo.destroy
    redirect_to action: :index
  end

  private
  def kudo_params
    params.require(:kudo).permit(:image)
  end
end
