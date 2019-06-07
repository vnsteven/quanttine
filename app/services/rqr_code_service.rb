class RqrCodeService
  attr_accessor :qrcode,

  def initialize(content)
    @qr_code = RQRCode::QRCode.new(content, size: 4, level: :h )
  end

end
