require "rulers/version"
require "rulers/array"
require "rulers/routing"
require "rulers/dependencies"
require "rulers/util"
require "rulers/controller"
require "rulers/file_model"


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
        text = "Can't display a quote. Here's officially why: #{e}"
        #e.backtrace
      end
      if controller.get_response
        st, hd, rs = controller.get_response.to_a
        [st, hd, [rs.body].flatten]
        #puts [st, hd, [rs.body].flatten]
      else
        [200, {'Content-Type' => 'text/html'}, [text]]
      end

      #{}`echo debug > debug.txt`; # This doesn't append, it overwrites with "debug", need to update with ... #{debug} >>...
    end
  end
end
