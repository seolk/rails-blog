class PagesController < ApplicationController
  #CRUD

  #Read, views all the pages
  def index
    #SQL SELECT * FROM PAGES
    @pages = Page.all
    #render views
  end

  #read, views a single page
  def show
    @page = Page.find(params[:id])
    #render
  end

  #read, renders the form for a new page
  def new
    #creates a new page only in memory but not in database
    @page = Page.new
    #renders the form
  end

  #create, create new page
  def create
    #Page.create(Title: 'dsfh', body: 'dkhfrhrnd')
    @page = Page.new(pages_params)

    if @page.save
      redirect_to pages_path
    else 
      render :new
    end
  end

  #Read, renders the edit form
  def edit
    @page = Page.find(params[:id])
    #render the edit form
  end

  #update, updates a page
  def update
    #looking for a page a specific id
    @page = Page.find(params[:id])

    #updates with new info
    if @page.update(pages_params)
      redirect_to pages_path
    else
      render :edit
    end
  end

  #delete, delete a single page
  def destroy
    #find and delete a page
    Page.find(params[:id]).destroy

    #take us back to all pages
    redirect_to pages_path
  end

  private

    def pages_params
      params.require(:page).permit(:title, :body)
    end



end
