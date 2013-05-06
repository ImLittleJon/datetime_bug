require 'spec_helper'

describe TestModel do
  it "is just as fast to retrieve datetime columns as to retrieve numbers and strings" do
    [10, 100, 1000, 2000].each do |model_count|
      (model_count - TestModel.count).times do
        now = Time.now
        TestModel.create!(num: now.to_i, str: "#{now.to_i}", dt: now)
      end
      num_execution_time = 0
      str_execution_time = 0
      dt_execution_time = 0
      TestModel.all.each do |test_model|
        start = Time.now
        test_model.num
        num_execution_time += (Time.now - start)
        
        start = Time.now
        test_model.str
        str_execution_time += (Time.now - start)
        
        start = Time.now
        test_model.dt
        dt_execution_time += (Time.now - start)
      end
      p "count: #{model_count}"
      p "num: #{num_execution_time}"
      p "str: #{str_execution_time}"
      p "dt: #{dt_execution_time}"
      p "---------------------------"
    end
  end
end
