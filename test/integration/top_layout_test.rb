require 'test_helper'

class TopLayoutTest < ActionDispatch::IntegrationTest
  test "top lauout links" do
    get root_path
    assert_template 'top/index'
    assert_select "a[href=?]", root_path  
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", new_user_registration_path
    assert_select "a[href=?]", new_user_session_path
  end

  test "top meta discription" do
    get root_path
    assert_template 'top/index'
    assert_select 'meta[name*=?][content*=?]', "description","布教してほしいお題を投稿する&匿名でお題に対する布教ができるWebサービス", { :count => 2 }
    assert_select 'meta[name*=?][content*=?]', "twitter:description","布教してほしいお題を投稿する&匿名でお題に対する布教ができるWebサービス", { :count => 1 }
    assert_select 'meta[content*=?]', "https://fukyobako.herokuapp.com/assets/letsfukyo-5c6a98d77a551069964fbd86a8e8e4c5f45729bf9f50d8de6a0672b2a7ab94f1.png", { :count => 2 }
  end

end
