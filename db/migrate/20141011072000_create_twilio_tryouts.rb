class CreateTwilioTryouts < ActiveRecord::Migration
  def change
    create_table :twilio_tryouts do |t|
      t.string :mobilenuber
      t.text :message

      t.timestamps
    end
  end
end
