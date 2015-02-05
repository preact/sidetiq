require_relative 'helper'

class TestConfig < Sidetiq::TestCase
  def setup
    @saved = Sidetiq.config
    Sidetiq.config = OpenStruct.new
  end

  def teardown
    Sidetiq.config = @saved
  end

  def test_configure
    Sidetiq.configure do |config|
      config.test = 42
    end

    assert_equal 42, Sidetiq.config.test
  end

  def test_enabled
    Sidetiq.configure do |config|
      config.enabled = true
    end
    assert Sidetiq.enabled?
  end

  def test_disabled
    Sidetiq.configure do |config|
      config.enabled = false
    end
    assert !Sidetiq.enabled?
  end
end

