class FinderController < ApplicationController
  
  def index
    @customers = Customer.order(:full_name)
    
    if session[:count].nil?
      session[:count] = 1
    else 
      session[:count] += 1
    end
    
    @count = session[:count]
  end
  
  def forget_me_bro
    session[:count] = nil
    redirect_to root_path
  end
  
  def missing_email
    @customers = Customer.where("email IS NULL OR email = ''")
  end
  
  def search
  end # Loads up the search.html.erb view file.
  
  def search_results
    @keyword = params[:keyword]
    
    @customers = Customer.where("full_name LIKE ?", "%#{@keyword}%")
  end
  
end
