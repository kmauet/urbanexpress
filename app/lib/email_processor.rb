class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    # all of your application-specific code here - creating models,
    # processing reports, etc

    # here's an example of model creation
    #user = User.find_by_email(@email.from[:email])
    Message.create!(
      body: @email.body,
      quote_id: Quote.first.id
    )
  end
end

