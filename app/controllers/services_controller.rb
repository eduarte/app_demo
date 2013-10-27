class ServicesController < ApplicationController
  
  def index
    @services = Store.select(:id, :name, :address)
    render json: @services
  end

  def articles
  @articles = Article.find_by_sql("
      select a.id, a.description, a.name, a.price, a.total_in_shelf, a.total_in_vault, s.name as 'store_name'
      from articles a, stores s
      where a.store_id = s.id")
  render json: @articles
  render json: [@stores, :success => true, :total_elements => @stores.size]
  end

  def articles_store
  @articles = Article.find_by_sql("
      select a.id, a.description, a.name, a.price, a.total_in_shelf, a.total_in_vault, s.name as 'store_name'
      from articles a, stores s
      where a.store_id = s.id and s.id = #{params[:id]}")
  render json: @articles
  end
end
