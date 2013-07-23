require 'spec_helper'

describe "StaticPages" do

  subject { page }

  describe "Home page" do
    before {visit root_path} # {} = do end block

    it { should have_selector('h1', text: 'Twitter') }
    it { should have_selector('title', text: full_title('')) }
    it { should_not have_selector('title', text: ' | Home')}
  end

  describe "Help page" do
    before {visit help_path}

    it { should have_selector('h1', text:'Help') }
    it { should have_selector('title', text: full_title('Help')) }
  end

  describe "About page" do
    before {visit about_path}

    it { should have_selector('h1', text: 'About us') }
    it { should have_selector('title', text: full_title('About us'))}
  end

  describe "Contact page" do
    before {visit contact_path}
    it {should have_selector('h1', text: 'Contact')}
    it { should have_selector('h1', text: 'Contact')}
  end
end