require 'rails_helper'

RSpec.describe BlogPost, type: :model do 
  describe "validations" do 
    it { should validate_presence_of(:title)}
    it { should validate_presence_of(:body)}
  end 

  describe "blog post mode" do 
    it "draft? returns true for draft blog post" do 
      post = BlogPost.new(published_at: nil).draft?

      expect(post).to be true
    end 

    it "draft? returns false for published post" do 
      post = BlogPost.new(published_at: 1.year.ago).draft?

      expect(post).to_not be true
    end 

    it "draft? returns false for scheduled post" do 
      post = BlogPost.new(published_at: 1.year.from_now).draft?

      expect(post).to_not be true
    end 

    it "published? returns false for draft post" do 
      post = BlogPost.new(published_at: nil).published?

      expect(post).to_not be true
    end 

    it "published? returns true for published post" do 
      post = BlogPost.new(published_at: 1.year.ago).published?

      expect(post).to be true
    end 

    it "published? returns false for scheduled post" do 
      post = BlogPost.new(published_at: 1.year.from_now).published?

      expect(post).to_not be true
    end 

    it "scheduled? returns false for draft post" do 
      post = BlogPost.new(published_at: nil).scheduled?

      expect(post).to_not be true
    end 

    it "scheduled? returns false for published post" do 
      post = BlogPost.new(published_at: 1.year.ago).scheduled?

      expect(post).to_not be true
    end 

    it "scheduled? returns true for scheduled post" do 
      post = BlogPost.new(published_at: 1.year.from_now).scheduled?
      
      expect(post).to be true
    end 
  end 
end 