class Helpers

  def current_user(session_hash)
    user = User.find_by(id: session_hash[:user_id])
    user
  end

  def is_logged_in?(session_hash)
    !!current_user(session_hash)
  end

end
