class UrlController < ApplicationController
    # Shows all URLs
    def index
        @urls = Url.all
    end

    # Initiates an object for new URL
    def new
        @url = Url.new
    end

    # Creates a new URL
    def create
        @url = Url.new(url_params)
        if @url.save
            redirect_to root_path
        else
            render :index
        end
    end

    # Displays visitor details
    def visit
        @url = Url.find_by(shortened: params[:token])
        @visits = @url.visits
    end

    # Redirects to original URL if correct short URL
    def show
        @url = Url.find_by(shortened: params[:token])
        if @url
            @url.visits.build(ip: request.remote_ip).save
            redirect_to @url.original, allow_other_host: true
        end
    end

    private
    def url_params
        params.require(:url).permit(:original)
    end
end
