require 'rails_helper'

RSpec.describe "Edit Blog Post" do 
  describe 'when the user goes to edit page' do
    it 'takes user to form to edit blog post' do       
      my_blog_post = BlogPost.create!(title: "3rd blog post", body: "this is an old body")
      #visit root_path
      #visit "/blog_posts/#{my_blog_post.id}"
      #expect(page).to have_button("Create Blog post")
      #click_button "Create Blog post"
      visit "/blog_posts/#{my_blog_post.id}/edit"

      expect(page).to have_content("Update Blog post")
      
      fill_in "Title", with: '4th blog post'
      fill_in "Body", with: 'this is a new body'

      click_button 'Update Blog post'
      
      visit "/blog_posts/#{my_blog_post.id}"

      expect(page).to have_content("4th blog post")
    end 
  end 
end 