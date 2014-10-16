class FieldController < ApplicationController
  def show
    unless user_signed_in?
      redirect_to "/users/sign_in"
    end
    num = params[:id].to_i
    # 00 01 02 03
    # 04 05 06 07
    # 08 09 10 11
    # 12 13 14 15
    @num = []
    if num - 4 >= 0
      @num << (num - 4)
    else
      @num << -1
    end
    if ((num + 1) % 4) <= 3
      @num << (num + 1)
    else
      @num << -1
    end
    if num + 4 <= 15
      @num << (num + 4)
    else
      @num << -1
    end
    if num - 1 >= 0
      @num << (num - 1)
    else
      @num << -1
    end
  end
  def edit
  end
  def update
    id = params[:id]
    f = Field.where(id: id).first
    unless f
      f = Field.new
    end
    f.id = id
    f.ground = Field.convert_array(params[:dat])
#    f.backbuild = Field.convert_array(params[:back])
#    f.forebuild = Field.convert_array(params[:fore])
    f.save
    tmp = Field.convert_split_type_string(f.ground)
    render text: tmp
  end
  def load
    id = params[:id]
    f = Field.where(id: id).first
    if f
      render text: Field.convert_split_type_string(f.ground)
    else
      render text: "none"
    end
  end
end
