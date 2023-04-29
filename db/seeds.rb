# DON'T FORGET TO REQUIRE!
require 'faker'

# SET THE NUMBER TO GENERATE - WE RE-USE THIS - DRY
ARTICLE_COUNT = 15

# Single method to generate:
def generate_article_content

  # heredoc: https://blog.saeloun.com/2020/04/08/heredoc-in-ruby-and-rails#:~:text=What%20is%20heredoc%3F,method%20dynamic%20definitions%20and%20more.
  <<-ARTICLE
    #{Faker::Lorem.sentences(number: 4).join(' ')}

    ## #{Faker::Company.buzzword} #{Faker::Company.industry}

    #{Faker::Lorem.paragraphs(number: 3).join(' ')}

    #{Faker::Lorem.paragraphs(number: 3).join(' ')}

    **#{Faker::Lorem.word}** #{Faker::Lorem.paragraphs(number: 3).join(' ')}

    ## #{Faker::Company.catch_phrase}

    #{Faker::Lorem.paragraphs(number: 3).join(' ')} [link]

    #{Faker::Lorem.paragraphs(number: 3).join(' ')}

    #{Faker::Lorem.paragraphs(number: 3).join(' ')}

    #{Faker::Lorem.paragraphs(number: 3).join(' ')}
  ARTICLE
end

puts 'Adding articles...'

ARTICLE_COUNT.times do
  article = Article.new(
    title: Faker::Company.catch_phrase,
    content: generate_article_content
  )
  article.save
  puts "#{article.title} added"
end

puts "#{ARTICLE_COUNT} articles added"
puts "\"#{Article.first.title}\" ... \"#{Article.last.title}\""
