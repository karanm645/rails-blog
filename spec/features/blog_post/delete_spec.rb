require 'rails_helper'

RSpec.describe "Delete Blog Post" do 
  describe 'when the user goes to edit page' do
    before do
      @user = User.create!(email: 'test@example.com', password: 'password')
    end
    it 'has a delete button for article' do       
      my_blog_post = BlogPost.create!(title: "3rd blog post", body: "this is an old body")
      visit "/blog_posts/#{my_blog_post.id}/edit"
      expect(page).to have_content("Delete")
      click_button "Delete"
      
      visit root_path

      expect(page).to_not have_content("3rd blog post")
    end 
  end 
end 