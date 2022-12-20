class Users::SessionsController < Devise::SessionsController
  respond_to :json

  def create
    self.resource = warden.authenticate!(auth_options)
    session[:user_id] = resource.id

    render json: { user: resource, auth_token: current_token }, status: :ok
  end

  protected

  def respond_with(resource, _opts = {})
    render json: { message: 'Logged.'}, status: :ok
  end

  def respond_to_on_destroy
    current_user ? log_out_success : log_out_failure
  end
  def log_out_success
    render json: { message: "Logged out." }, status: :ok
  end
  def log_out_failure
    render json: { message: "Logged out failure."}, status: :unauthorized
  end
  def current_token
    request.env['warden-jwt_auth.token']
  end
end
