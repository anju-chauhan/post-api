class PostsController < ApplicationController

	def index
		@post = Student.all
		render json: @post
	end

	def create
		@post = Student.create(name: params[:name], subject: params[:subject], 
			roll_no: params[:roll_no], section: params[:section], classs: params[:classs])

		render json: @post
	end

	def show
		        @post = Student.find(params[:id])
        render json: @post
    end

    def update
        @post = Student.find(params[:id])
        @post.update(name: params[:name], subject: params[:subject], 
			roll_no: params[:roll_no] )
        render json: @post
    end

    def destroy
    	@post = Student.find_by(id: params[:id])
    	@post.destroy
    	render json: @post
    end


end


