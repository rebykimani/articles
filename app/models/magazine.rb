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




author_1 = Author.new("K. Jane")
author_2 = Author.new("M. Saida")

magazine_1 = Magazine.new("Health", "Lifestyle")
magazine_2 = Magazine.new("Farming Methods", "Agriculture")

article_1 = Article.new(author_1, magazine_1, "Organic Food")
article_2 = Article.new(author_1, magazine_2, "Hydroponics")
article_3 = Article.new(author_2, magazine_1, "Importance of Daily Exercise")
article_4 = Article.new(author_2, magazine_2, "Mushroom Farming")

pp author_1.articles
pp author_2.articles