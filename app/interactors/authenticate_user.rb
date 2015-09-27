class AuthenticateUser
  include Interactor

  OPTIONS = { store: false }

  def call
    context.user = authenticated_user!
  end

  private

  def authenticated_user!
    context.warden.request.env["devise.skip_trackable"] = false
    context.warden.authenticate!(OPTIONS)
  end
end
