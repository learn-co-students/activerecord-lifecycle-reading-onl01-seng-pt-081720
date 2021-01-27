class Post < ActiveRecord::Base

  belongs_to :author
  validate :is_title_case   #makes sure every word starts with a capital letter

  before_validation :make_title_case   #want to use this if making change to an attribute of model

  before_save :email_author_about_post  #want to use NOT making change to model

  private

  def is_title_case
    if title.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Title must be in title case")
    end
  end

  def email_author_about_post
    #can find info on https://guides.rubyonrails.org/action_mailer_basics.html
  end
  
  def make_title_case   #method to make sure validation passes before saving
    self.title = self.title.titlecase
  end
end

#before_create - similar to before_save only it gets called when object is created 1st time 