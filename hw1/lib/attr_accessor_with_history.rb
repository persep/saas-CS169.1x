class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string

    #getter
    # def name
	#	  @name
	# end
	#setter
	# def name=(value)
    #   @name = value
	# end 

    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter

    @previous = nil # first value of history

    class_eval %Q{
    	# http://paul-wong-jr.blogspot.com.es/2012/04/ruby-metaprogramming-with-classeval.html
    	
    	def #{attr_name}=attr_value
  
    		# An attribute's initial value is always nil by default.
    		# The very first time the attribute receives a value, 
    		# its history array will have to be initialized.
    		# Instance variables are referred with @ within getters and setters

    		@#{attr_name+"_history"} = [] unless @#{attr_name+"_history"}
    		@#{attr_name+"_history"} << @previous
    		
    		@#{attr_name} = attr_value # setter update
    		
    		@previous = attr_value # update with new value
    	end
    }
  end
end

class Foo 
  attr_accessor_with_history :bar
end

f = Foo.new        
f.bar = 3          # => 3
f.bar = :wowzo     # => :wowzo
f.bar = 'boo!'     # => 'boo!'
print f.bar_history.inspect      # => [nil, 3, :wowzo]