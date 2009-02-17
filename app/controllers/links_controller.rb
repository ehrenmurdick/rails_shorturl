class LinksController < ApplicationController
  before_filter :verify_request, :only => :create

  # GET /links/1.xml
  def show
    @link = Link.find_by_short(params[:id])

    respond_to do |format|
      format.xml  { render :xml => @link }
    end
  end

  # GET /:id
  def redirect
    @link = Link.find_by_key(params[:id])
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

  private
  def verify_request
    url = params[:url]
    signed = params[:signed]
    unless Digest::SHA2.hexdigest("#{url}--#{SECRET}") == signed
      render :nothing => true, :status => 403
      return false
    end
  end

end
