# frozen_string_literal: true

class App
  def call(env)
    1000.times do
      Time.parse("2022-10-24 12:33:44.054237")
      # DateTime.parse("2022-10-24 12:33:44.054237")
    end
    [200, {}, ["App"]]
  end
end

run App.new
