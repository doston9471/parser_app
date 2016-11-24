require "rubygems"
require "nokogiri"
require "open-uri"
require "json"
class FoodsController < ApplicationController
  def index

    page = open("http://ihale.manas.edu.kg/kki.php/")
    doc = Nokogiri::HTML(page)
    myArr = Array.new
    trs= doc.css('tr')
    trs.each do |f|
      tdata = f.css('td')
      arr = Array.new
      counter=0
      tdata.each do |td|
        counter=counter+1
        if counter == 1
          arr.push(
          date: td.text
          )
        elsif counter == 2
          arr.push(
          food1: td.text
          )
        elsif counter == 3
          arr.push(
          calorie1: td.text
          )
        elsif counter == 4
          arr.push(
          food2: td.text
          )
        elsif counter == 5
          arr.push(
          calorie2: td.text
          )
        elsif counter == 6
          arr.push(
          food3: td.text
          )
        elsif counter == 7
          arr.push(
          calorie3: td.text
          )
        elsif counter == 8
          arr.push(
          food4: td.text
          )
        elsif counter == 9
          arr.push(
          calorie4: td.text
          )
        elsif counter == 10
          arr.push(
          ekmek: td.text
          )
        elsif counter == 11
          arr.push(
          calorieE: td.text
          )
        elsif counter == 12
          arr.push(
          total: td.text
          )
        end
      end
      myArr.push(arr)
    end
    render json: JSON.pretty_generate(myArr)
  end
end

# myArr = Array.new
# trs= doc.css('tr')
# trs.each do |f|
#   tdata = f.css('td')
#   arr = Array.new
#   counter=0
#   tdata.each do |td|
#     counter=counter+1
#     if counter == 1
#       date=td.text
#     elsif counter == 2
#       food1 = td.text
#     elsif counter == 3
#       calorie1 = td.text
#     elsif counter == 4
#       food2 = td.text
#     elsif counter == 5
#       calorie2 = td.text
#     elsif counter == 6
#       food3 = td.text
#     elsif counter == 7
#       calorie3 = td.text
#     elsif counter == 8
#       food4 = td.text
#     elsif counter == 9
#       calorie4 = td.text
#     elsif counter == 10
#       ekmek = td.text
#     elsif counter == 11
#       calorieE = td.text
#     elsif counter == 12
#       total = td.text
#     end
#     arr.push(
#     date: date,
#     food1: food1,
#     calorie1: calorie1,
#     food2: food2,
#     calorie2: calorie2,
#     food3: food3,
#     calorie3: calorie3,
#     food4: food4,
#     calorie4: calorie4,
#     ekmek: ekmek,
#     calorieE: calorieE,
#     total: total
#     )
#   end
#   myArr.push(arr)
# end
