require 'spec_helper'
require './lib/event_store'

describe EventStore do
    describe 'configuration' do
        it 'should allow for root path configuration' do
            path = 'this/path'

            es = EventStore.config do |config|
                config.root = path
            end

            es.root.should == path
        end
    end
end
