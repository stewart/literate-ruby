require 'thread'


module Actors


  class Actor


    def self.run
      Thread.new do
        begin
          loop do
            instance_eval(&@block)
          end
        rescue Exception => e
          puts e
        end
      end
    end


    def self.add_block(block)
      @block = block
    end


    def self.queue
      @queue ||= Queue.new
    end

    def self.push(value)
      queue << value
    end

    def self.pop
      queue.pop
    end

  end


  def self.actor(name, &block)
    klass = Class.new Actor
    klass.add_block(block)
    const_set name, klass
  end


  def self.run(actors)
    threads = actors.map(&:run)
    threads.each(&:join)
  end


end


module Actors
  actor :Input do
    Output.push gets
  end

  actor :Output do
    puts pop
  end
end

Actors.run [Actors::Input, Actors::Output]