#######################################################################################################################
#
#   brief       
#               Dynamic Class Definition (TypeSafe Models)
#
#######################################################################################################################


#----------------------------------------------------------------------------------------------------------------------
def model(properties)

  typ = properties.fetch(:typ)
  min = properties.fetch(:min)
  max = properties.fetch(:max)
  des = properties.fetch(:des)

  Class.new do

    attr_reader :typ    # Class type of object
    attr_reader :rng    # Range of object
    attr_reader :des    # Description of object
    attr_reader :val    # Value of object

    define_method :initialize do |value|
      @typ = typ
      @rng = Range.new(min, max)

      # Ensure proper type and range
      fail TypeError, "#{value}, inavlid type" \
        unless value.is_a?(@typ)
      fail ArgumentError, "#{value}, invalid range" \
        unless @rng.include?(value)

      @des = des
      @val = value
    end

    def to_s
      "\n"\
      +"Model  #{self.class.name}\n"\
      +"Type:  #{@typ}\n"\
      +"Range: #{@rng}\n"\
      +"Desc:  #{@des}\n"\
      +"Value: #{@val}\n"\
      +"\n"
    end
  end
end


#----------------------------------------------------------------------------------------------------------------------
Foo = model({:typ=>Integer, :min=>0, :max=>10, :des=>"simple foo description"})
foo_obj = Foo.new(2)

Bar = model({:typ=>Float, :min=>0.0, :max=>1.0, :des=>"simple bar description"})
bar_obj = Bar.new(0.7)

puts foo_obj
puts bar_obj

