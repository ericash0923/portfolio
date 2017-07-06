class CredentialsController < ApplicationController
 def index
  @portfolio_items = Credential.all
 end

end
