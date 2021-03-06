###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

config[:css_dir] = 'styles'
config[:js_dir] = 'javascript'

###
# Helpers
###

activate :asset_hash

#Set timezone
require 'tzinfo'
Time.zone = 'Africa/Johannesburg'

#Sitemap

set :url_root, 'http://philipjoubert.com'

activate :search_engine_sitemap

#Clean URLs
activate :directory_indexes
page '/404.html', :directory_index => false

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  # blog.prefix = "blog"

  blog.permalink = "{title}"
  # Matcher for blog source files
  blog.sources = "articles/{title}.html"
  # blog.taglink = "tags/{tag}.html"
  blog.layout = "blog-post"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  blog.default_extension = ".md.erb"

  blog.tag_template = "tag.html"

  blog.new_article_template = File.expand_path('../source/template.yml', __FILE__)

  # Enable pagination
  blog.paginate = false
  # blog.per_page = 10
  # blog.page_link = "page/{num}"
end

page "/feed.xml", layout: false

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  activate :minify_html

  activate :gzip

end
