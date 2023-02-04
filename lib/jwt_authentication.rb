class JwtAuthentication
    def initialize(app)
      @app = app
    end
  
    def call(env)
      token = env['HTTP_AUTHORIZATION'].to_s.remove('Bearer ')
      return unauthorized unless token.present?
  
      decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')
      member_id = decoded_token.first['sub']
      member = Member.find_by(id: member_id)
  
      env['jwt.member'] = member
      @app.call(env)
    end
  
    private
  
    def unauthorized
        [401, { 'Content-Type' => 'text/plain' }, ['Unauthorized, You are not allowed to access this page']]
    end
  end
