class Answer < ActiveRecord::Base
  belongs_to :question
  validates :title, :content, :answerer, {:presence => true}
end
