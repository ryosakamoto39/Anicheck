crumb :root do
  link "トップ", root_path
end

crumb :log_in do |root|
  link "ログイン", new_user_session_path
  parent :root, root
end

crumb :sign_in do |root|
  link "新規登録", new_user_registration_path
  parent :root, root
end

crumb :new_item do |root|
  link "作品登録", new_item_path
  parent :root, root
end

crumb :user do |root|
  link User.find(params[:id]).name, user_path
  parent :root, root
end

crumb :message do |user|
  link "メッセージ", room_path
  parent :user, user
end

crumb :item do |root|
  link Item.find(params[:id]).title, item_path
  parent :root, root
end

crumb :search do |root|
  link "検索結果", search_path
  parent :root, root
end

crumb :item_list do |root|
  link "作品一覧", items_path
  parent :root, root
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
