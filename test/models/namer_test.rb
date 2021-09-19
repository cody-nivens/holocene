# frozen_string_literal: true

require 'test_helper'

class NamerTest < ActiveSupport::TestCase
  test 'the random person' do
    1.upto(1000) do
      random_person = Namer.random_person
    end
  end
  test 'the random name' do
    ['White', 'Black', 'Asian', 'Latino', 'Latino Mixed', 'Am Indian'].each do |ethnicity|
      1.upto(1000) do
        random_person = Namer.random_name(ethnicity, 0)
        random_person = Namer.random_name(ethnicity, 1)
      end
    end
  end
end
