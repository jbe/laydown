
require 'laydown'


describe Laydown do

  subject do
    Laydown.new do |_|
      _.charset 'iso-piso'
      _.title 'Apple sucks'
      _.description 'Yes, it does. And so do their fans.'
      _.favicon 'applesuck.png'
      _.keywords 'apple suck lol'
      _.css 'applesuck.css'
      _.js 'applesuck.js'
      _.inline_js "alert('#{@msg}');"
      _.head '<meta generator="Ubuntu">'
      _.body @body
      _.ga_code 'GA-UGGABUGGA'
    end
  end

  it 'generates properly' do
    @msg = 'lol @ iPhone'
    @body = '<p>Seriously.</p>'
    str = subject.render(self)
    str.should == nil

    #str.match(/lang="en"/).should
    #str.match(/charset="iso-piso"/)
    #str.match(/GA-UGGABUGGA/)
  end

end


