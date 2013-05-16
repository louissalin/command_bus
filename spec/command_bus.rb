require 'spec_helper'
require './lib/command_bus'

describe CommandBus do
    let (:path) {'this/path'}

    before do
        @sut = CommandBus.config do |config|
            config.root = path
        end
    end

    describe 'configuration' do
        it 'should allow for root path configuration' do
            @sut.root.should == path
        end
    end

    describe 'executing' do
        it 'should look for a handler in a command_handlers dir' do
            executed = false
            class ::CreateMoneyCommandHandler
                def execute
                    executed = true
                end
            end

            @sut.should_receive(:require)
                .with("./#{path}/create_money_command_handler")
                .and_return(true)


            @sut.execute(:create_money)
            executed.should == true
        end
    end
end
