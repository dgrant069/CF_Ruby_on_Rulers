require "rulers/version"
require "rulers/array"
require "rulers/routing"

module Rulers
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {'Content-Type' => 'test/html'}, []]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)

      begin
        text = controller.send(act)
      rescue Exception => e
        text = "Can't display a quote"
      end
      `echo debug > debug.txt`; # This doesn't append, it overwrites with "debug", need to update with ... #{debug} >>...
        [200, {'Content-Type' => 'text/html'}, [text]]
      }
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end
end
