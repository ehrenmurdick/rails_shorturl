class LinksController < ApplicationController
  # GET /links/1.xml
  def show
    @link = Link.find_by_short(params[:id])

    respond_to do |format|
      format.xml  { render :xml => @link }
    end
  end

  def redirect
    if params[:id].blank?
      redirect_to new_link_path
    elsif @link = Link.find_by_short(params[:id])
      redirect_to @link.long
    else
      render :text => '404 Not found.', :status => 404 
    end
  end
    
  # POST /links.xml
  def create
    @link = Link.new(params[:link])

    respond_to do |format|
      if @link.save
        flash[:notice] = 'Link was successfully created.'
        format.xml  { render :xml => @link, :status => :created, :location => @link }
      else
        format.xml  { render :xml => @link.errors, :status => :unprocessable_entity }
      end
    end
  end

end
