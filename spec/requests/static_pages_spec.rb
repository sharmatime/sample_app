require 'spec_helper'

describe "Static pages" do

  #note all files in spec/support directory are made avaialble here
  #which means that we can write the home tests using the 
  #full_title method
  
  subject { page }	
  #by defining the subject as page at the top of all tests, that means
  #all tests will be assessing the view assciated with the route path

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    #define the route path before all tests for this page

    let(:heading) { 'Sample App' }
    let(:page_title) { '' }
    
    it_should_behave_like "all static pages"
    it { should_not have_title('| Home')}

  end

  describe "Help page" do
    before { visit help_path }
    let(:heading) { 'Help' }
    let(:page_title) { 'Help' }

    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { visit about_path }
    let(:heading) { 'About us' }
    let(:page_title) { 'About us' }
    
    it_should_behave_like "all static pages"

  end

  describe "Contact page" do
    before { visit contact_path }
    let(:heading) { 'Contact' }
    let(:page_title) { 'Contact' }

    it_should_behave_like "all static pages"
    #the have_content test passes regardless of h1 content bc of footer
    #Therefore use the have_selector test which spcifies h1 content

  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About us'))
    click_link "Help"
    expect(page).to have_title(full_title('Help'))
    click_link "Contact"
    expect(page).to have_title(full_title('Contact'))
    click_link "Home"
    click_link "Sign up now!"
    expect(page).to have_title(full_title('Sign up'))
    click_link "sample app"
    expect(page).to have_title(full_title(''))
  end
end