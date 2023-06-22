require 'rails_helper'

RSpec.describe "Create Blog Post" do 
  describe 'when the user clicks create' do
    it 'takes user to form to create new blog post' do       
      #visit root_path
      
      #click_link "create"
      visit "/blog_posts/new"


      expect(page).to have_button("Create Blog post")
      expect(page).to have_content("New Blog Post")

      fill_in "Title", with: 'my new blog post'
      fill_in "Body", with: 'this is a new body'

      click_button 'Create Blog post'

      expect(page).to have_content("my new blog post")
    end 
  end 
end 