class ServicesController < ApplicationController
  
  def index
  end

  def stores
    @stores = Store.select(:id, :name, :address)
    render json: custom_render(:stores, @stores)
  end

  def articles
   articles = Article.all_articles
   render json: custom_render(:articles, articles)
  end

  def articles_store
    store_id = params[:id]
    if store_id.to_s.match(/^\d+$/)
      articles_by_store = Article.articles_by_store(store_id)
      if  articles_by_store.empty?
        render json: {:error_msg => "Record not Found",:error_code => 404, :success => false}
      else
        render json: custom_render(:articles, articles_by_store)  
      end
    else
      render json: {:error_msg => "Bad Request",:error_code => 400, :success => false}
    end
  
  end

  def custom_render(element_name, element)
     {element_name => element, :success => true, :total_elements => element.send(:size)}
  end
end
