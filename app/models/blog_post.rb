class BlogPost < ApplicationRecord
  has_rich_text :content

  validates_presence_of :title, 
                        :content
  
  scope :sorted, -> { order(arel_table[:published_at].desc.nulls_last).order(updated_at: :desc)} # if multiple ones have the save timestamp
  scope :draft, -> { where(published_at: nil)}
  scope :published, -> { where("published_at <= ?", Time.current)} # where published_at is in the past
  scope :scheduled, -> { where("published_at > ?", Time.current)} # # greater than current time, future post

  #are you in draft mode?

  def draft?
    published_at.nil?
    #it'll return nil if there is no date
  end 

  def published?
    published_at? && published_at <= Time.current 
    #if blank --> false, if there is a time --> true
  end 

  def scheduled?
    published_at? && published_at > Time.current
  end 

  #future --> comments we could use helper methods
end
