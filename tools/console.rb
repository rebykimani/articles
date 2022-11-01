require_relative '../config/environment.rb'
#require 'pry'
def reload
  load 'config/environment.rb'
end


###  WRITE YOUR TEST CODE HERE ###
author_1 = Author.new("K. Rose")
author_2 = Author.new("N. Rovan")

magazine_1 = Magazine.new("Technology", "Open source projects")
magazine_2 = Magazine.new("Healthy Eating", "Nutrition and dietary")

article_1 = Article.new(author_1, magazine_1, "Importance of young techprenuers contribution to open source projects")
article_2 = Article.new(author_1, magazine_2, "Examples of existing open source projects")
article_3 = Article.new(author_2, magazine_1, "Importance of eating a balanced diet")
article_4 = Article.new(author_2, magazine_2, "Meal plan")

pp author_1.articles
pp author_2.articles











### DO NOT REMOVE THIS
binding.pry

0