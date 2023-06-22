require 'rails_helper'

RSpec.describe "Blog Post Show page" do 
  describe 'when the user clicks on the title' do 
    it 'user can see blog post by id' do 
      my_blog_post = BlogPost.create!(title: "hello world", body: "this is the body of the blog post")
      
      visit root_path

      click_link my_blog_post.title

      visit "/blog_posts/#{my_blog_post.id}"

      expect(page).to have_content(my_blog_post.title)
      expect(page).to have_content(my_blog_post.body)
    end 
  end 
end 