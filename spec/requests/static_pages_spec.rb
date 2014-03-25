require 'spec_helper'

describe "Static pages" do

  #note all files in spec/support directory are made avaialble here
  #which means that we can write the home tests using the 
  #full_title method
  subject { page }	
  #by defining the subject as page at the top of all tests, that means
  #all tests will be assessing the view assciated with the route path

  describe "Home page" do
    before { visit root_path }
    #define the route path before all tests for this page

    it { should have_content('Sample App') }
    it { should have_title(full_title(''))} 
    it { should_not have_title('| Home')}

  end

  describe "Help page" do
    before { visit help_path }

    it { should have_content('help') }
    it { should have_title(full_title('Help')) }

  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('About us')}
    it { should have_title(full_title('About us')) }

  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_content('Contact')}
    it { should have_title(full_title('Contact')) }
    
  end
end