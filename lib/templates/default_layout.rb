_buf = '';  _buf << %Q`<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>#{@title}</title>\n`
    if @description
 _buf << %Q`    <meta name="description" content="#{@description}">\n`
    end
    if @keywords
 _buf << %Q`    <meta name="keywords" content="#{@keywords}">\n`
    end
    if @favicon
 _buf << %Q`    <link rel="shortcun icon" href="#{@favicon}">\n`
    end
 _buf << %Q`\n`
    @stylesheets.each do |sheet|
 _buf << %Q`    <link rel="stylesheet" type="text/css" href="#{sheet}">\n`
    end
 _buf << %Q`\n`
    @javascripts.each do |script|
 _buf << %Q`    <script src="#{script}" ></script>\n`
    end
 _buf << %Q`    #{ @head }
  </head>

<body>
#{ @body }
</body>
</html>\n`
_buf.to_s
