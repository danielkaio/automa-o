Dado('que acesso a página de cadastro') do
   visit  "http://localhost:3000/signup"
   sleep 10
   
end
  
Quando('submeto o meu cadastro completo') do
  find("#fullName").set "Carlos sergio"
  find("#email").set "dani.ajala@hotmail.com"
  find("#password").set "12345@"
  click_button"Cadastrar"
  
end
  
Então('sou redirecionado para o Dashboard') do
  
  
end
