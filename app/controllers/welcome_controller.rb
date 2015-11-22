class WelcomeController < ApplicationController
  def search
    @token = ENV['BF_API_KEY'] || params[:bf_api_key]
    @slug = params[:bf_url].split('/').last.strip if params[:bf_url].present?
    @queries = params[:bf_query].split(/\r?\n/).uniq.reject(&:empty?)
    @fuzzy_match = params[:bf_match] != 'exact'
    if @token.present? && @slug.present? && @queries.present?
      redirect_url = get_external_share_url
      if redirect_url.present?
        redirect_to "#{redirect_url}#!select_all"
      else
        flash.now[:warning] = 'No assets matched queries.'
        render 'index'
      end
    else
      flash.now[:danger] = 'Please fill out all of the fields.'
      render 'index'
    end
  end

  private

  def get_external_share_url
    param_data = { 'brandfolder_slug': @slug, 'token': @token, 'fuzzy_match': @fuzzy_match, 'queries[]': @queries }
    response = Net::HTTP.post_form(URI.parse('https://brandfolder.com/api/search'), param_data)
    json_response = JSON.parse(response.body)
    json_response['url']
    rescue
      ''
  end
end
