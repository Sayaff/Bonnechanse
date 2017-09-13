class PageController < ApplicationController

  def home
    @main_page_items = Pattern.all.order("created_at DESC")
  end

  def global_search
    @search = Sunspot.search [Pattern,Strand] do
      fulltext params[:search]
    end
    @results = @search.results
    render layout: false
  end

  def about
  end

  def faq
  end

  def contact
  end
end
