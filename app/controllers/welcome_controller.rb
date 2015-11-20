class WelcomeController < ApplicationController
  def query
    token = ENV['BF_TOKEN'] || params[:bf_token]
    slug = ENV['BF_SLUG'] || (params[:slug].split('/').last.strip if params[:slug].present?)
    if token.present? && slug.present?
      queries = params[:query].split.uniq
      render json: { url: 'https://brandfolder.com/' }, status: :ok
    else
      render json: { message: 'Please fill out all fields.' }, status: 422
    end
  end
end
