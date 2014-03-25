require 'spec_helper'

describe "User pages" do
  subject { page }

  describe "signup page" do
  	before { visit signup_path }

  	it { should have_content('Sign up') }
  	it { should have_title(full_title('Sign up'))}
  	#remember we defined full_titie in spec/support/utilties.rb
  	#makes this method available in spec files via rails magic
  end
end
