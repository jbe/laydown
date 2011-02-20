
require 'laydown'


describe Laydown do

  subject do
    Laydown.new(
      charset:      'iso-pam-pa-la-la',
      title:        'Apple sucks #{@reason}',
      description:  'And so do their fans.',
      favicon:      'applesuck.png',
      keywords:     'apple suck lol #{@keywords}',

      css:          ['applesuck.css', '#{@css}'],
      js:           ['applesuck.js', '#{@js}'],
      inline_js:    'alert("#{@msg}");',

      head:         '<meta generator="Ubuntu">',
      body:         '#{yield}',
      ga_code:      'GA-UGGABUGGA'
      )
  end

  it 'generates properly' do
    @reason = 'just because'
    @msg = 'boo'
    str = subject.render(self) { 'This is the body.' }
    str.should == nil

    #str.match(/lang="en"/).should
    #str.match(/charset="iso-piso"/)
    #str.match(/GA-UGGABUGGA/)
  end

end


