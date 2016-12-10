require "rubygems"
require "nokogiri"
require "open-uri"
require "json"
class FoodsController < ApplicationController
  def index

    page = open("http://ihale.manas.edu.kg/kki.php/")
    doc = Nokogiri::HTML(page)
    myArr = Array.new
    newarr = Array.new
    trs= doc.css('tr')
    trs.each do |f|
      tdata = f.css('td')
      arr = Array.new
      counter=0

      tdata.each do |td|
        counter=counter+1
        if counter == 1
          arr.push(td.text)
        elsif counter == 2
          arr.push(td.text)
        elsif counter == 3
          arr.push(td.text)
        elsif counter == 4
          arr.push(td.text)
        elsif counter == 5
          arr.push(td.text)
        elsif counter == 6
          arr.push(td.text)
        elsif counter == 7
          arr.push(td.text)
        elsif counter == 8
          arr.push(td.text)
        elsif counter == 9
          arr.push(td.text)
        elsif counter == 10
          arr.push(td.text)
        elsif counter == 11
          arr.push(td.text)
        elsif counter == 12
          arr.push(td.text)
        end
      end
      myArr.push(arr)
    end

    @foods = Food.all
    if @foods.empty? 
      newarr = myArr.reject(&:empty?)
      newarr.each do |f|
        Food.create(:date => f[0], :firstCourse => f[1], :firstCourseCalorie => f[2], :secondCourse => f[3], :secondCourseCalorie => f[4], :sideDish => f[5], :sideDishCalorie => f[6], :dessert => f[7], :dessertCalorie => f[8], :bread => f[9], :breadCalorie => f[10], :total => f[11])
      end
    end
    respond_to do |format|
      format.html
      format.json { render json: @foods }
    end
    # render json: @foods
  end

  def month
    x = Time.now.strftime("%m/%Y")
    mon = Array.new
    mon.push(
    month: x
    )
    render json: mon[0]
  end

end
