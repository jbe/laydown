Laydown::TEMPLATE = <<'TEMPLATE'
_buf = [] ; _temple_pre_tags = /<pre|<textarea/ ; _buf << ("<!DOCTYPE html><html><head>") ; 
 ; 
 ; 
 ; if data[:title] ; 
 ; _buf << ("<title>#{data[:title]}"\
""\
"</title>") ; end ; if data[:favicon] ; 
 ; _buf << ("<link rel=\"shortcut icon\" url=\"#{Temple::Utils.escape_html((data[:favicon]))}\">"\
""\
"") ; end ; if data[:description] ; 
 ; _buf << ("<meta content=\"#{Temple::Utils.escape_html((data[:description]))}\" name=\"description\">"\
""\
"") ; end ; if data[:keywords].any? ; 
 ; _buf << ("<meta content=\"#{Temple::Utils.escape_html((data[:keywords].flatten.join(', ')))}\" name=\"keywords\">"\
""\
"") ; end ; data[:css].flatten.each do |url| ; 
 ; unless url == '' ; 
 ; _buf << ("<link href=\"#{Temple::Utils.escape_html((url))}\" rel=\"stylesheet\" type=\"text/css\">"\
""\
"") ; end ; end ; data[:js].flatten.each do |url| ; 
 ; unless url == '' ; 
 ; _buf << ("<script src=\"#{Temple::Utils.escape_html((url))}\" type=\"text/javascript\"></script>"\
""\
"") ; end ; end ; if data[:inline_js] && !data[:inline_js].empty? ; 
 ; _buf << ("<script type=\"text/javascript\">") ; 
 ; data[:inline_js].flatten.each do |code| ; 
 ; unless code == '' ; 
 ; _buf << (code) ; 
 ; 
 ; end ; end ; _buf << ("</script>") ; end ; if data[:head] ; 
 ; data[:head].each do |item| ; 
 ; _buf << (item) ; 
 ; 
 ; end ; end ; _buf << ("</head><body class=\"#{Temple::Utils.escape_html((data[:body_class].flatten.join(' ')))}\">"\
"#{data[:body]}"\
""\
"") ; if data[:ga_code] ; 
 ; 
 ; _buf << ("<script type=\"text/javascript\">var _gaq = _gaq || [];\n_gaq.push(['_setAccount', '"\
"#{Temple::Utils.escape_html((data[:ga_code]))}']);\n_gaq.push(['_trackPageview']);\n(function() {\nvar ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;\nga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';\nvar s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);\n})();</script>"\
""\
""\
""\
""\
""\
""\
"") ; end ; _buf << ("</body></html>") ; _buf = _buf.join
TEMPLATE
