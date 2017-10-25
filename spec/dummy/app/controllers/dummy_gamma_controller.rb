class DummyGammaController < ApplicationController
  permit "noone"

  def index
  end

protected
  def current_user
    User.new
  end

  def handle_require_user_redirection_for_html
    head :ok
  end

  def handle_permission_denied_redirection_for_html
    head :ok
  end

  def handle_require_user_redirection_for_xml
    head :ok
  end

  def handle_permission_denied_redirection_for_xml
    head :ok
  end

  def handle_require_user_redirection_for_json
    head :ok
  end

  def handle_permission_denied_redirection_for_json
    head :ok
  end

  def handle_require_user_redirection_for_js
    head :ok
  end

  def handle_permission_denied_redirection_for_js
    head :ok
  end
end
