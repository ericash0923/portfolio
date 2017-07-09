class CredentialsController < ApplicationController
 def index
  @portfolio_items = Credential.all
 end
 
 def new
  @portfolio_item = Credential.new
 end
 
 def edit
  @portfolio_item = Credential.find(params[:id])
 end
 
 def create
  @portfolio_item = Credential.new(params.require(:credential).permit(:title, :subtitle,
  :body))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to credentials_path, 
        notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
 end
 
   def update
    @portfolio_item = Credential.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(params.require(:credential).permit(:title, :subtitle,
  :body))
        format.html { redirect_to credentials_path, 
        notice: 'Protfolio item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
   end
   
   def show
    @portfolio_item = Credential.find(params[:id])
   end
   
   def destroy
    @portfolio_item = Credential.find(params[:id])
    @portfolio_item.destroy
     respond_to do |format|
       format.html { redirect_to credentials_url, 
       notice: 'Protfolio was successfully destroyed.' }
     end
   end

end
