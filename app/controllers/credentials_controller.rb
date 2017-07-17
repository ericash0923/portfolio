class CredentialsController < ApplicationController
layout 'credential'

 def index
  @portfolio_items = Credential.all
 end
 
 def angular
  @augular_portfolio_item = Credential.angular
 end
 
 def new
  @portfolio_item = Credential.new
  3.times { @portfolio_item.technologies.build }
 end
 
 def edit
  @portfolio_item = Credential.find(params[:id])
  3.times { @portfolio_item.technologies.build }
 end
 
 def create
  @portfolio_item = Credential.new(portfolio_parms)
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
      if @portfolio_item.update(portfolio_parms)
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
   
   private
   
   def portfolio_parms 
    params.require(:credential).permit(:title, 
                                       :subtitle, 
                                       :body,
                                       technologies_attributes: [:name]
                                       )
   end

end
