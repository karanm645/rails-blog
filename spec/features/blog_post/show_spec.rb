require 'rails_helper'

RSpec.describe "Blog Post Index" do 
  describe 'index' do 
    it 'user can see all blog posts' do 
      my_blog_post = BlogPost.create!(title: "hello world", body: "this is the body of the blog post")
      
      visit "/blog_posts/#{my_blog_post.id}"

      expect(page).to have_content(my_blog_post.title)
      expect(page).to have_content(my_blog_post.body)
    end 
  end 
end 