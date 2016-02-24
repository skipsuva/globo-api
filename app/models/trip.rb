class Trip < ActiveRecord::Base

  @@default_color = "#11a"
  @@palette=%w{550527 467B2D F44708 A10702 D90368 1B3022 4F5D75 F0544F 3C474B 874000 0000CA}

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
    return @@default_color unless color
    color.to_s(16).rjust(6,"0").prepend("#")
  end


  private

  def set_color
    #TODO select default color from palette
    last_color = Trip.last.try(:color)
    if not last_color
      self.hex_color = @@default_color
    else
      # self.color = (last_color + 0xFFFFF)%0xAAAAAA
      # self.color = random_color(0xaa)
      @@color_counter ||= rand(128)
      @@color_counter += 1
      self.hex_color = @@palette[@@color_counter % @@palette.length]
    end
  end

  def random_color(n)
    c = 0
    3.times do
      c = c << 8
      c = c + rand(n)
    end
    c
  end



end
