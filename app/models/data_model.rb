require 'httparty'

class DataModel < ApplicationRecord
  validates :name, presence: true
  validates :data, presence: true

  after_save :send_whatsapp_notification

  def send_whatsapp_notification
    url = 'https://graph.facebook.com/v18.0/190698497465239/messages'
    headers = {
      'Authorization' => 'Bearer EAAJpa87xXS8BOZCn9ZBdZCmwvczac2LjMXcbj8ORA1Bk85LbGY5z6zqklyKHlAVkCIQYGSUy5QZBCQO0J77qZAnoyI4WTxCWSz4N8cNZCSsUY1XmLKZBCuIUIQQrCF8PIIeakQIZA3r9M633MtP12xDjuo2aeOK0D2mqeBzjdbOsI3oWXGFzXM9hFrPcPOFgW4Cf0kgrjFs5o1HHsEkFHyN5p0AiZBDEZD',
      'Content-Type' => 'application/json'
    }
    body = {
      messaging_product: 'whatsapp',
      to: '917625031587',
      type: 'template',
      template: {
        name: 'hello_world',
        language: { code: 'en_US' }
      }
    }.to_json

    response = HTTParty.post(url, headers: headers, body: body)

    if response.success?
      puts 'WhatsApp notification sent successfully!'
    else
      puts 'Failed to send WhatsApp notification'
      puts "Response code: #{response.code}"
      puts "Response body: #{response.body}"
    end
  end
end
