require 'mongo'

Dado('que acesso a página de cadastro') do
   visit  "http://localhost:3000/signup"
   sleep 5
   
end

Quando('submeto o meu cadastro completo') do
  client = Mongo::Client.new('mongodb://rocklov-db:27017/rocklov')
  users = collection = client[:users]
  result = collection.delete_many({ email:"dani.ajala@yahoo.com"})
  find("#fullName").set "daniel"
  find("#email").set "dani.ajala@yahoo.com"
  find("#password").set "12345@"
  click_button"Cadastrar"
  
end
  
Então('sou redirecionado para o Dashboard') do
  expect(page).to have_css ".dashboard"
  sleep 10
  
end



Quando('submeto o meu cadastro sem o nome') do
  find("#email").set Faker::Internet.free_email #=> "freddy@gmail.com"
  find("#password").set "12345@"
  click_button"Cadastrar"
end

Então('vejo a mensagem de alerta: Oops. Informe seu nome completo!') do

  alert = find(".alert-dark")
  expect(alert.text).to eql "Oops. Informe seu nome completo!"
  sleep 5
  
 
end

Quando('submeto o meu cadastro sem o email') do
  find("#fullName").set "Carlos sergio"
  find("#password").set "12345@"
  click_button"Cadastrar"
end

Quando('submeto o meu cadastro com email incorreto') do
  find("#fullName").set "Carlos sergio"
  find("#email").set "dani_@"
  find("#password").set "12345@"
  click_button"Cadastrar"
  
  
end


Então('vejo a mensagem de alerta: Oops. Informe um email válido!') do
  alert = find(".alert-dark")
  expect(alert.text).to eql "Oops. Informe um email válido!"
  sleep 5
end

Quando('submeto o meu cadastro sem a senha') do
  find("#fullName").set "Carlos sergio"
  find("#email").set Faker::Internet.free_email #=> "freddy@gmail.com"
  click_button"Cadastrar"
end

Então('vejo a mensagem de alerta: Oops. Informe sua senha secreta!') do
  alert = find(".alert-dark")
  expect(alert.text).to eql "Oops. Informe sua senha secreta!"
  sleep 5
end



