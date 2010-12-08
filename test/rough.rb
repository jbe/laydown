require './lib/laydown'


Layout = Laydown.layout do
  title 'A man in a cave'
  description 'A man is sitting in a cave. What will he do?'
  keywords 'man, cave, mystery'
  favicon 'maninacave.png'
  css '/maninacave/style.css'
  css @css
  js '/maninacave/site.js'
  js @js

  body "<h1>A man in\na cave</h1>"
end

@css = 'somesheet.css'

puts Layout.render(self)
