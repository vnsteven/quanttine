class QrCodeService
  attr_accessor :qrcode, :profile

  def initialize(profile)
    @profile = profile
    @qrcode = RQRCode::QRCode.new(@profile.id.to_s)
  end

  def perform
    save_as_svg
    attach_code_to_profile
  end

  def save_as_svg
  @svg = @qrcode.as_svg(offset: 0, color: '000',
                        shape_rendering: 'crispEdges',
                        module_size: 11)
  File.open("app/assets/images/qr_codes/#{@profile.id}.svg", 'w') { |file| file.write("#{@svg}") }
  end

  def attach_code_to_profile
    @profile.qr_code.attach(io:
      File.open("app/assets/images/qr_codes/#{@profile.id}.svg"), filename: "#{@profile.id}.svg", content_type: "image/svg")
  end

end
