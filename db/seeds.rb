#coding:utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#   
#
#
cu_array = ["파워포인트 활용과정", "보고능력 향상과정", "학내강사 양성과정", "문제해결 기법과 의사결정 II"]
cu_array.each do |x|
  cu = Curriculum.new
  cu.title = x
  cu.save

end
