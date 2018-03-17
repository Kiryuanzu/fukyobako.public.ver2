module ApplicationHelper
  #devisesフォルダ以外のviewでもdevise関係のメソッドが使えるようになる
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
