set :css_dir, 'css'
set :js_dir, 'js'

configure :build do
  activate :minify_css
  activate :minify_javascript
end
