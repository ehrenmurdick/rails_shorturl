class LinksController < ApplicationController
  # GET /links/1.xml
  def show
    @link = Link.find_by_short(params[:id])

    respond_to do |format|
      format.xml  { render :xml => @link }
    end
  end

  def redirect
    @link = Link.find_by_short(params[:id])
    if params[:id].blank? or @link.blank?
      render :text => '404 Not found.', :status => 404 
    else
      redirect_to @link.long
    end
  end
    
  # POST /links.xml
  def create
    @link = Link.find_or_create_by_long(params[:url])

    respond_to do |format|
      if @link.save
        format.xml  { render :xml => @link, :status => :created, :location => @link }
      else
        format.xml  { render :xml => @link.errors, :status => :unprocessable_entity }
      end
    end
  end

end
