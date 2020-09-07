class Api::V1::UsersController < Api::V1::BaseController
	
	def login
		email = params[:email]
		password = params[:password]

		user = User.where(:email=>email,:password=>password)
		render :json=>{user: user}
	end

	def create
		@user = User.new(user_params)
		if @user.save
			render json: {:success=>true, :message=>"Sign Up", :user=>@user}, :status=>201
		else
			render json: {:success=>false, :message=>@user.errors}, :status=>400
		end
	end

	def update
		if @user.update(user_params)
			render json: {:success=>true, :message=>"Updated Successfully", :user=>@user}, :status=>200
		else
			render json: {:success=>false, :message=>@user.errors, :user=>@user}, :status=>400
		end
	end 

	def edit
		render json: {:success=>true, :message=>"Set user", :user=>@user}, :status=>200
	end

	def signin
		@user = User.where(user_params)
		if @user.empty?
			render json: {:success=>false, :message=>"Invalid Email or Password", :user=>@user}, :status=>401
		else
			render json: {:success=>true, :message=>"Login", :user=>@user.first}, :status=>200
		end
	end

	private
		def set_user
      @user = User.find_by_id(params[:id])
      if !@user
      	render json: {:success=>false, :message=>"User not found", :user=>@user}, :status=>400
      end
    end

	  def user_params
	    params.permit(:username,:email,:phone,:password)
	  end

	
end