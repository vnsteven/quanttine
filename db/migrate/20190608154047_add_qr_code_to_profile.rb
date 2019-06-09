class AddQrCodeToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :qr_code, :string
  end
end
