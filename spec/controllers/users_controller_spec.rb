require 'spec_helper'

describe UsersController do 

  it 'redirects user to homepage' do
    get 'static_pages#home'
    response.status.should be(200)
  end

  context 'when logged out' do
    it { should respond_with 401 }
  end

end
