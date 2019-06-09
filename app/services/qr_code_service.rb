class QrCodeService
  attr_accessor :qrcode, :save_as_svg

  def initialize(object)
    @object = object
    @qrcode = RQRCode::QRCode.new(object.to_s)
  end

  def save_as_svg
  @svg = @qrcode.as_svg(offset: 0, color: '000',
                        shape_rendering: 'crispEdges',
                        module_size: 11)
  File.open("app/assets/images/qr_codes/#{@object}.svg", 'w') { |file| file.write("#{@svg}") }
  end

end
