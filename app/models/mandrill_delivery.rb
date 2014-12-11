require 'mandrill'

class MandrillDelivery
  attr_accessor :message


  def initialize(options)

  end

  def deliver(mail)
    deliver_with_mandrill mail
  end

  def deliver!(mail)
    deliver_with_mandrill mail
  end

  def deliver_with_mandrill(mail)
    if ENV['MANDRILL_API_KEY'].blank?
      throw Exception.new('Missing Mandrill API key! Make sure MANDRILL_API_KEY is set in your environment file!')
    end

    if ENV['MANDRILL_EMAIL_TEMPLATE'].blank?
      throw Exception.new('Missing Mandrill Email Template! Make sure MANDRILL_EMAIL_TEMPLATE is set in your environment file!')
    end

    build_mandrill_message mail
    mandrill_api = Mandrill::API.new ENV['MANDRILL_API_KEY']

    status = mandrill_api.messages.send_template(
        ENV['MANDRILL_EMAIL_TEMPLATE'],
        [
            {
                :name     => 'main',
                :content  => "#{mail.body}"
            }
        ], # Merge Variables
        @message # Message Content
    )

    Rails.logger.info status
  end

  def build_mandrill_message(mail)
    @message = {
        # :from_name      => 'SearchForEnergy',
        # :from_email     => 'donotreply@searchforenergy.com',
        :subject        => "#{mail['subject']}",
        :to             => [
            {
                :email  => "#{mail['to']}",
                :name   => "#{mail['name']}"
            }
        ],
        # :bcc_address    => 'info@searchforenergy.com',
        :html           => mail.body
    }

    unless ENV['EMAIL_FROM_NAME'].blank?
      @message[:from_name] = ENV['EMAIL_FROM_NAME']
    end

    unless ENV['EMAIL_FROM_ADDRESS'].blank?
      @message[:from_email] = ENV['EMAIL_FROM_ADDRESS']
    end

    unless ENV['EMAIL_BCC_ADDRESS'].blank?
      @message[:bcc_address] = ENV['EMAIL_BCC_ADDRESS']
    end
  end
end

