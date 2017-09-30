class PageController < ApplicationController

  def home
    @main_page_items = Pattern.all.order("created_at DESC")
  end

  def about
  end

  def faq
  end

  def contact
  end
end
