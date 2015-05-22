module V1
  class DicsController < ApplicationController
    include ::Authenticable
    before_action :authenticate_from_token

    def create
      dic = Dic.new(dic_params)
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
