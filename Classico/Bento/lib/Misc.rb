
require 'rufus/mnemo'

module Bento

#----------------------------------------------------------------------------------------------

def Bento.rand_name
	Rufus::Mnemo.from_i(rand(16**5))
end

#----------------------------------------------------------------------------------------------

end # module Bento