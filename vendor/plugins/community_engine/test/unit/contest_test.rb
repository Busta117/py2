require File.dirname(__FILE__) + '/../test_helper'

class ContestTest < ActiveSupport::TestCase
  fixtures :contests

  def test_transform_post
    cat = Contest.new(:begin_date => Time.now, :end_date => Time.now + 30.days, :title => 'test contest', :banner_title => 'test contest', :banner_subtitle => 'test contest', :raw_post => "<script></script>")
    cat.save!
    assert_equal cat.post, "&lt;script>&lt;/script>"
  end


  def test_current
    assert_equal Contest.get_active, contests(:current)
  end

end
