require 'pry'
require_relative 'article'
class Magazine
  attr_accessor :name, :category

  @@all = []


  def initialize(name, category)
    @name = name
    @category = category
    @@all << self
  end

  def self.all
    @@all
  end

  
  def contributors
    Article.all.select do |magazine|
      magazine.magazine == self
    end.map do |mag|
      mag.author
    end
  end

  def self.find_by_name(name)
    self.all.find do |magazine|
      magazine.name == name
    end
  end

  def article_titles
    Article.all.select do |magazine|
      magazine.magazine == self
    end.map do |article|
      article.title
    end
  end

  def contributing_authors
    Article.all.select do |magazine|
      magazine.magazine == self
    end.map do |author|
      author.author
    end.uniq.map do |article|
      article.articles.count > 2
    end
  end


end




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