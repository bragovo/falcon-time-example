# frozen_string_literal: true

require "time"

class App
  def call(env)
    1000.times do
      tm = Time.parse("2022-10-24 12:33:44.054237")
      # tm = DateTime.parse("2022-10-24 12:33:44.054237")
      puts "tm: #{tm.year}"
    end
    [200, {}, ["App"]]
  end
end

run App.new
