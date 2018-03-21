class FakeSettings < ScopedSettings

  @klasses = {}

  def self.for_target(target)
    @klasses[target] ||= self.dup.instance_eval do
      def name; "FakeSettings"; end # Required by ActiveModel::Naming
      @target = target
      self
    end
  end

  #set a setting value by [] notation
  def self.[]=(var_name, value)
    value
  end

  def self.all_hash(starting_with=nil)
    selected_defaults = defaults.select{ |k, v| k =~ /^#{starting_with}/ }
    selected_defaults = Hash[selected_defaults] if selected_defaults.is_a?(Array)
    selected_defaults.with_indifferent_access
  end


  def self.target(var_name)
  end

  def self.destroy(var_name)
    true
  end
end
