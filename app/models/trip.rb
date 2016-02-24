class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :destinations, dependent: :destroy
  has_many :pins, through: :destinations

  before_create :set_color

  def hex_color=(str)
    str = str.gsub("#","")
    str = str*2 if str.length == 3
    self.color = str.to_i(16)
  end

  def hex_color
    color.to_s(16).rjust(6,"0").prepend("#")
  end

  private

  def set_color
    #TODO select default color from palette
    last_color = Trip.last.try(:color)
    if not last_color
      self.hex_color = "000"
    else
      self.color = (last_color + 32)%0xAAAAAA
    end
  end

end
