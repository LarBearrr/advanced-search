class WelcomeController < ApplicationController
  def query
    @token = ENV['BF_API_KEY'] || params[:bf_api_key]
    @slug = params[:bf_url].split('/').last.strip if params[:bf_url].present?
    @queries = params[:bf_query].split(/\r?\n/).uniq.reject(&:empty?)
    if @token.present? && @slug.present? && @queries.present?
      redirect_url = get_manifest_url
      if redirect_url.present?
        redirect_to 'https://brandfolder.com/agency'
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

  def get_manifest_url
    # uri = URI.parse("https://brandfolder.com/api/#{@slug}/qa/assets/advanced_search.json?token=#{@token}")
    # http = Net::HTTP.new(uri.host, uri.port)
    # http.use_ssl = true
    # http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    # request = Net::HTTP::Post.new('/v1.1/auth')
    # request.add_field('Content-Type', 'application/json')
    # request.body = {'queries' => @queries}
    # response = http.request(request)
    # 'https://brandfolder.com/agency'
    ''
  end
end
