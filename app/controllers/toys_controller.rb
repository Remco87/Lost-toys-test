class ToysController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  def index
    @toys = Toy.find_with_search(params[:zipcode], params[:status])
    respond_to do |format|
      format.html
      format.js
      format.xml {render :xml => @toys}
      format.rss
    end
  end

  def show
    @toy = Toy.find(params[:id])
    respond_to do |format|
      format.html
      format.xml {render :xml => @toy}
    end
  end

  def new
    @toy = current_user.toys.build
    
    respond_to do |format|
      format.html {
        case params[:type]
            when "LOST" then render :file => 'toys/lost',
                                :use_full_path => true,
                                :layout => true
            when "FOUND" then render :file => 'toys/found',
                                :use_full_path => true,
                                :layout => true
        end
      }
      format.xml { render :xml => @toy  }
    end
  end
  
  def create
    @toy = current_user.toys.build(params[:toy])
    respond_to do |format|
      if @toy.save
        format.html { redirect_to(@toy) }
        format.xml { render :xml => @toy, :status => :created, :location => @toy }
      else
        format.html {
          case params[:toy][:status]
            when "LOST" then render :file => 'toys/lost',
                              :use_full_path => true,
                              :layout => true
            when "FOUND" then render :file => 'toys/found',
                              :use_full_path => true,
                              :layout => true
          end
        }
        format.xml { render :xml => @toy.errors, :status => :unprocessable_entity }
      end
    end
  end  

  def edit
    @toy = current_user.toys.find(params[:id])
  end
  
  def update
    @toy = current_user.toys.find(params[:id])
    respond_to do |format|
      if(@toy.update_attributes(params[:toy]))
        format.html {redirect_to(@toy)}
        format.xml {head :ok}
      else
        format.html { render :action => "edit" }
        format.xml {render :xml => @toy.errors, :status => :unprocessable_entity}
      end
    end
  end
  
  
  def destroy
    @toy = current_user.toys.find(params[:id])
    @toy.destroy
    respond_to do |format|
      format.html {  redirect_to(toys_url) }
      format.xml { head :ok}
    end
  end

end
