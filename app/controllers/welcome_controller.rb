class WelcomeController < ApplicationController
  def query
    @token = ENV['BF_API_KEY'] || params[:bf_api_key]
    @slug = params[:bf_url].split('/').last.strip if params[:bf_url].present?
    @queries = params[:bf_query].split(/\r?\n/).uniq.reject(&:empty?)
    @queries = "test this out"
    if @token.present? && @slug.present? && @queries.present?
      redirect_url = get_external_share_url
      if redirect_url.present?
        redirect_to redirect_url
      else
        flash.now[:warning] = 'No assets matched queries.'
        render 'index'
      end
    else
      flash.now[:danger] = 'Please fill out all the fields.'
      render 'index'
    end
  end

  private

  def get_external_share_url
    param_data = { 'brandfolder_slug': @slug, 'token': @token, 'query': @queries }
    response = Net::HTTP.post_form(URI.parse('https://brandfolder.coms/api/search'), param_data)
    json_response = JSON.parse(response.body)
    json_response['url'] if json_response['count'].to_i >= 0
  end
end
