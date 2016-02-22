require 'test_helper'

class AthletesNewTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "invalid new athlete information" do
    log_in_as(@user)
    get new_athlete_path
    assert_no_difference 'Athlete.count' do
      post athletes_path, athlete: { name:  "",
                                     event: "user@invalid"}
    end
    assert_template 'athletes/new'
  end

  test "valid new athlete information" do
    log_in_as(@user)
    get new_athlete_path
    assert_difference 'Athlete.count', 1 do
      post_via_redirect athletes_path, athlete: { name:  "Example User",
                                                  event: "javelin"}
    end
    assert_template 'athletes/index'
    assert is_logged_in?
  end
end
