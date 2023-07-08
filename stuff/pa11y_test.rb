require 'test_helper'
require 'execjs'

# frozen_string_literal: true

class BooksFlowTest < ActionDispatch::IntegrationTest
  setup do
    @key_point = key_points(:key_point_1)

    @user = users(:users_1)
    sign_in @user
  end

  test 'looking at root page' do
require 'commonjs'
runtime = MiniRacer::Context.new
env = CommonJS::Environment.new(runtime, :path => ['/home/codynivens/devel/holocene/my_modules'])
#mini_racer_context = context = MiniRacer::Context.new
#env = CommonJS::Environment.new(mini_racer_context, path: ['/home/codynivens/devel/holocene/node_modules/pa11y/lib',
#                                                   '/home/codynivens/devel/holocene/node_modules/node.extend'])
#env.require('debug.js')
#env.runtime.eval(%q|process.stdout.write('test')|)
env.runtime.eval(%q|var foo = this.require('patty.js')|)

    if 1 == 0
require 'stitch'
    #modules = Stitch::Package.new(paths: ['node_modules/pa11y/lib'], dependencies: ['node_modules/extend/index.js'])
    #modules = Stitch::Package.new(paths: ['node_modules/pa11y/lib', 'my_modules'])
    modules = Stitch::Package.new(paths: ['my_modules'])
    mods = modules.compile
    script = <<JS
    function test1() {
    const pa11y = this.require('patty');

pa11y('https://localhost:3000/').then((results) => {
    // Do something with the results
});
};
JS
    context = ExecJS.compile(mods << script)

    #debugger
p context.eval('test1()')
    end

    if 1 == 0
require 'open3'
puts"Enter the command for execution"
some_command='pa11y-ci -j -c ./pa11y.json'
stdout,stderr,status = Open3.capture3(some_command)
debugger
STDERR.puts stderr
if status.success?
  puts stdout
else
  STDERR.puts "ERRRR"
end
  end
end
end
