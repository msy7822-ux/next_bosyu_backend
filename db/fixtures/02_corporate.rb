User.all.each.with_index do |u, i|
  Corporate.seed do |c|
    c.id = i + 1
    c.user_id = u.id
  end
end
