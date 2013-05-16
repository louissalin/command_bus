require 'active_support/inflector'

class CommandBus
    CommandBusConfig = Struct.new(:root)

    class << self
        def config
            c = CommandBusConfig.new
            yield c
            self.new c
        end
    end

    def root
        @config.root
    end

    def execute(cmd)
        load_handler(cmd)
    end

    private
    
    def initialize(config)
        @config = config
    end

    def load_handler(cmd)
        require_handler(cmd)

        handler_name = "#{cmd.to_s}_command_handler"
        handler_class = handler_name.camelize.constantize

        handler_class.new.execute
    end

    def require_handler(cmd)
        path = "./#{@config.root}/#{cmd}_command_handler"
        require path
    end
end

