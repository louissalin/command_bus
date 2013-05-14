class EventStore
    class << self
        def config
            c = EventStoreConfig.new
            yield c
            self.new c
        end
    end

    def root
        @config.root
    end

    private
    
    def initialize(config)
        @config = config
    end
end

EventStoreConfig = Struct.new(:root)
