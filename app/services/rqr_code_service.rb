class RqrCodeService
  attr_accessor :qrcode,

  def initialize(object)
    @qr_code = RQRCode::QRCode.new(object, size: 3, level: :h )
  end

end
