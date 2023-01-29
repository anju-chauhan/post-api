class StudentsController < ApplicationController
	def index

		# debugger
        # students = Student.where('subject = ?', params[:subject]) #one way
        # students = Student.where(subject: params[:subject])

        if params[:subject] == Student::MATH
        	return render json: {
        		message: "Yes we are math students",
        		list: Student.math_students,
        		success: true
        	}, status: :ok

        elsif params[:subject] == Student::SCIENCE
        	render json: {
        		message: "Yes we are science students",
        		list: Student.science_students,
        		success: true
        	}, status: :ok

        else
        	render json: {
        		message: "all student",
        		list: Student.all,
        		success: true,

        	}, status: :ok
        end
    end

    def destroy 
    	get_student = Student.find_by(id: params[:id], subject: params[:subject])
    	if get_student.present?
    		get_student.destroy
    		render json: {
        		message: "delete sucess",
        		success: true
        	}, status: :ok
        else
        	render json: {
        		message:"unsucessfull",
        		success: false,
        	},status: :not_found
        end

    end

    def update
    	get_update = Student.find_by(id: params[:id])
    	# User.find_by(5).update(subject="os")

    	if get_update.present?
    		get_update.update(subject: params[:subject], classs: params[:classs])
    		render json: {
    			message: "updated success",
    			success: true
    		},status: :ok
    	else
    		render json: {
    			message:"not updated",
    			success: false
    		}, status: :not_found
    	end

    end

    
   
  

end







      