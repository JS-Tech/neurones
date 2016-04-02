if @articles.any?
  atom_feed do |feed|
  	feed.title "Articles postés par: #{@articles.first.user.name}"
  	feed.updated @articles.maximum(:updated_at)

  	@articles.each do |article|
  		feed.entry(article, url: root_url + blog_path, plublished: article.created_at) do |entry|
  			entry.title article.title
  			entry.content article.content, type: 'html'
  			entry.author do |author|
  				author.name article.user.name
  			end
  		end
  	end
  end
end
