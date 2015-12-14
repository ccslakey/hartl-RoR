require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

    def setup
        @user = users(:michael)
    end

    test "layout links" do
        get root_path
        assert_template 'static_pages/home'
        assert_select "a[href=?]", root_path, count: 2
        assert_select "a[href=?]", help_path
        assert_select "a[href=?]", about_path
        assert_select "a[href=?]", contact_path
        get signup_path
        assert_select "title", full_title("Sign up")
    end

    test "layout links when logged in" do
        log_in_as @user
        get root_path
        assert_template 'static_pages/home'
        assert_select "a[href=?]", root_path, count: 2
        assert_select "a[href=?]", help_path
        assert_select "a[href=?]", about_path
        assert_select "a[href=?]", contact_path
        # Now logged in so a "Login" link won't be present
        assert_select "a[href=?]", login_path, count: 0
        # Now logged in so a "Logout" link will be present
        assert_select "a[href=?]", logout_path
        # Now logged in so a "Users" link will be present
        assert_select "a[href=?]", users_path
    end
end
