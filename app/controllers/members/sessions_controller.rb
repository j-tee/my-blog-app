class Members::SessionsController < Devise::SessionsController
  def create
    member = Member.find_by(email: sign_in_params[:email])
    if member&.valid_password?(sign_in_params[:password])
      secret = Rails.application.secrets.secret_key_base
      payload = { sub: member.id, exp: 24.hours.from_now.to_i }
      token = JWT.encode({ sub: member.id, exp: 24.hours.from_now.to_i }, Rails.application.secrets.secret_key_base)
      render json: { jwt: token }, status: :created
    else
      head :unauthorized
    end
  end

  private

  def sign_in_params
    params.require(:member).permit(:email, :password)
  end
end
