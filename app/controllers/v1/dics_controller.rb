module V1
  class DicsController < ApplicationController
    def create
      dic = Dic.new(dic_params)
      # binding.pry
      if dic.save
        render json: dic, status: 201
      end
    end

    private
    def dic_params
      params.require(:dic).permit(:word, :createdtime, :book, :author, :language, :usage, :translation, :basic_explains)
    end
  end
end
