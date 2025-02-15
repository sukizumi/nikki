# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "seedの実行を開始"

Admin.create!(
  email: 'admin@example.com',
  password: 'poipoi'
)

tsuyoshi = User.find_or_create_by!(email: "tsuyoshi@gmail.com") do |user|
  user.name = "草薙チャンネル"
  user.gender = "male"
  user.height = "200"
  user.weight = "100"
  user.password = "poipoi"
end

takuya = User.find_or_create_by!(email: "takuya@gmail.com") do |user|
  user.name = "キムタク"
  user.gender = "male"
  user.height = "190"
  user.weight = "95"
  user.password = "poipoi"
end

goro = User.find_or_create_by!(email: "goro@gmail.com") do |user|
  user.name = "ゴロちゃん"
  user.gender = "male"
  user.height = "230"
  user.weight = "144"
  user.password = "poipoi"
end

shingo = User.find_or_create_by!(email: "shingo@gmail.com") do |user|
  user.name = "香取慎吾"
  user.gender = "male"
  user.height = "221"
  user.weight = "113"
  user.password = "poipoi"
end

 akiko = User.find_or_create_by!(email: "akiko@gmail.com") do |user|
  user.name = "和田アキ子"
  user.gender = "female"
  user.height = "174"
  user.weight = "68"
  user.password = "poipoi"
end

Post.find_or_create_by!(text: "1本満足バーを20本食べてしまいました。SHAKEを20回踊っても帳消しにできないかもなあ。") do |post|
  post.date = "2025-02-12"
  post.weight = "110"
  post.step = "23000"
  post.food = "bad"
  post.text = "1本満足バーを20本食べてしまいました。SHAKEを20回踊っても帳消しにできないかもなあ。"
  post.user = tsuyoshi
end

Post.find_or_create_by!(text: "1本満足バーを23本食べてしまいました。夜空ノムコウを23回歌っても帳消しにできないかもなあ。") do |post|
  post.date = "2025-02-13"
  post.weight = "115"
  post.step = "12000"
  post.food = "bad"
  post.text = "1本満足バーを23本食べてしまいました。夜空ノムコウを23回歌っても帳消しにできないかもなあ。"
  post.user = tsuyoshi
end

Post.find_or_create_by!(text: "今日は昼食しか摂りませんでした。ちなみに内容としては、玄米と味噌汁と冷奴と1本満足バーです。") do |post|
  post.date = "2025-02-15"
  post.weight = "92"
  post.step = "12000"
  post.food = "good"
  post.text = "今日は昼食しか摂りませんでした。ちなみに内容としては、玄米と味噌汁と冷奴と1本満足バーです。"
  post.user = takuya
end

Post.find_or_create_by!(text: "永谷園の煮込みラーメンを3食分食べました。") do |post|
  post.date = "2025-02-02"
  post.weight = "65"
  post.step = "500"
  post.food = "normal"
  post.text = "永谷園の煮込みラーメンを3食分食べました。"
  post.user = akiko
end




puts "seedの実行が完了しました"