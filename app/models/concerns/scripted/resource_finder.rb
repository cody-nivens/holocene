module Scripted
  module ResourceFinder
    # Get the scripted object.
    #
    # ==== Returns
    # * <tt>ActiveRecord::Model</tt> - Scripted instance object.
    def scripted
      @klass, param = scripted_class
      @klass.find(params[param.to_sym]) if @klass
    end
    private
    
    # Lookup scripted class.
    #
    # ==== Returns
    # * <tt>Response</tt> - Scripted class or nil if not found.
    def scripted_class
      params.each do |name|
        if name =~ /(.+)_id$/
          model = name.match(%r{([^\/.])_id$})
          return model[1].classify.constantize, name
        end
      end
      nil
    end
  end
end
