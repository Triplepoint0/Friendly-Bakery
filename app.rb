require "sinatra"
require 'sendgrid-ruby'
include SendGrid

get "/" do
    erb :index   
end
  
post "/" do
    from = Email.new(email: 'QueensBakeHouse@qbh.com')
    to = Email.new(email: params[:emailz])
    subject = params[:name]
    content = Content.new(type: 'text/html', value:"
    <p><strong> Thank you for Requesting catering information! Heres our menu:</strong></p>
    <p>Cakes:</p>
    <ul>
        <li>Chocolate Jello Cake ... $29.95</li>
        <li>Oreo Mint Ice Cream Cake ... $29.95</li>
        <li>Blueberry Cheese Cake ... $29.95</li>
    </ul>
    <br>
    <p>Cookie:</p>
    <ul>
        <li>Chocolatechip ... $1.85</li>
        <li>Peanut Butter Chocolate ... $1.85</li>
        <li>Red Velvet ... $1.85</li>
        <li>Cookie Monster ... $1.85</li>
        <li>Double Dhocolatechip Almond ... $1.85</li>
    </ul>
    <p>Muffins:</p>
    <ul>
        <li>Red Velvet ... $2.25</li>
        <li>Mint - $2.25</li>
        <li>Blueberry - $2.25</li>
    </ul>
    ")
    mail = Mail.new(from, subject, to, content)
    mail = Mail.new(from, subject, to, content)
    puts ENV["SENDGRID"]
    sg = SendGrid::API.new(api_key: ENV['SENDGRID'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    # puts response.status_code
    # puts response.body
    # puts response.parsed_body
    # puts response.headers
    redirect "/"
end


get "/cookies" do
    erb :cookies
end

get "/cakes" do
    erb :cakes
end

get "/muffins" do
    erb :muffins

end
# post "/" do
    

# end