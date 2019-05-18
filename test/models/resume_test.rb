# frozen_string_literal: true

require 'test_helper'

class ResumeTest < ActiveSupport::TestCase
  def setup
    @resume = Resume.new
  end

  test 'resume with name should be valid' do
    @resume.name = 'test'
    assert @resume.valid?
  end

  test 'resume without name should not be valid' do
    refute @resume.valid?
  end
end
